function varargout = organoSeg(varargin)
% ORGANOSEG MATLAB code for organoSeg.fig
%      ORGANOSEG, by itself, creates a new ORGANOSEG or raises the existing
%      singleton*.
%
%      H = ORGANOSEG returns the handle to a new ORGANOSEG or the handle to
%      the existing singleton*.
%
%      ORGANOSEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ORGANOSEG.M with the given input arguments.
%
%      ORGANOSEG('Property','Value',...) creates a new ORGANOSEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before organoSeg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to organoSeg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help organoSeg
global globalStruct
% Last Modified by GUIDE v2.5 06-Apr-2017 13:58:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @organoSeg_OpeningFcn, ...
    'gui_OutputFcn',  @organoSeg_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before organoSeg is made visible.
function organoSeg_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to organoSeg (see VARARGIN)

% Choose default command line output for organoSeg
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

uisetpref('clearall');

% nimbus_laf = 'javax.swing.plaf.nimbus.NimbusLookAndFeel';
% javax.swing.UIManager.setLookAndFeel(nimbus_laf);

% set(hObject, 'WindowButtonMotionFcn', @mouseMove);

% javaaddpath('poi-3.8-20120326.jar');
% javaaddpath('poi-ooxml-3.8-20120326.jar');
% javaaddpath('poi-ooxml-schemas-3.8-20120326.jar');
% javaaddpath('xmlbeans-2.3.0.jar');
% javaaddpath('dom4j-1.6.1.jar');
% javaaddpath('stax-api-1.0.1.jar');

% UIWAIT makes organoSeg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = organoSeg_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

varargout{1} = handles.output;

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%call segmentation algorithm
segmentCurrent;
if isfield(handles,'axesChild')
    %set button down function
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
else
end
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%call segmentation algorithm
segmentCurrent;
if isfield(handles,'axesChild')
    %set button down function
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
else
end
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',100);
guidata(hObject,handles);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

%call segmentation algorithm
segmentCurrent;

if isfield(handles,'axesChild')
    %set button down function
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
else
end

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'Value',100);
guidata(hObject,handles);
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%call segmentation algorithm
segmentCurrent;

if isfield(handles,'axesChild')
    %set button down function
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
else
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


set(hObject, 'Enable', 'off');
drawnow;
set(hObject, 'Enable', 'on');

if isfield(handles,'centersDeleted')
    handles = rmfield(handles,{'centersDeleted','diametersDeleted','ccDeleted'});
end

%Check for image load
checkImage = isfield(handles,'bulkI');
if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
else
    %Set slider values equal for all images
    for i = 1:length(handles.bulkI)
        handles.thresh{i} = get(handles.slider1,'Value');
        handles.ws{i} = [round(get(handles.slider2,'Value')/10)*10, round(get(handles.slider2,'Value')/10)*10];
        handles.small{i} = round(get(handles.slider4,'Value'));
        handles.checkWater{i} = get(handles.togglebutton4,'Value');
        handles.checkScale{i} = get(handles.checkbox2,'Value');
        handles.checkDIC{i} = get(handles.checkbox3,'value');
    end
    
    %Initialize/preallocate
    bulkI = handles.bulkI;
    ws = handles.ws;
    small = handles.small;
    CC = cell(1,length(bulkI));
    coloredLabels = cell(1,length(bulkI));
    imgMasked = cell(1,length(bulkI));
    
    %Start segmentation waitbar
    h = waitbar(0,'Please wait... segmenting...');
    for i = 1:length(bulkI)
        %Load images
        I = bulkI{i};
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
        fudgeFactor = handles.thresh{i};
        
        %Multi-scale checkbox?
        if get(handles.checkbox2,'Value') == 1
            for j = 20:10:ws{i}(1)
                bwEdgeIter = adaptivethreshold(Iobrcbr,[j j],fudgeFactor);
                bwEdge = bwEdge+bwEdgeIter;
            end
        else
            bwEdge = adaptivethreshold(Iobrcbr,ws{i},fudgeFactor);
            %DIC Checkbox?
            if get(handles.checkbox3,'Value') == 1
                %Segment inverted image
                bwEdge2 = adaptivethreshold(imcomplement(Iobrcbr),ws{i},fudgeFactor);
                %Sum together
                bwEdge = bwEdge|bwEdge2;
                bwEdge = imclose(bwEdge,strel('disk',5));
            end
        end
        guidata(hObject,handles);
        
        %Remove small noise
        bwsmall = bwareaopen(bwEdge, small{i});
        
        %Smooth
        bwsmooth = imclose(bwsmall,ones(3,3));
        
        %fill holes
        bw_holes = bwfill(bwsmooth,'holes');
        
        %Store pre-watershed image
        handles.bw_nowater{i} = bw_holes;
        
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
            bwlil = bwareaopen(L,small{i});
            %Clear border
            bwfinal = imclearborder(bwlil);
            bwfinal = logical(bwfinal);
            handles.bwfinal{i} = bwfinal;
        else
            %Clear border
            bw_nobord = imclearborder(bw_holes);
            %make logical
            bwfinal = logical(bw_nobord);
            handles.bwfinal{i} = bwfinal;
        end
        
        %Add color labels
        CC{i} = bwconncomp(bwfinal);
        handles.CC = CC;
        CClabel = labelmatrix(CC{i});
        coloredLabels{i} = label2rgb(CClabel, 'hsv', 'k', 'shuffle');
        
        statsBW = regionprops(bwfinal, 'all');
        handles.boundingBox{i} = {statsBW.BoundingBox};
        handles.diameter{i} = [statsBW.EquivDiameter];
        %Label numbers
        centers = [statsBW.Centroid];
        recenters = reshape(centers, 2, length(statsBW))';
        handles.centers{i} = recenters;
        
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
        imgMasked{i} = imoverlay(I,bw_perim_dil,[0 0 1]);
        
        %Store data
        guidata(hObject,handles);
        
        %Watershed checkbox?
        if get(handles.togglebutton4,'Value') == 1
            %Load pre-watershed
            CC_nowater = bwconncomp(handles.bw_nowater{i});
            CClabel_nowater = labelmatrix(CC_nowater);
            %Preallocate
            cluster = cell(1,CC_nowater.NumObjects);
            %Determine spheroid numbering
            for k = 1:CC{i}.NumObjects
                %original spheroid cluster
                location = CClabel_nowater(CC{i}.PixelIdxList{k});
                spheroid_orig = round(mode(location(location~=0)));
                %store cluster index
                cluster{spheroid_orig} = [cluster{spheroid_orig} k];
            end
            %Matricize and store
            spheroids_order = cell2mat(cluster);
            handles.spheroids_order{i} = spheroids_order;
            
        else
            %Linear spheroid order
            handles.spheroids_order{i} = 1:CC{i}.NumObjects;
        end
        %update waitbar
        waitbar(i/length(bulkI))
    end
    
    %Store segmented images
    handles.coloredLabels = coloredLabels;
    %Store overlayed images
    handles.imgMasked = imgMasked;
    
    set(handles.listbox2,'Value',1)
    
    %Display all labels image in GUI
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(coloredLabels{1},[]);
    
    %Display numbers on top of spheroids
    for j = handles.spheroids_order{1}
        text(handles.centers{1}(j,1), handles.centers{1}(j,2), num2str(j), 'color', 'w');
    end
    
    %Preallocate
    spheroid_str = cell(1,CC{1}.NumObjects);
    
    for j = 1:length(handles.spheroids_order{1})
        spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{1}(j))));
    end
    
    set(handles.listbox6,'String',spheroid_str);
    set(handles.listbox6,'Value',1);
    
    cla(handles.axes3);
    axes(handles.axes3);
    
    %Display zoomed in spheroid in GUI
    
    %find bounding box
    bbox = handles.boundingBox{1}{handles.spheroids_order{1}};
    %extend a little
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    %crop the overlay image
    imshow(imcrop(imgMasked{1}, bbox),[]);
    
    %Display crop image in GUI
    cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
    axes(handles.axes1);
    axesChild = imshow(imgMasked{1},[]);
    handles.axesChild = axesChild;
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
    
    %Close waitbar
    close(h);
    guidata(hObject,handles)
end


% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2

if isempty(get(hObject,'String')) == 1
    %do nothing
else
    %Determine selected image
    selected = get(hObject,'Value');
    
    %Load raw images
    bulkI = handles.bulkI;
    
    %Load selected image
    handles.I = bulkI{selected};
    
    guidata(hObject,handles);
    
    %Check for segmentation in general
    if isfield(handles,'coloredLabels') == 0
        %Just display image
        cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
        axes(handles.axes1);
        imshow(bulkI{selected},[]);
        %Check for segmentation of selected image
    elseif isempty(handles.coloredLabels{selected})== 1
        %Just display image
        cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
        axes(handles.axes1);
        imshow(bulkI{selected},[]);
        cla(handles.axes2);
        cla(handles.axes3);
        set(handles.listbox6,'String',[]);
    else
        
        %Set threshold slider to correct threshold
        thresh = handles.thresh;
        set(handles.slider1, 'Value', thresh{selected});
        set(handles.intensity_number,'String',num2str(thresh{selected}));
        %Set window to correct
        ws = handles.ws{selected};
        set(handles.slider2,'Value',ws(1));
        set(handles.window_size_number,'String',num2str(ws(1)));
        %Set size threshold slider to correct size
        small = handles.small{selected};
        set(handles.slider4,'Value',small);
        set(handles.size_threshold_number,'String',num2str(small));
        %Set checkboxes to correct values
        checkWater = handles.checkWater{selected};
        checkScale = handles.checkScale{selected};
        checkDIC = handles.checkDIC{selected};
        set(handles.togglebutton4,'Value',checkWater);
        set(handles.checkbox2,'Value',checkScale);
        set(handles.checkbox3,'Value',checkDIC);
        
        %     %Set waterThresh to correct value
        %     waterThresh = handles.waterThresh{selected};
        %     set(handles.slider5,'Value',waterThresh);
        
        %Load data
        coloredLabels = handles.coloredLabels;
        imgMasked = handles.imgMasked;
        
        %Display segmented image in GUI
        cla(handles.axes2);
        axes(handles.axes2);
        imshow(coloredLabels{selected},[]);
        
        %Display correct number labels
        
        centers_display = handles.centers{selected};
        %Check for removed spheroids and replace NaNs with []
        if isnan(handles.centers{selected}) == 0
        else
            centers_display(isnan(centers_display)) = [];
            centers_display = reshape(centers_display, length(centers_display)./2, 2);
        end
        
        for j = handles.spheroids_order{selected}
            text(centers_display(j,1), centers_display(j,2), num2str(j), 'color', 'w');
        end
        
        %Display correct listbox values
        spheroid_str = cell(1,length(handles.spheroids_order{selected}));
        for j = 1:length(handles.spheroids_order{selected})
            spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{selected}(j))));
        end
        set(handles.listbox6,'String',spheroid_str);
        set(handles.listbox6,'Value',1);
        
        % handles = rmfield(handles,{'CC','ccDeleted','centersDeleted','signatureDeleted','diametersDeleted'});
        
        %Choose bounding box to crop
        bbox = handles.boundingBox{selected}{handles.spheroids_order{selected}(1)};
        bbox(1:2) = bbox(1:2)-5;
        bbox(3:4) = bbox(3:4)+10;
        
        %Display zoom image in GUI
        cla(handles.axes3);
        axes(handles.axes3);
        imshow(imcrop(imgMasked{selected}, bbox),[]);
        
        %Display overlayed image in GUI
        cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
        axes(handles.axes1)
        axesChild = imshow(imgMasked{selected},[]);
        handles.axesChild = axesChild;
        set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
        
    end
end
% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in listbox6.
function listbox6_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
if isempty(get(hObject,'String')) == 1
    %do nothing
else
    %Determine selected image
    selected = get(handles.listbox2,'Value');
    %Determine selected spheroid
    spheroid = handles.spheroids_order{selected}(get(hObject,'Value'));
    %Load connected components
    CC = handles.CC{selected};
    
    %Check for watershed splitting
    if get(handles.togglebutton4,'Value') == 1
        
        %Create temp CC
        CC_temp = CC;
        CC_temp.PixelIdxList = CC.PixelIdxList(~cellfun('isempty',CC.PixelIdxList));
        CC_temp.NumObjects = length(CC_temp.PixelIdxList);
        %Create bounding box matrix
        statsBW_temp = regionprops(CC_temp);
        handles.boundingBox{selected} = {statsBW_temp.BoundingBox};
        
        %Load CC/ CClabel prior to watershed
        CC_nowater = bwconncomp(handles.bw_nowater{selected});
        CClabel_nowater = labelmatrix(CC_nowater);
        %For given spheroid, load it's source cluster
        location = CClabel_nowater(CC_temp.PixelIdxList{spheroid});
        spheroid_orig = round(mode(location(location~=0)));
        
        %Load CC label and perimeter crop after watershed
        CClabel = labelmatrix(CC_temp);
        imgMasked = handles.imgMasked{selected};
        
        %Define perimeter of selected spheroid
        spheroid_perim = bwperim(CClabel == spheroid);
        spheroid_perim_dil = imdilate(spheroid_perim,ones(3,3));
        %Label selected spheroid red overlayed on top of blue watershed crop
        imgMasked_new = imoverlay(imgMasked,spheroid_perim_dil,[1 0 0]);
        
        
        %Determine bounding box of pre-watershed cluster
        statsBW = regionprops(handles.bw_nowater{selected});
        boundingBox = {statsBW.BoundingBox};
        bbox = boundingBox{spheroid_orig};
        bbox(1:2) = bbox(1:2)-5;
        bbox(3:4) = bbox(3:4)+10;
        
        %Display cropped cluster (blue), with selected spheroid highlighted (red)
        cla(handles.axes3);
        axes(handles.axes3);
        imshow(imcrop(imgMasked_new, bbox),[]);
        
    else
        %Determine bounding box
        boundingBox = handles.boundingBox{selected};
        bbox = boundingBox{spheroid};
        bbox(1:2) = bbox(1:2)-5;
        bbox(3:4) = bbox(3:4)+10;
        %Display cropped spheroid
        cla(handles.axes3);
        axes(handles.axes3);
        imgMasked = handles.imgMasked{selected};
        imshow(imcrop(imgMasked, bbox),[]);
    end
end

% --- Executes during object creation, after setting all properties.
function listbox6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

%Check for key presses
modifier = eventdata.Modifier;
key = eventdata.Key;
%Determine if control+o is pressed
modCheck = strcmp(modifier,'control');
keyCheck = strcmp(key,'o');
if keyCheck == 0
    %Don't do anything
elseif  modCheck && keyCheck
    %Call newOpen
    newOpen_Callback(hObject,eventdata,handles)
end

function MyCustomAxesButtonDownFunction(hObject, eventData, handles)

%Check if Spheroid Removal Tool is checked
if get(handles.checkbox6,'Value') == 1
    
    %Load selected image
    selected = get(handles.listbox2,'Value');
    %Load coordinates of click
    [coords] = get(handles.axes1,'CurrentPoint');
    %Initialize/pre-allocate
    centers = handles.centers{selected};
    diameters = handles.diameter{selected};
    I = handles.bulkI{selected};
    coloredLabels = handles.coloredLabels{selected};
    imgMasked = handles.imgMasked{selected};
    CC = handles.CC;
    %     if isfield(handles,'CClabel') == 1
    %         CClabel = handles.CClabel;
    %     end
    
    %Check if any images have already had spheroids deleted
    if isfield(handles,'centersDeleted') == 0
        
        %Create storage variable for deleted spheroid centers, signatures,
        %diameters, CCs
        handles.centersDeleted = cell(1,length(CC));
        handles.diametersDeleted = cell(1,length(CC));
        handles.ccDeleted = cell(1,length(CC));
        %Pre-allocate
        centersDeleted = zeros(length(CC{selected}.PixelIdxList),2);
        diametersDeleted = zeros(1,length(CC{selected}.PixelIdxList));
        ccDeleted = cell(1,size(centers,1));
        
        %Check to see if current image has had spheroids removed, if no...
    elseif isempty(handles.centersDeleted{selected}) == 1
        %Pre-allocate
        centersDeleted = zeros(length(CC{selected}.PixelIdxList),2);
        diametersDeleted = zeros(1,length(CC{selected}.PixelIdxList));
        ccDeleted = cell(1,size(centers,1));
        
        %if yes
    else
        %Load previously initizialized deleted objects
        centersDeleted = handles.centersDeleted{selected};
        diametersDeleted = handles.diametersDeleted{selected};
        ccDeleted = handles.ccDeleted{selected};
    end
    
    %Search through centers
    for i = 1:size(centers,1)
        
        %If click is within spheroid's (centerpoint+radius)
        if any(CC{selected}.PixelIdxList{i}==sub2ind(size(I),round(coords(1,2)),round(coords(1,1))))
            
            %         if ((coords(1,1)-centers(i,1))^2+(coords(1,2)-centers(i,2))^2) <= (diameters(i)/2)^2
            %If yes,
            %store spheroid's CC data in ccDeleted
            ccDeleted{i} = CC{selected}.PixelIdxList{i};
            %Remove spheroid's CC data
            CC{selected}.PixelIdxList{i} = [];
            %store spheroid's center and diameter data in centersDeleted
            centersDeleted(i,:) = centers(i,:);
            diametersDeleted(i) = handles.diameter{selected}(i);
            %remove spheroid's center and diameter data
            centers(i,:) = NaN;
            handles.diameter{selected}(i) = NaN;
            
            %Create NEW label matrix without spheroid
            CClabel = labelmatrix(CC{selected});
            coloredLabels = label2rgb(CClabel,'hsv','k','shuffle');
            
            %Convert CClabel to bw
            bwMock = CClabel;
            bwMock(bwMock > 0) = 1;
            handles.bwfinal{selected} = logical(bwMock);
            
            %Find perimeter and crop with raw image
            bw_perim = double(bwperim(bwMock));
            bw_perim_dil = imdilate(bw_perim,ones(3,3));
            I = double(I);
            I = (I - min(I(:)))./(max(I(:)) - min( I(:)));
            imgMasked = imoverlay(I,bw_perim_dil,[0 0 1]);
            %             imgMasked = imoverlay(handles.I,bwMock);
            
            %exit loop
            break
            
            %Check for click being within a previously deleted spheroid
        elseif any(ccDeleted{i}==sub2ind(size(I),round(coords(1,2)),round(coords(1,1))))
            %         elseif ((coords(1,1)-centersDeleted(i,1))^2+(coords(1,2)-centersDeleted(i,2))^2) <= (diametersDeleted(i)/2)^2
            %Restore CC data from ccDeleted
            CC{selected}.PixelIdxList{i} = ccDeleted{i};
            
            %Restore centers and diameters
            centers(i,:) = centersDeleted(i,:);
            handles.diameter{selected}(i) = diametersDeleted(i);
            %Remove restored data from centersDeleted and ccDeleted
            centersDeleted(i,:) = NaN;
            ccDeleted{i} = [];
            diametersDeleted(i) = NaN;
            
            %Re-create CClabel
            CClabel = labelmatrix(CC{selected});
            coloredLabels = label2rgb(CClabel,'hsv','k','shuffle');
            %             grayLabel = rgb2gray(coloredLabels);
            %             grayLabel(grayLabel > 0) = 1;
            %             bwMock = grayLabel;
            
            %Convert CClabel to bw
            bwMock = CClabel;
            bwMock(bwMock > 0) = 1;
            handles.bwfinal{selected} = logical(bwMock);
            
            %Find perimeter and crop with raw image
            bw_perim = double(bwperim(bwMock));
            bw_perim_dil = imdilate(bw_perim,ones(3,3));
            I = double(I);
            I = (I - min(I(:)))./(max(I(:)) - min( I(:)));
            imgMasked = imoverlay(I,bw_perim_dil,[0 0 1]);
            
        end
    end
    
    %Store all data in handles
    handles.ccDeleted{selected} = ccDeleted;
    handles.centersDeleted{selected} = centersDeleted;
    handles.diametersDeleted{selected} = diametersDeleted;
    handles.CC = CC;
    handles.centers{selected} = centers;
    handles.diameters{selected} = diameters;
    handles.coloredLabels{selected} = coloredLabels;
    handles.imgMasked{selected} = imgMasked;
    
    %Create temp CC
    CC_temp = CC{selected};
    CC_temp.PixelIdxList = CC{selected}.PixelIdxList(~cellfun('isempty',CC{selected}.PixelIdxList));
    CC_temp.NumObjects = length(CC_temp.PixelIdxList);
    %Create bounding box matrix
    statsBW_temp = regionprops(CC_temp);
    handles.boundingBox{selected} = {statsBW_temp.BoundingBox};
    
    %Create new spheroid order matrix
    %Watershed checkbox?
    if get(handles.togglebutton4,'Value') == 1
        %Load pre-watershed
        CC_nowater = bwconncomp(handles.bw_nowater{selected});
        CClabel_nowater = labelmatrix(CC_nowater);
        %Preallocate
        cluster = cell(1,CC_nowater.NumObjects);
        
        %Determine spheroid numbering
        for k = 1:CC_temp.NumObjects
            %original spheroid cluster
            location = CClabel_nowater(CC_temp.PixelIdxList{k});
            spheroid_orig = round(mode(location(location~=0)));
            %store cluster index
            cluster{spheroid_orig} = [cluster{spheroid_orig} k];
        end
        %Matricize and store
        spheroids_order = cell2mat(cluster);
        handles.spheroids_order{selected} = spheroids_order;
    else
        %Linear spheroid order
        handles.spheroids_order{selected} = 1:CC_temp.NumObjects;
    end
    
    
    %Display correct listbox values
    spheroid_str = cell(1,length(handles.spheroids_order{selected}));
    for j = 1:length(handles.spheroids_order{selected})
        spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{selected}(j))));
    end
    set(handles.listbox6,'String',spheroid_str);
    set(handles.listbox6,'Value',1);
    
    guidata(hObject,handles);
    %Display all labels in GUI
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(coloredLabels,[]);
    
    %Display correct number labels
    centers_display = handles.centers{selected};
    %Check for removed spheroids and replace NaNs with []
    if isnan(handles.centers{selected}) == 0
    else
        centers_display(isnan(centers_display)) = [];
        centers_display = reshape(centers_display, length(centers_display)./2, 2);
    end
    
    for j = handles.spheroids_order{selected}
        text(centers_display(j,1), centers_display(j,2), num2str(j), 'color', 'w');
    end
    
    %Choose bounding box to crop
    %     bbox = handles.boundingBox{selected}{1};
    bbox = handles.boundingBox{selected}{handles.spheroids_order{selected}(1)};
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    
    %Display zoom image in GUI
    cla(handles.axes3);
    axes(handles.axes3);
    imshow(imcrop(imgMasked, bbox),[]);
    
    %Display perimeter crop in GUI
    cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
    axes(handles.axes1);
    axesChild = imshow(imgMasked,[]);
    handles.axesChild = axesChild;
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
end

%Check if Combine Tool is checked
if get(handles.checkbox7,'Value') == 1
    %Determine selected image
    selected = get(handles.listbox2,'Value');
    %Determine coordinates of click
    [coords] = get(handles.axes1,'CurrentPoint');
    handles.coords = coords;
    %Initiailize/pre-allocated
    CC = handles.CC{selected};
    centers = handles.centers{selected};
    diameters = handles.diameter{selected};
    coloredLabels = handles.coloredLabels{selected};
    I = handles.bulkI{selected};
    imgMasked = handles.imgMasked{selected};
    boundingBox = handles.boundingBox{selected};
    %     bw_nowater = handles.bw_nowater{selected};
    %     small = handles.small{selected};
    
    %Search through spheroids
    for i = 1:length(centers)
        %Check if coordinates match spheroid center
        if any(CC.PixelIdxList{i}==sub2ind(size(I),round(coords(1,2)),round(coords(1,1))))
            %If haven't selected first spheroid
            if isfield(handles,'spheroid1')== 0
                %Store spheroid1
                spheroid1 = i;
                handles.spheroid1{selected} = spheroid1;
                CClabel = labelmatrix(CC);
                %Define perimeter of selected spheroid
                spheroid_perim = bwperim(CClabel == spheroid1);
                spheroid_perim_dil = imdilate(spheroid_perim,ones(3,3));
                %Label selected spheroid red overlayed on top of blue watershed crop
                imgMasked = imoverlay(imgMasked,spheroid_perim_dil,[1 0 0]);
                
                %exit loop
                break
                %If have selected first spheroid
            else
                %Initialize spheroid2, spheroid1
                spheroid2 = i;
                spheroid1 = handles.spheroid1{selected};
                %                 CC_nowater = bwconncomp(bw_nowater);
                %                 CClabel_nowater = labelmatrix(CC_nowater);
                %
                %                 CClabel = labelmatrix(CC);
                %                 spheroid_orig = CClabel_nowater(CC.PixelIdxList{spheroid1}(1));
                %                 cluster_pixels = CC_nowater.PixelIdxList{spheroid_orig};
                %                 cluster_label = CClabel(cluster_pixels);
                %                 cluster_spheroids = unique(cluster_label(cluster_label~=0));
                %                 cluster_extras = cluster_spheroids(cluster_spheroids ~= spheroid1 & cluster_spheroids ~= spheroid2);
                %                 CClabel_fake = CClabel;
                %
                %                 if isempty(cluster_extras) == 0
                %                     for k = 1:length(cluster_extras)
                %                         CClabel_fake(CClabel_fake == cluster_extras(k)) = cluster_extras(1);
                %                         extras_dil = imdilate(CClabel_fake == cluster_extras(1),ones(3,3));
                %                     end
                %
                %                     pixels_dil = find(extras_dil);
                %                     [~, ind] = intersect(cluster_pixels,pixels_dil);
                %                     cluster_pixels(ind) = [];
                %                     spheroid_mesh = cluster_pixels;
                %                 else
                %                     spheroid_mesh = cluster_pixels;
                %                 end
                %
                %                 CClabel_fake(spheroid_mesh) = length(centers)+1;
                %                 CClabel(bwareaopen(CClabel_fake == length(centers)+1, min(length(CC.PixelIdxList{spheroid1}),length(CC.PixelIdxList{spheroid2})))) = spheroid1;
                %                 CC_mesh = bwconncomp(CClabel == spheroid1);
                %
                %                 CC.PixelIdxList{spheroid1} = CC_mesh.PixelIdxList{1};
                %                 CC.PixelIdxList{spheroid2} = [];
                
                %Create CClabel
                CClabel = labelmatrix(CC);
                %Label pixels of spheroid2 as spheroid1 (equal)
                CClabel(CC.PixelIdxList{spheroid2}) = spheroid1;
                %Add pixels of spheroid2 to CC of spheroid1
                CC.PixelIdxList{spheroid1} = [CC.PixelIdxList{spheroid1};CC.PixelIdxList{spheroid2}];
                %Remove former pixels of spheroid2 from CC
                CC.PixelIdxList{spheroid2} = [];
                %Remove spheroid1 handle
                handles = rmfield(handles,'spheroid1');
                
                %Add all labels to modified CClabel and store
                coloredLabels = label2rgb(CClabel, 'hsv', 'k', 'shuffle');
                handles.coloredLabels{selected} = coloredLabels;
                
                
                %                 grayLabel = rgb2gray(coloredLabels);
                %                 grayLabel(grayLabel > 0) = 1;
                %bwMock = im2bw(CClabel);
                
                %Convert CClabel to bw
                bwMock = CClabel;
                bwMock(bwMock > 0) = 1;
                handles.bwfinal{selected} = logical(bwMock);
                
                
                %Re-create Signature
                statsBW = regionprops(CClabel, 'all');
                centers = [statsBW.Centroid];
                recenters = reshape(centers, 2, length(statsBW))';
                handles.centers{selected} = recenters;
                
                boundingBox = {statsBW.BoundingBox};
                handles.boundingBox{selected} = boundingBox;
                
                % %Color perimeter if wanted
                %  imgMasked{i} = imoverlay(I,bw_perim_dil,[183 226 232]./255);
                
                %Normalize raw image to min and max
                I = double(I);
                I = (I - min(I(:)))./(max(I(:)) - min( I(:)));
                
                %Determine perimeter and display crop
                bw_perim = double(bwperim(bwMock));
                bw_perim_dil = imdilate(bw_perim,ones(3,3));
                %         imgMasked{i} = imoverlay(I,bw_perim_dil,[183 226 232]./255);
                imgMasked = imoverlay(I,bw_perim_dil,[0 0 1]);
                
                %Store data
                handles.imgMasked{selected} = imgMasked;
                handles.CC{selected} = CC;
                
                
                
                
                guidata(hObject,handles);
                
                %Exit loop
                break
                
            end
        end
    end
    
    %                 imgMasked = imoverlay(handles.I,bwMock);
    
    %Create temp CC
    CC_temp = CC;
    CC_temp.PixelIdxList = CC.PixelIdxList(~cellfun('isempty',CC.PixelIdxList));
    CC_temp.NumObjects = length(CC_temp.PixelIdxList);
    %Create bounding box matrix
    statsBW_temp = regionprops(CC_temp);
    handles.boundingBox{selected} = {statsBW_temp.BoundingBox};
    
    %Create new spheroid order matrix
    %Watershed checkbox?
    if get(handles.togglebutton4,'Value') == 1
        %Load pre-watershed
        CC_nowater = bwconncomp(handles.bw_nowater{selected});
        CClabel_nowater = labelmatrix(CC_nowater);
        %Preallocate
        cluster = cell(1,CC_nowater.NumObjects);
        
        %Determine spheroid numbering
        for k = 1:CC_temp.NumObjects
            %original spheroid cluster
            location = CClabel_nowater(CC_temp.PixelIdxList{k});
            spheroid_orig = round(mode(location(location~=0)));
            %store cluster index
            cluster{spheroid_orig} = [cluster{spheroid_orig} k];
        end
        %Matricize and store
        spheroids_order = cell2mat(cluster);
        handles.spheroids_order{selected} = spheroids_order;
    else
        %Linear spheroid order
        handles.spheroids_order{selected} = 1:CC_temp.NumObjects;
    end
    
    
    %Display correct listbox values
    spheroid_str = cell(1,length(handles.spheroids_order{selected}));
    for j = 1:length(handles.spheroids_order{selected})
        spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{selected}(j))));
    end
    set(handles.listbox6,'String',spheroid_str);
    set(handles.listbox6,'Value',1);
    
    guidata(hObject,handles);
    %Display all labels in GUI
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(coloredLabels,[]);
    
    %Display correct number labels
    centers_display = handles.centers{selected};
    %Check for removed spheroids and replace NaNs with []
    if isnan(handles.centers{selected}) == 0
    else
        centers_display(isnan(centers_display)) = [];
        centers_display = reshape(centers_display, length(centers_display)./2, 2);
    end
    
    for j = handles.spheroids_order{selected}
        text(centers_display(j,1), centers_display(j,2), num2str(j), 'color', 'w');
    end
    
    %Choose bounding box to crop
    bbox = handles.boundingBox{selected}{handles.spheroids_order{selected}(1)};
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    
    %Display zoom image in GUI
    cla(handles.axes3);
    axes(handles.axes3);
    imshow(imcrop(imgMasked, bbox),[]);
    
    %Display perimeter crop in GUI
    axes(handles.axes1);
    axesChild = imshow(imgMasked,[]);
    handles.axesChild = axesChild;
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
end

% --------------------------------------------------------------------
function newOpen_Callback(hObject, eventdata, handles)
% hObject    handle to newOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Reset window size slider
set(handles.slider2,'Value',100);
set(handles.slider1,'Value',1);
set(handles.slider4,'Value',100);
set(handles.togglebutton4,'Value',0);

%Various checks
checkImage = isfield(handles,'bulkI');
checkSegment = isfield(handles,'coloredLabels');
checkDeleted = isfield(handles,'ccDeleted');

%if any spheroids have been removed
if checkDeleted == 1
    %Don't forget to remove "deleted" data
    handles = rmfield(handles,{'ccDeleted','centersDeleted',...
        'diametersDeleted','CC','ws','small','bulkI','coloredLabels',...
        'imgMasked','thresh','centers','diameter',...
        'waterThresh','bw_nowater','boundingBox','spheroids_order',...
        'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
    guidata(hObject,handles);
    %if any images have been segmented
elseif checkSegment == 1
    %remove everything
    handles = rmfield(handles,{'CC','ws','small','bulkI',...
        'coloredLabels','imgMasked','thresh','centers','diameter',...
        'waterThresh','bw_nowater','boundingBox','spheroids_order',...
        'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
    guidata(hObject,handles);
    %if any images have been loaded
elseif  checkImage == 1
    %delete images
    handles = rmfield(handles,'bulkI');
    guidata(hObject,handles);
end


%Clear all axes and listbox
cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
cla(handles.axes2);
cla(handles.axes3);
set(handles.listbox2,'String','');
set(handles.listbox6,'String','');

%Request image file(s)
[filename, baseName] = uigetfile('*.jpg;*.tiff;*.tif;*.png;*.bmp','Select an Image','Multiselect', 'on');


%Load images

%if no entry
if isequal(filename,0)
    %do nothing
    %if single image
elseif iscellstr(filename) == 0
    %initialize
    handles.filename = filename;
    handles.baseName = baseName;
    %set listbox strings to file names
    set(handles.listbox2,'String',filename);
    %load images
    rgb = imread(strcat(baseName,filename));
    %if rgb
    if length(size(rgb))==3
        %convert to grayscale
        bulkI{1} = rgb2gray(rgb);
        %if non-rgb
    else
        %already grayscale
        bulkI{1} = rgb;
    end
    
    %Ask if they want to convert big images to small
    if size(bulkI{1},1) > 768 || size(bulkI{1},2) > 1024
        button = questdlg('Convert images to optimal size? Improves run time of segmentation.',...
            'Resize Images','Yes','No','Yes');
        if strcmpi(button,'Yes')
            bulkI{1} = imresize(bulkI{1},768/size(bulkI{1},1));
            handles.resize{1} = 768/size(bulkI{1},1);
        else
            handles.resize{1} = 1;
        end
    else
        handles.resize{1} = 1;
    end
    
    %display raw image in GUI
    axes(handles.axes1);
    imshow(bulkI{1},[]);
    %set listbox value to 1st image
    set(handles.listbox2,'Value',1);
    
    %Initialize variables
    handles.bulkI = bulkI;
    handles.I = bulkI{1};
    handles.ws{1} = [100,100];
    handles.small{1} = 100;
    handles.thresh{1} = 1;
    handles.waterThresh{1} = 5;
    handles.checkWater{1} = 0;
    handles.checkScale{1} = 1;
    handles.checkDIC{1} = 0;
    handles.m2p = 1;
    
    
    %Set sliders and checkboxes
    set(handles.slider1,'Value',handles.thresh{1});
    set(handles.slider2,'Value',handles.ws{1}(1));
    set(handles.slider4,'Value',handles.small{1});
    set(handles.intensity_number,'String',num2str(handles.thresh{1}));
    set(handles.window_size_number,'String',num2str(handles.ws{1}(1)));
    set(handles.size_threshold_number,'String',num2str(handles.small{1}));
    set(handles.togglebutton4,'Value',handles.checkWater{1});
    set(handles.checkbox2,'Value',handles.checkScale{1});
    set(handles.checkbox3,'Value',handles.checkDIC{1});
    
    guidata(hObject,handles);
    
    %if multiple images
else
    %initialize/pre-aallocate
    handles.filename = filename;
    handles.baseName = baseName;
    bulkI = cell(1,length(filename));
    %Set listbox strings to filenames
    set(handles.listbox2,'String',filename);
    
    %Ask if they want to convert big images to small
    button = questdlg('Convert images to optimal size? Improves run time of segmentation.',...
        'Resize Images','Yes','No','Yes');
    %for all images
    for i = 1:length(filename)
        %load image
        rgb = imread(strcat(baseName,filename{i}));
        %if rgb
        if length(size(rgb))==3
            %convert to grayscale
            bulkI{i} = rgb2gray(rgb);
            %if non-rgb
        else
            bulkI{i} = rgb;
        end
        
        %Ask if they want to convert big images to small
        if size(bulkI{i},1) > 768 || size(bulkI{i},2) > 1024
            if strcmpi(button,'Yes')
                handles.resize{i} = 768/size(bulkI{i},1);
                bulkI{i} = imresize(bulkI{i},768/size(bulkI{i},1));
            else
                handles.resize{i} = 1;
            end
        else
            handles.resize{i} = 1;
        end
        
        %Initialize
        handles.ws{i} = [100,100];
        handles.small{i} = 100;
        handles.thresh{i} = 1;
        handles.waterThresh{i} = 5;
        handles.checkWater{i} = 0;
        handles.checkScale{i} = 1;
        handles.checkDIC{i} = 0;
        handles.m2p = 1;
    end
    
    
    %Set sliders and checkboxes
    set(handles.slider1,'Value',handles.thresh{1});
    set(handles.slider2,'Value',handles.ws{1}(1));
    set(handles.slider4,'Value',handles.small{1});
    set(handles.intensity_number,'String',num2str(handles.thresh{1}));
    set(handles.window_size_number,'String',num2str(handles.ws{1}(1)));
    set(handles.size_threshold_number,'String',num2str(handles.small{1}));
    set(handles.togglebutton4,'Value',handles.checkWater{1});
    set(handles.checkbox2,'Value',handles.checkScale{1});
    set(handles.checkbox3,'Value',handles.checkDIC{1});
    
    %display raw image in GUI
    axes(handles.axes1);
    imshow(bulkI{1},[]);
    
    %Set listbox value to 1st image
    set(handles.listbox2,'Value',1);
    
    %Initialize
    handles.bulkI = bulkI;
    handles.I = bulkI{1};
    
    guidata(hObject,handles);
end
% --------------------------------------------------------------------
function prevOpen_Callback(hObject, eventdata, handles)
% hObject    handle to prevOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Various checks
checkImage = isfield(handles,'bulkI');
checkSegment = isfield(handles,'coloredLabels');
checkDeleted = isfield(handles,'ccDeleted');

%if any spheroids have been removed
if checkDeleted == 1
    %Don't forget to remove "deleted" data
    handles = rmfield(handles,{'ccDeleted','centersDeleted',...
        'diametersDeleted','CC','ws','small','bulkI','coloredLabels',...
        'imgMasked','thresh','centers','diameter',...
        'waterThresh','bw_nowater','boundingBox','spheroids_order',...
        'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
    guidata(hObject,handles);
    %if any images have been segmented
elseif checkSegment == 1
    %remove everything
    handles = rmfield(handles,{'CC','ws','small','bulkI',...
        'coloredLabels','imgMasked','thresh','centers','diameter',...
        'waterThresh','bw_nowater','boundingBox','spheroids_order',...
        'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
    guidata(hObject,handles);
    %if any images have been loaded
elseif  checkImage == 1
    %delete images
    handles = rmfield(handles,'bulkI');
    guidata(hObject,handles);
end

%Clear all axes and listbox
cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
cla(handles.axes2);
cla(handles.axes3);
set(handles.listbox2,'String','');
set(handles.listbox6,'String','');

%Request image set
[filenameNew, baseName] = uigetfile('*.mat' ,'Select an image set');

%If no answer
if isequal(filenameNew,0)
    % do nothing
else
    %
    h = waitbar(0,'Please wait... importing signature...');
    load(strcat(baseName,filenameNew));
    
    handles.baseName = hiddenProps.baseName;
    handles.filename = hiddenProps.filename;
    handles.bulkI = hiddenProps.bulkI;
    handles.CC = hiddenProps.CC;
    for i = 1:length(handles.bulkI)
        CClabel = labelmatrix(handles.CC{i});
        handles.coloredLabels{i} = label2rgb(CClabel, 'hsv', 'k', 'shuffle');
        bwMock = CClabel;
        bwMock(bwMock > 0) = 1;
        handles.bwfinal{i} = logical(bwMock);
        
        statsBW = regionprops(hiddenProps.bwfinal{i}, 'BoundingBox');
        handles.boundingBox{i} = {statsBW.BoundingBox};
        
        %Find perimeter
        bw_perim = double(bwperim(handles.bwfinal{i}));
        %Make visible (dilate)
        bw_perim_dil = imdilate(bw_perim,ones(3,3));
        
        % %Color perimeter if wanted
        %  imgMasked{i} = imoverlay(I,bw_perim_dil,[183 226 232]./255);
        
        %Normalize raw image to min and max
        I = handles.bulkI{i};
        I = double(I);
        I = (I - min(I(:)))./(max(I(:)) - min( I(:)));
        
        %Create crop of perimeter and raw image
        handles.imgMasked{i} = imoverlay(I,bw_perim_dil,[0 0 1]);
        waitbar(i/length(handles.bulkI))
    end
    handles.ccDeleted = hiddenProps.ccDeleted;
    handles.centersDeleted = hiddenProps.centersDeleted;
    handles.diametersDeleted = hiddenProps.diametersDeleted;
    handles.centers = hiddenProps.centers;
    handles.diameter = hiddenProps.diameters;
    handles.thresh = hiddenProps.thresh;
    handles.ws = hiddenProps.ws;
    handles.small = hiddenProps.small;
    handles.waterThresh = hiddenProps.waterThresh;
    handles.spheroids_order = hiddenProps.spheroids_order;
    handles.bw_nowater = hiddenProps.bw_nowater;
    handles.checkWater = hiddenProps.checkWater;
    handles.checkScale = hiddenProps.checkScale;
    handles.checkDIC = hiddenProps.checkDIC;
    
    if isfield(hiddenProps,'m2p')
        handles.m2p = hiddenProps.m2p;
    else
        handles.m2p = 1;
    end
    
    if isfield(hiddenProps,'resize')
        handles.resize = hiddenProps.resize;
    else
        for i = 1:length(handles.bulkI)
            handles.resize{i} = 1;
        end
    end
    
    %Set sliders, textboxes, and checkboxes
    set(handles.slider1,'Value',handles.thresh{1});
    set(handles.slider2,'Value',handles.ws{1}(1));
    set(handles.slider4,'Value',handles.small{1});
    set(handles.intensity_number,'String',num2str(handles.thresh{1}));
    set(handles.window_size_number,'String',num2str(handles.ws{1}(1)));
    set(handles.size_threshold_number,'String',num2str(handles.small{1}));
    set(handles.togglebutton4,'Value',handles.checkWater{1});
    set(handles.checkbox2,'Value',handles.checkScale{1});
    set(handles.checkbox3,'Value',handles.checkDIC{1});
    
    guidata(hObject,handles);
    %Set listbox2 strings to filenames
    filename = handles.filename;
    baseName = handles.baseName;
    set(handles.listbox2,'String',filename);
    set(handles.listbox2,'Value',1);
    %     if iscell(filename) == 0
    %         rgb = imread(strcat(baseName,filename));
    %         if length(size(rgb))==3
    %             bulkI{1} = rgb2gray(rgb);
    %         else
    %             bulkI{1} = rgb;
    %         end
    %     else
    %         bulkI = cell(1,length(filename));
    %         for i = 1:length(filename)
    %             rgb = imread(strcat(baseName,filename{i}));
    %             if length(size(rgb))==3
    %                 bulkI{i} = rgb2gray(rgb);
    %             else
    %                 bulkI{i} = rgb;
    %             end
    %         end
    %     end
    
    
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(handles.coloredLabels{1},[])
    
    %Display correct number labels
    centers_display = handles.centers{1};
    %Check for removed spheroids and replace NaNs with []
    if isnan(handles.centers{1}) == 0
    else
        centers_display(isnan(centers_display)) = [];
        centers_display = reshape(centers_display, length(centers_display)./2, 2);
    end
    
    for j = handles.spheroids_order{1}
        text(centers_display(j,1), centers_display(j,2), num2str(j), 'color', 'w');
    end
    
    %Preallocate
    spheroid_str = cell(1,handles.CC{1}.NumObjects);
    
    for j = 1:length(handles.spheroids_order{1})
        spheroid_str{j} = char(strcat('Spheroid ',{' '},num2str(handles.spheroids_order{1}(j))));
    end
    
    set(handles.listbox6,'String',spheroid_str);
    set(handles.listbox6,'Value',1);
    
    cla(handles.axes3);
    axes(handles.axes3);
    
    %Display zoomed in spheroid in GUI
    
    %find bounding box
    bbox = handles.boundingBox{1}{handles.spheroids_order{1}(1)};
    %extend a little
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    %crop the overlay image
    imshow(imcrop(handles.imgMasked{1}, bbox),[]);
    
    cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
    axes(handles.axes1);
    axesChild = imshow(handles.imgMasked{1},[]);
    handles.axesChild = axesChild;
    set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
    guidata(hObject,handles);
    
    close(h);
end

% --------------------------------------------------------------------
function dropdown1_Callback(hObject, eventdata, handles)
% hObject    handle to dropdown2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%File menu dropdown

% --------------------------------------------------------------------
function dropdown2_Callback(hObject, eventdata, handles)
% hObject    handle to dropdown2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Preferences menu dropdown

% --------------------------------------------------------------------
function metrics_Callback(hObject, eventdata, handles)
% hObject    handle to metrics (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct

%Check for image load
checkImage = isfield(handles,'bulkI');

%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    %%%%%%%%%%%%%%%%%%%%%%%
    %create all example images here
    selected = get(handles.listbox2,'Value');
    spheroid = handles.spheroids_order{selected}(get(handles.listbox6,'Value'));
    
    statsBW = regionprops(handles.bwfinal{selected},'Image','ConvexImage');
    
    %Create perimeters
    convex_perim = bwperim(statsBW(spheroid).ConvexImage);
    convex_perim_dil = imdilate(convex_perim,ones(3,3));
    
    bw_perim = bwperim(statsBW(spheroid).Image);
    bw_perim_dil = imdilate(bw_perim,ones(3,3));
    
    bw_perim_red = zeros(size(bw_perim_dil));
    bw_perim_green = zeros(size(bw_perim_dil));
    bw_perim_blue = bw_perim_dil;
    bw_perim_color = cat(3,bw_perim_red,bw_perim_green,bw_perim_blue);
    
    globalStruct.convex_perim = convex_perim;
    globalStruct.bw_perim_color = bw_perim_color;
    
    perim_mask = double(bw_perim_dil);
    perim_mask(bw_perim_dil) = 0.8;
    globalStruct.perim_mask = perim_mask;
    
    %Create area example
    bbox = handles.boundingBox{selected}{spheroid};
    bbox(1) = bbox(1)+0.5;
    bbox(2) = bbox(2)+0.5;
    bbox(3) = bbox(3)-1;
    bbox(4) = bbox(4)-1;
    
    crop = imcrop(handles.bulkI{selected},bbox);
    
    area = statsBW(spheroid).Image;
    area_red = zeros(size(area));
    area_green = zeros(size(area));
    area_blue = area;
    area_color = cat(3,area_red,area_green,area_blue);
    
    %Create mask for opacity
    area_mask = double(area);
    area_mask(area) = 0.4;
    
    area = statsBW(spheroid).Image;
    area_red = area;
    area_green = zeros(size(area));
    area_blue = zeros(size(area));
    area_color_red = cat(3,area_red,area_green,area_blue);
    
    
    globalStruct.crop = crop;
    globalStruct.area_color = area_color;
    globalStruct.area_color_red = area_color_red;
    globalStruct.area_mask = area_mask;
    
    %Create Extent
    
    %create another mask for grid lines
    grid = zeros(size(statsBW(spheroid).Image));
    grid(10:10:end,:) = 0.7;
    grid(:,10:10:end) = 0.7;
    
    globalStruct.grid = grid;
    
    %Create convexArea
    % convexArea = imoverlay(crop,statsBW(37).Image,[0 0 1]);
    
    convexArea = statsBW(spheroid).ConvexImage;
    convexArea_red = zeros(size(convexArea));
    convexArea_green = zeros(size(convexArea));
    convexArea_blue = convexArea;
    convexArea_color = cat(3,convexArea_red,convexArea_green,convexArea_blue);
    
    convexArea_mask = double(convexArea);
    convexArea_mask(convexArea) = 0.4;
    
    globalStruct.convexArea_color = convexArea_color;
    globalStruct.convexArea_mask = convexArea_mask;
    
    %Create Solidity
    grid2 = grid;
    grid2(~statsBW(spheroid).ConvexImage) = 0;
    grid2(convex_perim) = 0.7;
    
    globalStruct.grid2 = grid2;
    
    %Create new cropping for ellipses
    bbox = handles.boundingBox{selected}{spheroid};
    up = 2*round(bbox(4)*0.2/2)/2;
    left = 2*round(bbox(3)*0.2/2)/2;
    ext_h = 2*round(bbox(4)*0.2/2);
    ext_w = 2*round(bbox(3)*0.2/2);
    bbox(1) = bbox(1)-left+0.5;
    bbox(2) = bbox(2)-up+0.5;
    bbox(3) = bbox(3)+ext_w-1;
    bbox(4) = bbox(4)+ext_h-1;
    
    crop_ellipse = imcrop(handles.bulkI{selected},bbox);
    
    %Create Ellipse for ellipse-based metrics
    newAreaHeight = [zeros(up,size(area,2)); area; zeros(up,size(area,2))];
    newArea = [zeros(size(area,1)+ext_h,left) newAreaHeight zeros(size(area,1)+ext_h,left)];
    
    s = regionprops(newArea,{'Centroid' 'MajorAxisLength' 'MinorAxisLength' 'Orientation'});
    
    phi = linspace(0,2*pi,1000);
    cosphi = cos(phi);
    sinphi = sin(phi);
    
    xbar = s.Centroid(1);
    ybar = s.Centroid(2);
    
    a = s.MajorAxisLength/2;
    b = s.MinorAxisLength/2;
    
    theta = pi*s.Orientation/180;
    R = [ cos(theta)   sin(theta); -sin(theta)   cos(theta)];
    
    xy = [a*cosphi; b*sinphi];
    xy = R*xy;
    
    x = xy(1,:) + xbar;
    y = xy(2,:) + ybar;
    
    globalStruct.crop_ellipse = crop_ellipse;
    globalStruct.x = x;
    globalStruct.y = y;
    
    %Create maj axis
    x_Maj = [x(1) x(length(phi)/2)];
    y_Maj = [y(1) y(length(phi)/2)];
    globalStruct.x_Maj = x_Maj;
    globalStruct.y_Maj = y_Maj;
    
    %Create min axis
    x_Min = [x(length(phi)/4) x(length(phi)*3/4)];
    y_Min = [y(length(phi)/4) y(length(phi)*3/4)];
    globalStruct.x_Min = x_Min;
    globalStruct.y_Min = y_Min;
    
    %Create orientation
    x_axis = [s.Centroid(1) size(newArea,2)];
    y_axis = [s.Centroid(2) s.Centroid(2)];
    
    x_maj2 = [s.Centroid(1) x(1)];
    y_maj2 = [s.Centroid(2) y(1)];
    
    globalStruct.x_axis = x_axis;
    globalStruct.y_axis = y_axis;
    globalStruct.x_maj2 = x_maj2;
    globalStruct.y_maj2 = y_maj2;
    
    %Find foci and plot eccentricity
    fociLength = sqrt(a^2-b^2);
    x_foci = [s.Centroid(1)-cos(theta)*fociLength s.Centroid(1)+cos(theta)*fociLength];
    y_foci = [s.Centroid(2)+sin(theta)*fociLength s.Centroid(2)-sin(theta)*fociLength];
    
    globalStruct.x_foci = x_foci;
    globalStruct.y_foci = y_foci;
    
    metricSelection
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global globalStruct

%check if metrics have been selected or if default is necessary
if isfield(globalStruct,'default') == 0
    globalStruct.area = 1;
    globalStruct.majorAxisLength = 0;
    globalStruct.minorAxisLength = 0;
    globalStruct.eccentricity = 1;
    globalStruct.orientation = 0;
    globalStruct.convexArea = 0;
    globalStruct.diameter = 0;
    globalStruct.solidity = 0;
    globalStruct.extent = 0;
    globalStruct.perimeter = 1;
    globalStruct.Z = 0;
    globalStruct.A = 0;
    globalStruct.Phi = 0;
    globalStruct.meanTotalPixels = 0;
    globalStruct.stdTotalPixels = 0;
    globalStruct.p2a = 0;
    globalStruct.CV = 0;
    globalStruct.skewTotalPixels = 0;
    globalStruct.kurtTotalPixels = 0;
    globalStruct.contrast = 1;
    globalStruct.correlation = 1;
    globalStruct.energy = 1;
    globalStruct.homogeneity = 1;
    globalStruct.default = [1 4 10 20 21 22 23];
else
end


%Check for image load
checkImage = isfield(handles,'bulkI');

%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    if isfield(handles,'ccDeleted') == 0
        handles.ccDeleted = cell(1,length(handles.CC));
        handles.centersDeleted = cell(1,length(handles.CC));
        handles.diametersDeleted = cell(1,length(handles.CC));
    end
    
    %Ask for export type/name
    [answer,PathName] = uiputfile({'*.xls','Excel File (*.xls)';'*.mat','MAT File (*.mat)'},'Export Metrics As');
    
    %Create metric signature
    signature = cell(1,length(handles.CC));
    
    if answer == 0
        %do nothing
    else
        h = waitbar(0,'Please wait... compiling metric signature...');
        
        for i = 1:length(handles.CC)
            I = handles.bulkI{i};
            %Create temp CC
            CC_temp = handles.CC{i};
            CC_temp.PixelIdxList = CC_temp.PixelIdxList(~cellfun('isempty',CC_temp.PixelIdxList));
            CC_temp.NumObjects = length(CC_temp.PixelIdxList);
            
            statsBW = regionprops(CC_temp,'all');
            %Store Metrics in Signature
            Area = [statsBW.Area];
            MajorAxisLength = [statsBW.MajorAxisLength];
            MinorAxisLength = [statsBW.MinorAxisLength];
            Eccentricity = [statsBW.Eccentricity];
            Orientation = [statsBW.Orientation];
            ConvexArea = [statsBW.ConvexArea];
            EquivDiameter = [statsBW.EquivDiameter];
            Solidity = [statsBW.Solidity];
            Extent = [statsBW.Extent];
            Perimeter = [statsBW.Perimeter];
            p2a = [statsBW.Perimeter]./[statsBW.Area];
            
            boundingBox = {statsBW.BoundingBox};
            
            %Preallocate for Zernike/Pixel Characteristics
            Z = zeros(1,length(boundingBox));
            A = zeros(1,length(boundingBox));
            Phi = zeros(1,length(boundingBox));
            meanTotalPixels = zeros(1,length(boundingBox));
            stdTotalPixels = zeros(1,length(boundingBox));
            skewTotalPixels = zeros(1,length(boundingBox));
            kurtTotalPixels = zeros(1,length(boundingBox));
            
            for j = 1:length(boundingBox)
                %Find zernike moments
                p = imcrop(handles.bwfinal{i},boundingBox{j});
                if boundingBox{j}(3) > boundingBox{j}(4)
                    p2 = zeros(boundingBox{j}(3)-boundingBox{j}(4),boundingBox{j}(3)+1);
                    p = [p2;p];
                else
                    p2 = zeros(boundingBox{j}(4)+1,boundingBox{j}(4)-boundingBox{j}(3));
                    p = [p2 p];
                end
                [Z(j),A(j),Phi(j)] = Zernikmoment(p,4,2);
                
                %Find Pixel characteristics
                %Create mask of spheroid j
                CClabel = labelmatrix(CC_temp);
                mask = double(CClabel == j);
                %crop mask and raw image
                wholeSpheroid = double(I).*mask;
                %Find pixels of only spheroid
                wholeSpheroidPixels = wholeSpheroid(mask == 1);
                %Calculate mean and std
                meanTotalPixels(j) = mean(wholeSpheroidPixels);
                stdTotalPixels(j) = std(wholeSpheroidPixels);
                skewTotalPixels(j) = skewness(wholeSpheroidPixels);
                kurtTotalPixels(j) = kurtosis(wholeSpheroidPixels);
            end
            
            %Calculate Haralick Features
            %initialize
            glcmFeatures = zeros(4,CC_temp.NumObjects);
            %for all spheroids
            for j = 1:CC_temp.NumObjects
                %crop image around spheroid
                croppedIm = imcrop(I,boundingBox{j});
                %Calculate symmetric graycomatrix
                glcm = graycomatrix(croppedIm,'Symmetric',true);
                %Calculate haralick features of glcm
                glcmFeatures(:,j) = cell2mat(struct2cell(graycoprops(glcm)));
            end
            glcmCells = mat2cell(glcmFeatures,ones(1,4));
            pixelCV = stdTotalPixels./meanTotalPixels;
            signature{i} = {Area; MajorAxisLength; MinorAxisLength; Eccentricity; ...
                Orientation; ConvexArea; EquivDiameter; Solidity; Extent;...
                Perimeter; Z; A; Phi; meanTotalPixels; stdTotalPixels; p2a;...
                pixelCV; skewTotalPixels; kurtTotalPixels};
            
            signature{i} = [signature{i};glcmCells];
            
            m2p = handles.m2p;
            resize = handles.resize{i};
            
            for k = [1 2 3 6 7 10]
                if k == 1||k==6
                    signature{i}{k} = signature{i}{k}./(resize^2);
                    signature{i}{k} = signature{i}{k}.*(m2p^2);
                else
                    signature{i}{k} = signature{i}{k}./resize;
                    signature{i}{k} = signature{i}{k}.*m2p;
                end
            end
            
            
            
            %update waitbar
            waitbar(i/length(handles.CC));
        end
    end
    
    %Check answer
    if answer == 0
        %if no answer, do nothing
    elseif isempty(strfind(answer,'.mat')) == 1
        %if .xls storage (not .mat), do as follows
        
        %identify status of metric selections
        keepMetrics = [globalStruct.area, globalStruct.majorAxisLength globalStruct.minorAxisLength ...
            globalStruct.eccentricity globalStruct.orientation globalStruct.convexArea globalStruct.diameter ...
            globalStruct.solidity globalStruct.extent globalStruct.perimeter ...
            globalStruct.Z globalStruct.A globalStruct.Phi globalStruct.meanTotalPixels ...
            globalStruct.stdTotalPixels globalStruct.p2a globalStruct.CV globalStruct.skewTotalPixels...
            globalStruct.kurtTotalPixels globalStruct.contrast globalStruct.correlation ...
            globalStruct.energy globalStruct.homogeneity];
        keepMetrics = find(keepMetrics);
        %Create string of selected metrics
        metrics = {'Area', 'MajorAxisLength', 'MinorAxisLength', ...
            'Eccentricity', 'Orientation', 'ConvexArea', 'Equivalent Diameter', ...
            'Solidity', 'Extent', 'Perimeter', 'Z', 'A', 'Phi', ...
            'Mean Pixel Intensity', 'Std Pixel Intensity',...
            'Perimeter-to-Area Ratio','C.V. Pixel Intensity','Skewness Pixel Intensity'...
            'Kurtosis Pixel Intesnity','Contrast','Correlation','Energy','Homogeneity'};
        metrics = metrics(keepMetrics);
        
        %update waitbar
        waitbar(1,h,'Please wait...exporting to excel file');
        
        %initialize
        signatureTrimmed = cell(1,length(signature));
        
        for j = 1:length(signature)
            
            %create trimmed version
            signatureTrimmed{j} = signature{j}(keepMetrics,:);
            %create sheet per image
            sheet = j;
            %write to excel file
            topRow = [{'Spheroid #'} metrics];
            dbl = cell2mat(signatureTrimmed{j})';
            numbers = [num2cell((1:length(signatureTrimmed{j}{1}))'), num2cell(dbl)];
            matrix = [topRow;numbers];
            xlswrite(char(strcat(PathName,answer)),matrix,sheet,'A1');
            %             for i = 1:length(metrics)
            %                 xlRange1 = strcat(char('A'+i),'1');
            %                 xlRange2 = strcat(char('A'+i),'2');
            %                 xlswrite(char(strcat(PathName,answer,'.xls')),metrics(i),sheet,xlRange1);
            %                 xlswrite(char(strcat(PathName,answer,'.xls')),signature{j}{i}',sheet,xlRange2);
            %                 waitbar(((i/length(metrics))*(1/length(signature)))+((j-1)/length(signature)));
            %             end
            waitbar(j/length(signature))
        end
        %close waitbar
        close(h);
        %Display message box
        mb = msgbox('Excel export successful!');
        t = timer;
        t.StartDelay = 2;
        t.TimerFcn = @(~,~) delete(mb);
        start(t)
    else
        waitbar(1,h,'Please wait...storing variables...')
        %identify status of metric selections
        keepMetrics = [globalStruct.area, globalStruct.majorAxisLength globalStruct.minorAxisLength ...
            globalStruct.eccentricity globalStruct.orientation globalStruct.convexArea globalStruct.diameter ...
            globalStruct.solidity globalStruct.extent globalStruct.perimeter ...
            globalStruct.Z globalStruct.A globalStruct.Phi globalStruct.meanTotalPixels ...
            globalStruct.stdTotalPixels globalStruct.p2a globalStruct.CV globalStruct.skewTotalPixels...
            globalStruct.kurtTotalPixels globalStruct.contrast globalStruct.correlation ...
            globalStruct.energy globalStruct.homogeneity];
        keepMetrics = logical(keepMetrics);
        metrics = {'Area', 'MajorAxisLength', 'MinorAxisLength', ...
            'Eccentricity', 'Orientation', 'ConvexArea', 'EquivDiameter', ...
            'Solidity', 'Extent', 'Perimeter', 'Z', 'A', 'Phi', ...
            'MeanPixelIntensity', 'StdPixelIntensity',...
            'perimeter2area','cvPixelIntensity','SkewnessPixelIntensity'...
            'KurtosisPixelIntesnity','Contrast','Correlation','Energy',...
            'Homogeneity'};
        
        signatureAllMetrics = signature;
        signatureTrimmed = cell(1,length(signatureAllMetrics));
        signatureStruct = cell(1,length(signatureAllMetrics));
        signatureTrimmedStruct = cell(1,length(signatureAllMetrics));
        
        for k = 1:length(signature)
            signatureTrimmed{k} = signatureAllMetrics{k}(keepMetrics);
            signatureStruct{k} = cell2struct(signature{k},metrics,1);
            signatureTrimmedStruct{k} = cell2struct(signatureTrimmed{k},metrics(keepMetrics),1);
        end
        
        filename = handles.filename;
        bulkI = handles.bulkI;
        CC = handles.CC;
        ccDeleted = handles.ccDeleted;
        centersDeleted = handles.centersDeleted;
        diametersDeleted = handles.diametersDeleted;
        centers = handles.centers;
        diameters = handles.diameter;
        thresh = handles.thresh;
        ws = handles.ws;
        small = handles.small;
        baseName = handles.baseName;
        waterThresh = handles.waterThresh;
        bw_nowater = handles.bw_nowater;
        spheroids_order = handles.spheroids_order;
        checkWater = handles.checkWater;
        checkScale = handles.checkScale;
        checkDIC = handles.checkDIC;
        bwfinal = handles.bwfinal;
        m2p = handles.m2p;
        resize = handles.resize;
        
        
        hiddenString = {'filename','signatureTrimmed', 'signatureAllMetrics','bulkI',...
            'thresh', 'CC','ccDeleted','centersDeleted','diametersDeleted',...
            'centers','diameters','ws', 'small','baseName',...
            'waterThresh','bw_nowater','spheroids_order','checkWater',...
            'checkScale','checkDIC','bwfinal','m2p','resize'};
        
        hiddenCell = [{filename},{signatureTrimmed}, {signatureAllMetrics},{bulkI},...
            {thresh}, {CC},{ccDeleted},{centersDeleted},...
            {diametersDeleted},{centers},{diameters},{ws}, {small},{baseName},...
            {waterThresh},{bw_nowater},{spheroids_order},{checkWater},...
            {checkScale},{checkDIC},{bwfinal}, {m2p}, {resize}]';
        
        hiddenProps = cell2struct(hiddenCell,hiddenString,1);
        
        save(char(strcat(PathName,answer)),'hiddenProps','signatureStruct','signatureTrimmedStruct');
        %Uncheck radio buttons
        %         set(handles.radiobutton1,'Value',0);
        %         set(handles.radiobutton2,'Value',0);
        %         set(handles.radiobutton3,'Value',0);
        %Clear all axes and data
        cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
        cla(handles.axes2);
        cla(handles.axes3);
        handles = rmfield(handles,{'ccDeleted','centersDeleted',...
            'diametersDeleted','CC','ws','small','bulkI','coloredLabels',...
            'imgMasked','thresh','centers','diameter',...
            'waterThresh','bw_nowater','boundingBox','spheroids_order',...
            'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
        
        guidata(hObject,handles);
        set(handles.listbox2,'String','');
        set(handles.listbox6,'String','');
        close(h);
        clearvars -global
        
        %Display message box
        mb = msgbox('Signature export successful!');
        t = timer;
        t.StartDelay = 2;
        t.TimerFcn = @(~,~) delete(mb);
        start(t)
        
    end
end
% --------------------------------------------------------------------
function calibration_Callback(hObject, eventdata, handles)
% hObject    handle to calibration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Pixels:','Microns:'};
dlg_title = 'Calibration';
num_lines = 1;
% defaultans = {'20','hsv'};
answer = inputdlg(prompt,dlg_title,num_lines);
if isempty(answer) == 1
else
    m2p = str2double(answer{2})./str2double(answer{1});
    handles.m2p = m2p;
    %     signature = handles.signature;
    %     signatureMicrons = cell(1,length(signature));
    %     for i = 1:length(signature)
    %         signatureMicrons{i} = cellfun(@(x) x.*m2p,signature{i},'un',0);
    %     end
    %     handles.signature = signatureMicrons;
    guidata(hObject,handles);
end

% % --- Executes on slider movement.
% function slider5_Callback(hObject, eventdata, handles)
% % hObject    handle to slider5 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hints: get(hObject,'Value') returns position of slider
% %        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
% checkImage = isfield(handles,'bulkI');
% if checkImage == 0
%     set(hObject,'Value',handles.waterThresh{1});
%     mb1 = msgbox('Please select image file(s)');
%     t = timer;
%     t.StartDelay = 2;
%     t.TimerFcn = @(~,~) delete(mb1);
%     start(t)
% else
%     selected = get(handles.listbox2,'Value');
%     handles.waterThresh{selected} = round(get(hObject,'Value'));
% end
% guidata(hObject,handles);
%
% % --- Executes during object creation, after setting all properties.
% function slider5_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to slider5 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
%
% % Hint: slider controls usually have a light gray background.
% if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor',[.9 .9 .9]);
% end


% --------------------------------------------------------------------
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function current_Callback(hObject, eventdata, handles)
% hObject    handle to current (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function set_Callback(hObject, eventdata, handles)
% hObject    handle to set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Check for image load
checkImage = isfield(handles,'bulkI');
%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    
    dname = uigetdir('Choose folder to save images');
    if dname == 0
        %do nothing
    else
        %Check for mac vs windows
        k = strfind(dname,'\');
        %if windows
        if isempty(k) == 0
            dname = strcat(dname,'\');
        else
            dname = strcat(dname,'/');
        end
        
        %Check if only 1 image is loaded
        if iscell(handles.filename) == 0
            name = handles.filename;
            imgMasked = handles.imgMasked{1};
            coloredLabels = handles.coloredLabels{1};
            imwrite(imgMasked,char(strcat(dname,name,'_overlay.tif')));
            imwrite(coloredLabels,char(strcat(dname,name,'_colored.tif')));
            %if multiple images are loaded
        else
            for i = 1:length(handles.bulkI)
                name = handles.filename{i};
                ind = find(name == '.',1,'last');
                name(ind:end) = [];
                
                imgMasked = handles.imgMasked{i};
                coloredLabels = handles.coloredLabels{i};
                
                imwrite(imgMasked,char(strcat(dname,name,'_overlay.tif')));
                imwrite(coloredLabels,char(strcat(dname,name,'_colored.tif')));
            end
        end
    end
end

% --------------------------------------------------------------------
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected = get(handles.listbox2,'Value');
spheroid = get(handles.listbox6,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');
%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    imgMasked = handles.imgMasked{selected};
    %Find bounding box to crop
    bbox = handles.boundingBox{selected}{spheroid};
    bbox(1:2) = bbox(1:2)-5;
    bbox(3:4) = bbox(3:4)+10;
    %create zoom image
    crop = imcrop(imgMasked, bbox);
    
    if iscell(handles.filename) == 0
        name = handles.filename;
    else
        name = handles.filename{selected};
    end
    ind = find(name == '.',1,'last');
    name(ind:end) = [];
    
    dname = uigetdir('Choose folder to save images');
    if dname == 0
        %do nothing
    else
        %Check for mac vs windows
        k = strfind(dname,'\');
        %if windows
        if isempty(k) == 0
            dname = strcat(dname,'\');
        else
            dname = strcat(dname,'/');
        end
        %     [answer,PathName] = uiputfile({'*.tif','TIFF image (*.tif)';...
        %         '*.jpg','JPEG Image image (*.jpg)';...
        %         '*.png','Portable Network Graphics image (*.png)';...
        %         '*.gif','Graphics Interchange Format image (*.gif)'},...
        %         'Save All Current Images As',strcat(name,'_colored'));
        
        imwrite(crop,char(strcat(dname,name,'_crop.tif')));
    end
end

% --------------------------------------------------------------------
function all_Callback(hObject, eventdata, handles)
% hObject    handle to all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected = get(handles.listbox2,'Value');
%Check for image load
checkImage = isfield(handles,'bulkI');
%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    imgMasked = handles.imgMasked{selected};
    coloredLabels = handles.coloredLabels{selected};
    
    %determine filename for 'save as' input
    if iscell(handles.filename) == 0
        name = handles.filename;
    else
        name = handles.filename{selected};
    end
    ind = find(name == '.',1,'last');
    name(ind:end) = [];
    
    %Ask for save directory
    dname = uigetdir('Choose folder to save images');
    if dname == 0
        % do nothing
    else
        %Check for mac vs windows
        k = strfind(dname,'\');
        %if windows
        if isempty(k) == 0
            dname = strcat(dname,'\');
        else
            dname = strcat(dname,'/');
        end
        imwrite(imgMasked,char(strcat(dname,name,'_overlay.tif')));
        imwrite(coloredLabels,char(strcat(dname,name,'_colored.tif')));
    end
end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
selected = get(handles.listbox2,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'Value',1);
else
    handles.checkScale{selected} = get(hObject,'Value');
    %Set sliders to reasonable values
    
    if get(hObject,'Value') == 1
        set(handles.slider2,'Value',100);
        handles.ws{selected} = [100 100];
        
    else
        set(handles.slider2,'Value',250);
        handles.ws{selected} = [250 250];
    end
    
    if get(handles.checkbox3,'Value') == 1
        set(handles.checkbox3,'Value',0);
        handles.checkDIC{selected} = 0;
    else
    end
    
    segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
    guidata(hObject,handles);
end
% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3

selected = get(handles.listbox2,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'Value',0);
else
    set(handles.slider2,'Value',20);
    set(handles.checkbox2,'Value',0);
    handles.checkScale{selected} = 0;
    handles.checkDIC{selected} = get(hObject,'Value');
    segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
    guidata(hObject,handles);
end
% --- Executes on button press in checkbox3.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3

%Check for image load
checkImage = isfield(handles,'bulkI');
checkSegment = isfield(handles,'coloredLabels');
if checkImage == 0
    mb1 = errordlg('Please select an image file');
    set(hObject,'Value',0);
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    set(hObject,'Value',0);
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    if get(handles.checkbox7,'Value') == 1
        set(handles.checkbox7,'Value',0);
    else
    end
    
    if get(hObject,'Value') == 1
        uigetpref(...
            'mygraphics',...                        % Group
            'spheroid_remove',...           % Preference
            'Remove Spheroids',...                    % Window title
            {'Click on a spheroid in the "Raw Image" pane to remove it'
            ''
            'Click same location to recover spheroid'},...
            {'never';'Ok'},...
            'ExtraOptions','Cancel',...
            'DefaultButton','Cancel');            % Default choice
    end
end


% --- Executes on button press in checkbox3.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3

%Check for image load
checkImage = isfield(handles,'bulkI');
checkSegment = isfield(handles,'coloredLabels');
if checkImage == 0
    mb1 = errordlg('Please select an image file');
    set(hObject,'Value',0);
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    set(hObject,'Value',0);
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    if get(handles.checkbox6,'Value') == 1
        set(handles.checkbox6,'Value',0);
    else
    end
    
    if get(hObject,'Value') == 1
        uigetpref(...
            'mygraphics',...                        % Group
            'spheroid_combine',...           % Preference
            'Combine Spheroids',...                    % Window title
            {'Click on a spheroid in the "Raw Image" pane to highlight it'
            ''
            'Click on adjacent spheroid to combine with highlighted spheroid'},...
            {'never';'Ok'},...
            'ExtraOptions','Cancel',...
            'DefaultButton','Cancel');
    end
end


% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton4
selected = get(handles.listbox2,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'Value',0);
else
    handles.checkWater{selected} = get(hObject,'Value');
    set(hObject, 'Enable', 'off');
    drawnow;
    set(hObject, 'Enable', 'on');
    
    segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
    
end

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct

%check if metrics have been selected or if default is necessary
if isfield(globalStruct,'default') == 0
    globalStruct.area = 1;
    globalStruct.majorAxisLength = 0;
    globalStruct.minorAxisLength = 0;
    globalStruct.eccentricity = 1;
    globalStruct.orientation = 0;
    globalStruct.convexArea = 0;
    globalStruct.diameter = 0;
    globalStruct.solidity = 0;
    globalStruct.extent = 0;
    globalStruct.perimeter = 1;
    globalStruct.Z = 0;
    globalStruct.A = 0;
    globalStruct.Phi = 0;
    globalStruct.meanTotalPixels = 0;
    globalStruct.stdTotalPixels = 0;
    globalStruct.p2a = 0;
    globalStruct.CV = 0;
    globalStruct.skewTotalPixels = 0;
    globalStruct.kurtTotalPixels = 0;
    globalStruct.contrast = 1;
    globalStruct.correlation = 1;
    globalStruct.energy = 1;
    globalStruct.homogeneity = 1;
    globalStruct.default = [1 4 10 20 21 22 23];
else
end


%Check for image load
checkImage = isfield(handles,'bulkI');

%Check for segmentation
checkSegment = isfield(handles,'coloredLabels');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
elseif checkSegment == 0
    mb3 = errordlg('Please segment images');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb3);
    start(t)
else
    if isfield(handles,'ccDeleted') == 0
        handles.ccDeleted = cell(1,length(handles.CC));
        handles.centersDeleted = cell(1,length(handles.CC));
        handles.diametersDeleted = cell(1,length(handles.CC));
    end
    
    %Ask for export type/name
    [answer,PathName] = uiputfile({'*.xls','Excel File (*.xls)';'*.mat','MAT File (*.mat)'},'Export Metrics As');
    
    if answer == 0
        %do nothing
    else
        mb = msgbox('Please wait... compiling metric signature...');
        %Create metric signature
        %     signature = cell(1,length(handles.CC));
        selected = get(handles.listbox2,'Value');
        
        I = handles.bulkI{selected};
        %Create temp CC
        CC_temp = handles.CC{selected};
        CC_temp.PixelIdxList = CC_temp.PixelIdxList(~cellfun('isempty',CC_temp.PixelIdxList));
        CC_temp.NumObjects = length(CC_temp.PixelIdxList);
        
        statsBW = regionprops(CC_temp,'all');
        %Store Metrics in Signature
        Area = [statsBW.Area];
        MajorAxisLength = [statsBW.MajorAxisLength];
        MinorAxisLength = [statsBW.MinorAxisLength];
        Eccentricity = [statsBW.Eccentricity];
        Orientation = [statsBW.Orientation];
        ConvexArea = [statsBW.ConvexArea];
        EquivDiameter = [statsBW.EquivDiameter];
        Solidity = [statsBW.Solidity];
        Extent = [statsBW.Extent];
        Perimeter = [statsBW.Perimeter];
        p2a = [statsBW.Perimeter]./[statsBW.Area];
        
        boundingBox = {statsBW.BoundingBox};
        
        %Preallocate for Zernike/Pixel Characteristics
        Z = zeros(1,length(boundingBox));
        A = zeros(1,length(boundingBox));
        Phi = zeros(1,length(boundingBox));
        meanTotalPixels = zeros(1,length(boundingBox));
        stdTotalPixels = zeros(1,length(boundingBox));
        skewTotalPixels = zeros(1,length(boundingBox));
        kurtTotalPixels = zeros(1,length(boundingBox));
        
        for j = 1:length(boundingBox)
            %Find zernike moments
            p = imcrop(handles.bwfinal{selected},boundingBox{j});
            if boundingBox{j}(3) > boundingBox{j}(4)
                p2 = zeros(boundingBox{j}(3)-boundingBox{j}(4),boundingBox{j}(3)+1);
                p = [p2;p];
            else
                p2 = zeros(boundingBox{j}(4)+1,boundingBox{j}(4)-boundingBox{j}(3));
                p = [p2 p];
            end
            [Z(j),A(j),Phi(j)] = Zernikmoment(p,4,2);
            
            %Find Pixel characteristics
            %Create mask of spheroid j
            CClabel = labelmatrix(CC_temp);
            mask = double(CClabel == j);
            %crop mask and raw image
            wholeSpheroid = double(I).*mask;
            %Find pixels of only spheroid
            wholeSpheroidPixels = wholeSpheroid(mask == 1);
            %Calculate mean and std
            meanTotalPixels(j) = mean(wholeSpheroidPixels);
            stdTotalPixels(j) = std(wholeSpheroidPixels);
            skewTotalPixels(j) = skewness(wholeSpheroidPixels);
            kurtTotalPixels(j) = kurtosis(wholeSpheroidPixels);
        end
        
        %Calculate Haralick Features
        %initialize
        glcmFeatures = zeros(4,CC_temp.NumObjects);
        %for all spheroids
        for j = 1:CC_temp.NumObjects
            %crop image around spheroid
            croppedIm = imcrop(I,boundingBox{j});
            %Calculate symmetric graycomatrix
            glcm = graycomatrix(croppedIm,'Symmetric',true);
            %Calculate haralick features of glcm
            glcmFeatures(:,j) = cell2mat(struct2cell(graycoprops(glcm)));
        end
        glcmCells = mat2cell(glcmFeatures,ones(1,4));
        pixelCV = stdTotalPixels./meanTotalPixels;
        signature = {Area; MajorAxisLength; MinorAxisLength; Eccentricity; ...
            Orientation; ConvexArea; EquivDiameter; Solidity; Extent;...
            Perimeter; Z; A; Phi; meanTotalPixels; stdTotalPixels; p2a;...
            pixelCV; skewTotalPixels; kurtTotalPixels};
        
        signature = [signature;glcmCells];
        
        resize = handles.resize{selected};
        m2p = handles.m2p;
        
        for k = [1 2 3 6 7 10]
            if k == 1||k==6
                signature{k} = signature{k}./(resize^2);
                signature{k} = signature{k}.*(m2p^2);
            else
                signature{k} = signature{k}./resize;
                signature{k} = signature{k}.*m2p;
            end
        end
        delete(mb);
    end
    %Check answer
    if answer == 0
        %if no answer, do nothing
    elseif contains(answer,'.mat') == 0
        %if .xls storage (not .mat), do as follows
        mb = msgbox('Please wait... exporting to excel file...');
        %identify status of metric selections
        keepMetrics = [globalStruct.area, globalStruct.majorAxisLength globalStruct.minorAxisLength ...
            globalStruct.eccentricity globalStruct.orientation globalStruct.convexArea globalStruct.diameter ...
            globalStruct.solidity globalStruct.extent globalStruct.perimeter ...
            globalStruct.Z globalStruct.A globalStruct.Phi globalStruct.meanTotalPixels ...
            globalStruct.stdTotalPixels globalStruct.p2a globalStruct.CV globalStruct.skewTotalPixels...
            globalStruct.kurtTotalPixels globalStruct.contrast globalStruct.correlation ...
            globalStruct.energy globalStruct.homogeneity];
        keepMetrics = find(keepMetrics);
        %Create string of selected metrics
        metrics = {'Area', 'MajorAxisLength', 'MinorAxisLength', ...
            'Eccentricity', 'Orientation', 'ConvexArea', 'Equivalent Diameter', ...
            'Solidity', 'Extent', 'Perimeter', 'Z', 'A', 'Phi', ...
            'Mean Pixel Intensity', 'Std Pixel Intensity',...
            'Perimeter-to-Area Ratio','C.V. Pixel Intensity','Skewness Pixel Intensity'...
            'Kurtosis Pixel Intesnity','Contrast','Correlation','Energy','Homogeneity'};
        metrics = metrics(keepMetrics);
        
        
        
        %create trimmed version
        signatureTrimmed = signature(keepMetrics);
        
        %write to excel file
        topRow = [{'Spheroid #'} metrics];
        dbl = cell2mat(signatureTrimmed)';
        numbers = [num2cell((1:length(signatureTrimmed{1}))'), num2cell(dbl)];
        matrix = [topRow;numbers];
        xlswrite(char(strcat(PathName,answer)),matrix,1,'A1');
        %             for i = 1:length(metrics)
        %                 xlRange1 = strcat(char('A'+i),'1');
        %                 xlRange2 = strcat(char('A'+i),'2');
        %                 xlswrite(char(strcat(PathName,answer,'.xls')),metrics(i),sheet,xlRange1);
        %                 xlswrite(char(strcat(PathName,answer,'.xls')),signature{j}{i}',sheet,xlRange2);
        %                 waitbar(((i/length(metrics))*(1/length(signature)))+((j-1)/length(signature)));
        %             end
        
        %Display message box
        delete(mb);
        mb = msgbox('Excel export successful!');
        t = timer;
        t.StartDelay = 2;
        t.TimerFcn = @(~,~) delete(mb);
        start(t)
    else
        mb = msgbox('Please wait... storing variables...');
        %identify status of metric selections
        keepMetrics = [globalStruct.area, globalStruct.majorAxisLength globalStruct.minorAxisLength ...
            globalStruct.eccentricity globalStruct.orientation globalStruct.convexArea globalStruct.diameter ...
            globalStruct.solidity globalStruct.extent globalStruct.perimeter ...
            globalStruct.Z globalStruct.A globalStruct.Phi globalStruct.meanTotalPixels ...
            globalStruct.stdTotalPixels globalStruct.p2a globalStruct.CV globalStruct.skewTotalPixels...
            globalStruct.kurtTotalPixels globalStruct.contrast globalStruct.correlation ...
            globalStruct.energy globalStruct.homogeneity];
        keepMetrics = logical(keepMetrics);
        metrics = {'Area', 'MajorAxisLength', 'MinorAxisLength', ...
            'Eccentricity', 'Orientation', 'ConvexArea', 'EquivDiameter', ...
            'Solidity', 'Extent', 'Perimeter', 'Z', 'A', 'Phi', ...
            'MeanPixelIntensity', 'StdPixelIntensity',...
            'perimeter2area','cvPixelIntensity','SkewnessPixelIntensity'...
            'KurtosisPixelIntesnity','Contrast','Correlation','Energy','Homogeneity'};
        
        signatureAllMetrics = {signature};
        %         signatureTrimmed = cell(1,length(signatureAllMetrics));
        %         signatureStruct = cell(1,length(signatureAllMetrics));
        %         signatureTrimmedStruct = cell(1,length(signatureAllMetrics));
        
        signatureTrimmed = {signature(keepMetrics)};
        signatureStruct = cell2struct(signature,metrics,1);
        signatureTrimmedStruct = cell2struct(signatureTrimmed{1},metrics(keepMetrics),1);
        
        if iscell(handles.filename) == 0
            filename = handles.filename;
        else
            filename = handles.filename{selected};
        end
        
        bulkI = {handles.bulkI{selected}};
        CC = {handles.CC{selected}};
        ccDeleted = {handles.ccDeleted{selected}};
        centersDeleted = {handles.centersDeleted{selected}};
        diametersDeleted = {handles.diametersDeleted{selected}};
        centers = {handles.centers{selected}};
        diameters = {handles.diameter{selected}};
        thresh = {handles.thresh{selected}};
        ws = {handles.ws{selected}};
        small = {handles.small{selected}};
        baseName = handles.baseName;
        waterThresh = {handles.waterThresh{selected}};
        bw_nowater = {handles.bw_nowater{selected}};
        spheroids_order = {handles.spheroids_order{selected}};
        checkWater = {handles.checkWater{selected}};
        checkScale = {handles.checkScale{selected}};
        checkDIC = {handles.checkDIC{selected}};
        bwfinal = {handles.bwfinal{selected}};
        m2p = handles.m2p;
        resize = handles.resize;
        
        hiddenString = {'filename','signatureTrimmed', 'signatureAllMetrics','bulkI',...
            'thresh', 'CC','ccDeleted','centersDeleted','diametersDeleted',...
            'centers','diameters','ws', 'small','baseName',...
            'waterThresh','bw_nowater','spheroids_order','checkWater',...
            'checkScale','checkDIC','bwfinal','m2p','resize'};
        
        hiddenCell = [{filename},{signatureTrimmed}, {signatureAllMetrics},{bulkI},...
            {thresh}, {CC},{ccDeleted},{centersDeleted},...
            {diametersDeleted},{centers},{diameters},{ws}, {small},{baseName},...
            {waterThresh},{bw_nowater},{spheroids_order},{checkWater},...
            {checkScale},{checkDIC},{bwfinal}, {m2p}, {resize}]';
        
        hiddenProps = cell2struct(hiddenCell,hiddenString,1);
        
        save(char(strcat(PathName,answer)),'hiddenProps','signatureStruct','signatureTrimmedStruct');
        %Uncheck radio buttons
        %         set(handles.radiobutton1,'Value',0);
        %         set(handles.radiobutton2,'Value',0);
        %         set(handles.radiobutton3,'Value',0);
        %Clear all axes and data
        cla(handles.axes1,'reset'); set(handles.axes1,'XTickLabel',''); set(handles.axes1,'YTickLabel',''); set(handles.axes1,'XColor','w'); set(handles.axes1,'YColor','w'); set(handles.axes1,'PlotBoxAspectRatio',[4 3 3]);
        cla(handles.axes2);
        cla(handles.axes3);
        handles = rmfield(handles,{'ccDeleted','centersDeleted',...
            'diametersDeleted','CC','ws','small','bulkI','coloredLabels',...
            'imgMasked','thresh','centers','diameter',...
            'waterThresh','bw_nowater','boundingBox','spheroids_order',...
            'm2p','resize','bwfinal','checkWater','checkScale','checkDIC'});
        guidata(hObject,handles);
        set(handles.listbox2,'String','');
        set(handles.listbox6,'String','');
        
        clearvars -global
        
        %Display message box
        delete(mb);
        mb = msgbox('Signature export successful!');
        t = timer;
        t.StartDelay = 2;
        t.TimerFcn = @(~,~) delete(mb);
        start(t)
        
    end
end



function size_threshold_number_Callback(hObject, eventdata, handles)
% hObject    handle to size_threshold_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size_threshold_number as text
%        str2double(get(hObject,'String')) returns contents of size_threshold_number as a double

get(hObject,'String');

% --- Executes during object creation, after setting all properties.
function size_threshold_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size_threshold_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String',num2str(100));
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function window_size_number_Callback(hObject, eventdata, handles)
% hObject    handle to window_size_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of window_size_number as text
%        str2double(get(hObject,'String')) returns contents of window_size_number as a double


% --- Executes during object creation, after setting all properties.
function window_size_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to window_size_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String',num2str(100));
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function intensity_number_Callback(hObject, eventdata, handles)
% hObject    handle to intensity_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intensity_number as text
%        str2double(get(hObject,'String')) returns contents of intensity_number as a double


% --- Executes during object creation, after setting all properties.
function intensity_number_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intensity_number (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String',num2str(1));
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on intensity_number and none of its controls.
function intensity_number_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to intensity_number (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
selected = get(handles.listbox2,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'String',num2str(1));
else
    
    %Check for key presses
    key = eventdata.Key;
    %Determine if control+o is pressed
    % modCheck = strcmp(modifier,'control');
    keyCheck = strcmp(key,'return');
    if keyCheck == 0
        %Don't do anything
    elseif  keyCheck
        %Store
        pause(0.0001);
        if str2double(get(hObject,'String')) < 0 || str2double(get(hObject,'String')) > 1
            set(hObject,'String',num2str(get(handles.slider1,'Value')))
            errordlg('Out of Range');
        else
            handles.thresh{selected} = str2double(get(hObject,'String'));
            set(handles.slider1,'Value',handles.thresh{selected});
            segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
        end
    end
end
% --- Executes on key press with focus on window_size_number and none of its controls.
function window_size_number_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to window_size_number (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

selected = get(handles.listbox2,'Value');
%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'String',num2str(100));
else
    %Check for key presses
    key = eventdata.Key;
    %Determine if control+o is pressed
    % modCheck = strcmp(modifier,'control');
    keyCheck = strcmp(key,'return');
    if keyCheck == 0
        %Don't do anything
    elseif  keyCheck
        %Store
        pause(0.0001);
        if str2double(get(hObject,'String')) < 10 || str2double(get(hObject,'String')) > 500
            set(hObject,'String',num2str(get(handles.slider2,'Value')))
            errordlg('Out of Range');
        else
            ws = str2double(get(hObject,'String'));
            handles.ws{selected} = [ws ws];
            set(handles.slider2,'Value',handles.ws{selected}(1));
            segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
        end
    end
end

% --- Executes on key press with focus on size_threshold_number and none of its controls.
function size_threshold_number_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to size_threshold_number (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

selected = get(handles.listbox2,'Value');

%Check for image load
checkImage = isfield(handles,'bulkI');

if checkImage == 0
    mb1 = errordlg('Please select an image file');
    t = timer;
    t.StartDelay = 2;
    t.TimerFcn = @(~,~) delete(mb1);
    start(t)
    set(hObject,'String',num2str(100));
else
    %Check for key presses
    key = eventdata.Key;
    %Determine if control+o is pressed
    % modCheck = strcmp(modifier,'control');
    keyCheck = strcmp(key,'return');
    if keyCheck == 0
        %Don't do anything
    elseif  keyCheck
        %Store
        pause(0.0001);
        if str2double(get(hObject,'String')) < 10 || str2double(get(hObject,'String')) > 5000
            set(hObject,'String',num2str(get(handles.slider4,'Value')))
            errordlg('Out of Range');
        else
            handles.small{selected} = str2double(get(hObject,'String'));
            set(handles.slider4,'Value',handles.small{selected});
            segmentCurrent; set(axesChild, 'ButtonDownFcn', {@MyCustomAxesButtonDownFunction,handles});
        end
    end
end
