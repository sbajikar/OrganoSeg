% segment current image

%make sure focus is on window
set(hObject, 'Enable', 'off');
drawnow;
set(hObject, 'Enable', 'on');

%check for any deleted objects and remove
if isfield(handles,'centersDeleted')
    handles = rmfield(handles,{'centersDeleted','diametersDeleted','ccDeleted'});
end

%Check for image load
checkImage = isfield(handles,'bulkI');
checkSegment = isfield(handles,'coloredLabels');
if checkImage == 0
    %set to initial values
    set(handles.slider1,'Value',1);
    set(handles.slider2,'Value',100);
    set(handles.slider4,'Value',100);
    set(handles.intensity_number,'String',num2str(1));
    set(handles.window_size_number,'String',num2str(100));
    set(handles.size_threshold_number,'String',num2str(100));
    
    %if no images are loaded, ask
    mb1 = errordlg('Please select an image file');
    %delete after 2 sec
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
else
    %if segmenting, say so,
    mb1 = msgbox('Please wait... segmenting...');
    %find initial values
    selected = get(handles.listbox2,'Value');
    handles.thresh{selected} = get(handles.slider1,'Value');
    handles.ws{selected} = [round(get(handles.slider2,'Value')/10)*10, round(get(handles.slider2,'Value')/10)*10];
    handles.small{selected} = round(get(handles.slider4,'Value'));
    %set text boxes to correct numbers
    set(handles.intensity_number,'String',round(handles.thresh{selected},3));
    set(handles.window_size_number,'String',handles.ws{selected}(1));
    set(handles.size_threshold_number,'String',handles.small{selected});
    
    %Initialize/preallocate
    bulkI = handles.bulkI;
    ws = handles.ws{selected};
    small = handles.small{selected};
    
    if checkSegment == 0
        handles.CC = cell(1,length(bulkI));
        handles.coloredLabels = cell(1,length(bulkI));
        handles.recenters = cell(1,length(bulkI));
        handles.signature = cell(1,length(bulkI));
        handles.imgMasked = cell(1,length(bulkI));
    end
        
    %Load image
    I = bulkI{selected};
    %Sharpen
    K = imsharpen(I);
    %Smooth background
    K = medfilt2(K);
    
    %Opening and closing by reconstruction
    
    %Create structure element
    se = strel('disk', 5);
    
    %Erode and open
    Ie = imerode(K, se);
    Iobr = imreconstruct(Ie, K);
    
    %Opening-closing by reconstruction(Iobrcbr)
    Iobrd = imdilate(Iobr, se);
    Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
    Iobrcbr = imcomplement(Iobrcbr);
    
    %Remove border
    Iobrcbr(1:end,1) = Iobrcbr([2 2:end],2);
    Iobrcbr(1:end,end) = Iobrcbr([2 2:end],end-1);
    Iobrcbr(1,1:end) = Iobrcbr(2,[2 2:end]);
    Iobrcbr(end,1:end) = Iobrcbr(end-1,[2 2:end]);
    
    %Threshold
    bwEdge = zeros(size(I,1),size(I,2));
    fudgeFactor = handles.thresh{selected};
    
    %Multi-scale checkbox?
    if get(handles.checkbox2,'Value') == 1
        for j = 20:10:ws(1)
            bwEdgeIter = adaptivethreshold(Iobrcbr,[j j],fudgeFactor);
            bwEdge = bwEdge+bwEdgeIter;
        end
    else
        bwEdge = adaptivethreshold(Iobrcbr,ws,fudgeFactor);
        
        %DIC Checkbox?
        if get(handles.checkbox3,'Value') == 1
            %Segment on inverted image to capture shadow vs light
            bwEdge2 = adaptivethreshold(imcomplement(Iobrcbr),ws,fudgeFactor);
            %Sum together
            bwEdge = bwEdge|bwEdge2;
            bwEdge = imclose(bwEdge,strel('disk',5));
        end
    end
    
    %save data
    guidata(hObject,handles);
    %store bwEdge
    handles.bwEdge{selected} = bwEdge;
    
    %Remove small noise
    bwsmall = bwareaopen(bwEdge, small);
    
    %Smooth
    bwsmooth = imclose(bwsmall,ones(3,3));
    
    %fill holes
    bw_holes = bwfill(bwsmooth,'holes');
    
    %Store pre-watershed image
    handles.bw_nowater{selected} = bw_holes;
    
    %Watershed checkbox?
    if get(handles.togglebutton4,'Value') == 1
        %Find distance transform and smooth
        dist = bwdist(imcomplement(double(bw_holes)));
        smooth = imgaussfilt(dist,5);
        dist2 = -smooth;
        dist2(~bw_holes) = -Inf;
        
        %Watershed based on distance transform, splitting organoids
        L = watershed(dist2);
        %Remove noise based on size threshold
        bwlil = bwareaopen(L,small);
        %Clear border
        bwfinal = imclearborder(bwlil);
        bwfinal = logical(bwfinal);
        handles.bwfinal{selected} = bwfinal;
    else
        %Clear border
        bw_nobord = imclearborder(bw_holes);
        %make logical
        bwfinal = logical(bw_nobord);
        handles.bwfinal{selected} = bwfinal;
    end
    
    %Add color labels
    CC = bwconncomp(bwfinal);
    handles.CC{selected} = CC;
    CClabel = labelmatrix(CC);
    coloredLabels = label2rgb(CClabel, 'hsv', 'k', 'shuffle');
    
    
    statsBW = regionprops(bwfinal, 'all');
    handles.diameter{selected} = [statsBW.EquivDiameter];
    
    %Label numbers
    centers = [statsBW.Centroid];
    recenters = reshape(centers, 2, length(statsBW))';
    handles.centers{selected} = recenters;
    
    %Find perimeter
    bw_perim = double(bwperim(bwfinal));
    %Make visible (dilate)
    bw_perim_dil = imdilate(bw_perim,ones(3,3));
    
    % %Color perimeter if wanted
    %  imgMasked{i} = imoverlay(I,bw_perim_dil,[183 226 232]./255);
    
    %Normalize raw image to min and max
    I = double(I);
    I = (I - min(I(:)))./(max(I(:)) - min( I(:)));
    
    %Create crop of perimeter and raw image
    imgMasked = imoverlay(I,bw_perim_dil,[0 0 1]);
    
    %Store data
    guidata(hObject,handles);
    
    %Watershed checkbox?
    if get(handles.togglebutton4,'Value') == 1
        %Load pre-watershed
        CC_nowater = bwconncomp(handles.bw_nowater{selected});
        CClabel_nowater = labelmatrix(CC_nowater);
        %Preallocate
        cluster = cell(1,CC_nowater.NumObjects);
        %Determine spheroid numbering
        for k = 1:CC.NumObjects
            %original spheroid cluster
            location = CClabel_nowater(CC.PixelIdxList{k});
            spheroid_orig = round(mode(location(location~=0)));
            %store cluster index
            cluster{spheroid_orig} = [cluster{spheroid_orig} k];
        end
        %Matricize and store
        spheroids_order = cell2mat(cluster);
        handles.spheroids_order{selected} = spheroids_order;
    else
        %Linear spheroid order
        handles.spheroids_order{selected} = 1:CC.NumObjects;
    end
    %Store segmented images
    handles.coloredLabels{selected} = coloredLabels;
    %Store overlayed images
    handles.imgMasked{selected} = imgMasked;
    
    % set(handles.listbox2,'Value',1)
    
    %Display all labels image in GUI
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(coloredLabels,[]);
    
    %Display numbers on top of spheroids
    for j = handles.spheroids_order{selected}
        text(handles.centers{selected}(j,1), handles.centers{selected}(j,2), num2str(j), 'color', 'w');
    end
    
    %Preallocate
    spheroid_str = cell(1,CC.NumObjects);
    
    for j = 1:length(handles.spheroids_order{selected})
        spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{selected}(j))));
    end
    
    set(handles.listbox6,'String',spheroid_str);
    set(handles.listbox6,'Value',1);
    
    cla(handles.axes3);
    axes(handles.axes3);
    
    %Display zoomed in spheroid in GUI
    
    %find bounding box
    boundingBox = {statsBW.BoundingBox};
    handles.boundingBox{selected} = boundingBox;
    bbox = boundingBox{handles.spheroids_order{selected}};
    %extend a little
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    %crop the overlay image
    imshow(imcrop(imgMasked, bbox),[]);
    
    %Display crop image in GUI
    cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
    axes(handles.axes1);
    axesChild = imshow(imgMasked,[]);
    handles.axesChild = axesChild;
    
    delete(mb1);
    
    guidata(hObject,handles);
    
end