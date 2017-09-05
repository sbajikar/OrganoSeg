function varargout = metricSelection(varargin)
% METRICSELECTION MATLAB code for metricSelection.fig
%      METRICSELECTION, by itself, creates a new METRICSELECTION or raises the existing
%      singleton*.
%
%      H = METRICSELECTION returns the handle to a new METRICSELECTION or the handle to
%      the existing singleton*.
%
%      METRICSELECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METRICSELECTION.M with the given input arguments.
%
%      METRICSELECTION('Property','Value',...) creates a new METRICSELECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before metricSelection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to metricSelection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help metricSelection

% Last Modified by GUIDE v2.5 24-Apr-2017 13:12:30

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @metricSelection_OpeningFcn, ...
    'gui_OutputFcn',  @metricSelection_OutputFcn, ...
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


% --- Executes just before metricSelection is made visible.
function metricSelection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to metricSelection (see VARARGIN)
global globalStruct
if isfield(globalStruct,'area') == 0
    globalStruct.area = 1;
    set(handles.Area,'Value',1);
    globalStruct.majorAxisLength = 0;
    globalStruct.minorAxisLength = 0;
    globalStruct.eccentricity = 1;
    set(handles.eccentricity,'Value',1);
    globalStruct.orientation = 0;
    globalStruct.convexArea = 0;
    globalStruct.diameter = 0;
    globalStruct.solidity = 0;
    globalStruct.extent = 0;
    globalStruct.perimeter = 1;
    set(handles.perimeter,'Value',1);
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
    set(handles.contrast,'Value',1);
    globalStruct.correlation = 1;
    set(handles.correlation,'Value',1);
    globalStruct.energy = 1;
    set(handles.energy,'Value',1);
    globalStruct.homogeneity = 1;
    set(handles.homogeneity,'Value',1);
    globalStruct.default = [1 4 10 20 21 22 23];
   
else
    keepMetricsBinary = [globalStruct.area, globalStruct.majorAxisLength globalStruct.minorAxisLength ...
        globalStruct.eccentricity globalStruct.orientation globalStruct.convexArea globalStruct.diameter ...
        globalStruct.solidity globalStruct.extent globalStruct.perimeter ...
        globalStruct.Z globalStruct.A globalStruct.Phi globalStruct.meanTotalPixels ...
        globalStruct.stdTotalPixels globalStruct.p2a globalStruct.CV globalStruct.skewTotalPixels...
        globalStruct.kurtTotalPixels globalStruct.contrast globalStruct.correlation ...
        globalStruct.energy globalStruct.homogeneity];
    keepMetrics = find(keepMetricsBinary);
    if isequal(globalStruct.default,keepMetrics)
        globalStruct.area = 1;
        set(handles.Area,'Value',1);
        globalStruct.majorAxisLength = 0;
        globalStruct.minorAxisLength = 0;
        globalStruct.eccentricity = 1;
        set(handles.eccentricity,'Value',1);
        globalStruct.orientation = 0;
        globalStruct.convexArea = 0;
        globalStruct.diameter = 0;
        globalStruct.solidity = 0;
        globalStruct.extent = 0;
        globalStruct.perimeter = 1;
        set(handles.perimeter,'Value',1);
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
        set(handles.contrast,'Value',1);
        globalStruct.correlation = 1;
        set(handles.correlation,'Value',1);
        globalStruct.energy = 1;
        set(handles.energy,'Value',1);
        globalStruct.homogeneity = 1;
        set(handles.homogeneity,'Value',1);
        globalStruct.default = [1 4 10 20 21 22 23];
    else
        set(handles.Area,'Value',keepMetricsBinary(1));
        set(handles.majoraxislength,'Value',keepMetricsBinary(2));
        set(handles.minoraxislength,'Value',keepMetricsBinary(3));
        set(handles.eccentricity,'Value',keepMetricsBinary(4));
        set(handles.orientation,'Value',keepMetricsBinary(5));
        set(handles.convexArea,'Value',keepMetricsBinary(6));
        set(handles.diameter,'Value',keepMetricsBinary(7));
        set(handles.solidity,'Value',keepMetricsBinary(8));
        set(handles.extent,'Value',keepMetricsBinary(9));
        set(handles.perimeter,'Value',keepMetricsBinary(10));
        set(handles.zernickeZ,'Value',keepMetricsBinary(11));
        set(handles.zernickeA,'Value',keepMetricsBinary(12));
        set(handles.zernickePhi,'Value',keepMetricsBinary(13));
        set(handles.meanPixelIntensity,'Value',keepMetricsBinary(14));
        set(handles.stdPixelIntensity,'Value',keepMetricsBinary(15));
        set(handles.p2a,'Value',keepMetricsBinary(16));
        set(handles.CV,'Value',keepMetricsBinary(17));
        set(handles.skew,'Value',keepMetricsBinary(18));
        set(handles.kurt,'Value',keepMetricsBinary(19));
        set(handles.contrast,'Value',keepMetricsBinary(20));
        set(handles.correlation,'Value',keepMetricsBinary(21));
        set(handles.energy,'Value',keepMetricsBinary(22));
        set(handles.homogeneity,'Value',keepMetricsBinary(23));
    end
    
end


% set(hObject, 'WindowButtonMotionFcn', {@mouseMove,handles});
% get(hObject,'WindowButtonMotionFcn');
imshow(globalStruct.crop,[])

% Choose default command line output for metricSelection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes metricSelection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = metricSelection_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function mouseMove (hObject, eventdata, handles)
mouseCoords = get(hObject, 'CurrentPoint');
% guidata(hObject,handles);
global globalStruct

Area = get(handles.areaText,'Position');
perimeter = get(handles.perimeterText,'Position');
p2a = get(handles.p2aText,'Position');
diameter = get(handles.diameterText,'Position');
majAxis = get(handles.majAxisText,'Position');
minAxis = get(handles.minAxisText,'Position');
orientation = get(handles.orientationText,'Position');
solidity = get(handles.solidityText,'Position');
extent = get(handles.extentText,'Position');
convexArea = get(handles.convexAreaText,'Position');
z = get(handles.zText,'Position');
phi = get(handles.phiText,'Position');
a = get(handles.aText,'Position');
meanPixel = get(handles.meanPixelText,'Position');
stdPixel = get(handles.stdPixelText,'Position');
eccentricity = get(handles.eccentricityText,'Position');
skew = get(handles.skewText,'Position');
kurt = get(handles.kurtText,'Position');
contrast = get(handles.contrastText,'Position');
correlation = get(handles.correlationText,'Position');
energy = get(handles.energyText,'Position');
homo = get(handles.homoText,'Position');
cv = get(handles.cvText,'Position');

axes(handles.axes1);

if Area(1) < mouseCoords(1) && (Area(1)+Area(3)) > mouseCoords(1) && Area(2) < mouseCoords(2) && (Area(2)+Area(4)) > mouseCoords(2)
    imshow(globalStruct.crop,[])
    hold on
    imArea = imshow(globalStruct.area_color);
    hold off
    set(imArea,'AlphaData',globalStruct.area_mask);
    
    
elseif cv(1) < mouseCoords(1) && (cv(1)+cv(3)) > mouseCoords(1) && cv(2) < mouseCoords(2) && (cv(2)+cv(4)) > mouseCoords(2)
    
    
    
elseif homo(1) < mouseCoords(1) && (homo(1)+homo(3)) > mouseCoords(1) && homo(2) < mouseCoords(2) && (homo(2)+homo(4)) > mouseCoords(2)
    
    
    
elseif energy(1) < mouseCoords(1) && (energy(1)+energy(3)) > mouseCoords(1) && energy(2) < mouseCoords(2) && (energy(2)+energy(4)) > mouseCoords(2)
    
    
    
    
elseif correlation(1) < mouseCoords(1) && (correlation(1)+correlation(3)) > mouseCoords(1) && correlation(2) < mouseCoords(2) && (correlation(2)+correlation(4)) > mouseCoords(2)
    
    
    
elseif contrast(1) < mouseCoords(1) && (contrast(1)+contrast(3)) > mouseCoords(1) && contrast(2) < mouseCoords(2) && (contrast(2)+contrast(4)) > mouseCoords(2)
    
    
    
elseif kurt(1) < mouseCoords(1) && (kurt(1)+kurt(3)) > mouseCoords(1) && kurt(2) < mouseCoords(2) && (kurt(2)+kurt(4)) > mouseCoords(2)
    
    
    
elseif skew(1) < mouseCoords(1) && (skew(1)+skew(3)) > mouseCoords(1) && skew(2) < mouseCoords(2) && (skew(2)+skew(4)) > mouseCoords(2)
    
    
    
elseif eccentricity(1) < mouseCoords(1) && (eccentricity(1)+eccentricity(3)) > mouseCoords(1) && eccentricity(2) < mouseCoords(2) && (eccentricity(2)+eccentricity(4)) > mouseCoords(2)
    imshow(globalStruct.crop_ellipse,[])
    hold on
    plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
    plot(globalStruct.x_Maj,globalStruct.y_Maj,'r','LineWidth',5);
    plot(globalStruct.x_foci,globalStruct.y_foci,'b','LineWidth',2);
    hold off
    
elseif stdPixel(1) < mouseCoords(1) && (stdPixel(1)+stdPixel(3)) > mouseCoords(1) && stdPixel(2) < mouseCoords(2) && (stdPixel(2)+stdPixel(4)) > mouseCoords(2)
    
    
    
elseif meanPixel(1) < mouseCoords(1) && (meanPixel(1)+meanPixel(3)) > mouseCoords(1) && meanPixel(2) < mouseCoords(2) && (meanPixel(2)+meanPixel(4)) > mouseCoords(2)
    
    
    
elseif a(1) < mouseCoords(1) && (a(1)+a(3)) > mouseCoords(1) && a(2) < mouseCoords(2) && (a(2)+a(4)) > mouseCoords(2)
    
    
    
elseif phi(1) < mouseCoords(1) && (phi(1)+phi(3)) > mouseCoords(1) && phi(2) < mouseCoords(2) && (phi(2)+phi(4)) > mouseCoords(2)
    
    
    
elseif z(1) < mouseCoords(1) && (z(1)+z(3)) > mouseCoords(1) && z(2) < mouseCoords(2) && (z(2)+z(4)) > mouseCoords(2)
    
    
    
elseif convexArea(1) < mouseCoords(1) && (convexArea(1)+convexArea(3)) > mouseCoords(1) && convexArea(2) < mouseCoords(2) && (convexArea(2)+convexArea(4)) > mouseCoords(2)
    imshow(globalStruct.crop,[])
    hold on
    imArea = imshow(globalStruct.convexArea_color);
    hold off
    set(imArea,'AlphaData',globalStruct.convexArea_mask);
    
    
elseif extent(1) < mouseCoords(1) && (extent(1)+extent(3)) > mouseCoords(1) && extent(2) < mouseCoords(2) && (extent(2)+extent(4)) > mouseCoords(2)
    area_mask = globalStruct.area_mask;
    imshow(globalStruct.crop,[])
    hold on
    imArea = imshow(globalStruct.area_color);
    set(imArea,'AlphaData',area_mask)
    red = cat(3, ones(size(area_mask)),zeros(size(area_mask)), zeros(size(area_mask)));
    imGrid = imshow(red);
    set(imGrid,'AlphaData',globalStruct.grid);
    hold off
    
    
elseif solidity(1) < mouseCoords(1) && (solidity(1)+solidity(3)) > mouseCoords(1) && solidity(2) < mouseCoords(2) && (solidity(2)+solidity(4)) > mouseCoords(2)
    convexArea_mask = globalStruct.convexArea_mask;
    imshow(globalStruct.crop,[])
    hold on
    imArea = imshow(globalStruct.area_color);
    set(imArea,'AlphaData',convexArea_mask)
    red = cat(3, ones(size(convexArea_mask)),zeros(size(convexArea_mask)), zeros(size(convexArea_mask)));
    imGrid = imshow(red);
    set(imGrid,'AlphaData',globalStruct.grid2);
    hold off
    
    
elseif orientation(1) < mouseCoords(1) && (orientation(1)+orientation(3)) > mouseCoords(1) && orientation(2) < mouseCoords(2) && (orientation(2)+orientation(4)) > mouseCoords(2)
    imshow(globalStruct.crop_ellipse,[])
    hold on
    plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
    plot(globalStruct.x_axis,globalStruct.y_axis,'b','LineWidth',2);
    plot(globalStruct.x_maj2, globalStruct.y_maj2,'b','LineWidth',2);
    hold off
    
    
elseif minAxis(1) < mouseCoords(1) && (minAxis(1)+minAxis(3)) > mouseCoords(1) && minAxis(2) < mouseCoords(2) && (minAxis(2)+minAxis(4)) > mouseCoords(2)
    imshow(globalStruct.crop_ellipse,[])
    hold on
    plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
    plot(globalStruct.x_Min,globalStruct.y_Min,'b','LineWidth',2);
    hold off
    
    
elseif majAxis(1) < mouseCoords(1) && (majAxis(1)+majAxis(3)) > mouseCoords(1) && majAxis(2) < mouseCoords(2) && (majAxis(2)+majAxis(4)) > mouseCoords(2)
    imshow(globalStruct.crop_ellipse,[])
    hold on
    plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
    plot(globalStruct.x_Maj,globalStruct.y_Maj,'b','LineWidth',2);
    hold off
    
    
elseif diameter(1) < mouseCoords(1) && (diameter(1)+diameter(3)) > mouseCoords(1) && diameter(2) < mouseCoords(2) && (diameter(2)+diameter(4)) > mouseCoords(2)
    
    
    
elseif p2a(1) < mouseCoords(1) && (p2a(1)+p2a(3)) > mouseCoords(1) && p2a(2) < mouseCoords(2) && (p2a(2)+p2a(4)) > mouseCoords(2)
    
    

elseif perimeter(1) < mouseCoords(1) && (perimeter(1)+perimeter(3)) > mouseCoords(1) && perimeter(2) < mouseCoords(2) && (perimeter(2)+perimeter(4)) > mouseCoords(2)
    imshow(globalStruct.crop,[])
    hold on
    imPerim = imshow(globalStruct.bw_perim_color);
    hold off
    %change opacity if wanted
    set(imPerim,'AlphaData',globalStruct.perim_mask);
    
else
    imshow(globalStruct.crop,[])
end






% --- Executes on button press in perimeter.
function perimeter_Callback(hObject, eventdata, handles)
% hObject    handle to perimeter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.perimeter = get(hObject,'Value');

% Hint: get(hObject,'Value') returns toggle state of perimeter


% --- Executes on button press in Area.
function Area_Callback(hObject, eventdata, handles)
% hObject    handle to Area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.area = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of Area

% --- Executes on button press in diameter.
function diameter_Callback(hObject, eventdata, handles)
% hObject    handle to diameter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.diameter = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of diameter


% --- Executes on button press in eccentricity.
function eccentricity_Callback(hObject, eventdata, handles)
% hObject    handle to eccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.eccentricity = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of eccentricity


% --- Executes on button press in orientation.
function orientation_Callback(hObject, eventdata, handles)
% hObject    handle to orientation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.orientation = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of orientation


% --- Executes on button press in minoraxislength.
function minoraxislength_Callback(hObject, eventdata, handles)
% hObject    handle to minoraxislength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.minorAxisLength = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of minoraxislength


% --- Executes on button press in majoraxislength.
function majoraxislength_Callback(hObject, eventdata, handles)
% hObject    handle to majoraxislength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.majorAxisLength = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of majoraxislength


% --- Executes on button press in solidity.
function solidity_Callback(hObject, eventdata, handles)
% hObject    handle to solidity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.solidity = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of solidity


% --- Executes on button press in convexArea.
function convexArea_Callback(hObject, eventdata, handles)
% hObject    handle to convexArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.convexArea = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of convexArea


% --- Executes on button press in extent.
function extent_Callback(hObject, eventdata, handles)
% hObject    handle to extent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.extent = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of extent


% --- Executes on button press in zernickeZ.
function zernickeZ_Callback(hObject, eventdata, handles)
% hObject    handle to zernickeZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.Z = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of zernickeZ


% --- Executes on button press in zernickeA.
function zernickeA_Callback(hObject, eventdata, handles)
% hObject    handle to zernickeA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.A = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of zernickeA


% --- Executes on button press in stdPixelIntensity.
function stdPixelIntensity_Callback(hObject, eventdata, handles)
% hObject    handle to stdPixelIntensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.stdTotalPixels = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of stdPixelIntensity


% --- Executes on button press in meanPixelIntensity.
function meanPixelIntensity_Callback(hObject, eventdata, handles)
% hObject    handle to meanPixelIntensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.meanTotalPixels = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of meanPixelIntensity


% --- Executes on button press in zernickePhi.
function zernickePhi_Callback(hObject, eventdata, handles)
% hObject    handle to zernickePhi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.Phi = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of zernickePhi


% --- Executes on button press in p2a.
function p2a_Callback(hObject, eventdata, handles)
% hObject    handle to p2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.p2a = get(hObject,'Value');
% Hint: get(hObject,'Value') returns toggle state of p2a



% --- Executes on button press in skew.
function skew_Callback(hObject, eventdata, handles)
% hObject    handle to skew (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of skew
global globalStruct
globalStruct.skewTotalPixels = get(hObject,'Value');

% --- Executes on button press in kurt.
function kurt_Callback(hObject, eventdata, handles)
% hObject    handle to kurt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kurt
global globalStruct
globalStruct.kurtTotalPixels = get(hObject,'Value');

% --- Executes on button press in contrast.
function contrast_Callback(hObject, eventdata, handles)
% hObject    handle to contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of contrast
global globalStruct
globalStruct.contrast = get(hObject,'Value');

% --- Executes on button press in correlation.
function correlation_Callback(hObject, eventdata, handles)
% hObject    handle to correlation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of correlation
global globalStruct
globalStruct.correlation = get(hObject,'Value');

% --- Executes on button press in energy.
function energy_Callback(hObject, eventdata, handles)
% hObject    handle to energy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of energy
global globalStruct
globalStruct.energy = get(hObject,'Value');

% --- Executes on button press in homogeneity.
function homogeneity_Callback(hObject, eventdata, handles)
% hObject    handle to homogeneity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
globalStruct.homogeneity = get(hObject,'Value');

% --- Executes on button press in CV.
function CV_Callback(hObject, eventdata, handles)
% hObject    handle to CV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of CV
global globalStruct
globalStruct.CV = get(hObject,'Value');

% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over areaText.
function areaText_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to areaText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct

imshow(globalStruct.crop,[])
hold on
imArea = imshow(globalStruct.area_color);
hold off
set(imArea,'AlphaData',globalStruct.area_mask);
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Area');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over perimeterText.
function perimeterText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to perimeterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop,[])
hold on
imPerim = imshow(globalStruct.bw_perim_color);
hold off
%change opacity if wanted
set(imPerim,'AlphaData',globalStruct.perim_mask);
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Perimeter');

set(handles.areaText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over p2aText.
function p2aText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to p2aText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop,[])
hold on
imArea = imshow(globalStruct.area_color_red);
imPerim = imshow(globalStruct.bw_perim_color);
hold off
set(imArea,'AlphaData',globalStruct.area_mask);
set(imPerim,'AlphaData',globalStruct.perim_mask);
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Perimeter-to-Area Ratio, blue divided by red');

set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over diameterText.
function diameterText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to diameterText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over eccentricityText.
function eccentricityText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to eccentricityText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop_ellipse,[])
hold on
plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
plot(globalStruct.x_Maj,globalStruct.y_Maj,'r','LineWidth',5);
plot(globalStruct.x_foci,globalStruct.y_foci,'b','LineWidth',2);
hold off

set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Eccentricity, blue divided by red');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over majAxisText.
function majAxisText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to majAxisText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop_ellipse,[])
hold on
plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
plot(globalStruct.x_Maj,globalStruct.y_Maj,'b','LineWidth',2);
hold off

set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Major Axis Length, blue line');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over minAxisText.
function minAxisText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to minAxisText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop_ellipse,[])
hold on
plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
plot(globalStruct.x_Min,globalStruct.y_Min,'b','LineWidth',2);
hold off

set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Minor Axis Length, blue line');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over orientationText.
function orientationText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to orientationText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop_ellipse,[])
hold on
plot(globalStruct.x,globalStruct.y,'w','LineWidth',2);
plot(globalStruct.x_axis,globalStruct.y_axis,'b','LineWidth',2);
plot(globalStruct.x_maj2, globalStruct.y_maj2,'b','LineWidth',2);
hold off

set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Orientation, angle between blue lines');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over solidityText.
function solidityText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to solidityText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
convexArea_mask = globalStruct.convexArea_mask;
imshow(globalStruct.crop,[])
hold on
imArea = imshow(globalStruct.area_color);
set(imArea,'AlphaData',convexArea_mask)
red = cat(3, ones(size(convexArea_mask)),zeros(size(convexArea_mask)), zeros(size(convexArea_mask)));
imGrid = imshow(red);
set(imGrid,'AlphaData',globalStruct.grid2);
hold off
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Solidity, blue divided by red');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over extentText.
function extentText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to extentText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
area_mask = globalStruct.area_mask;
imshow(globalStruct.crop,[])
hold on
imArea = imshow(globalStruct.area_color);
set(imArea,'AlphaData',area_mask)
red = cat(3, ones(size(area_mask)),zeros(size(area_mask)), zeros(size(area_mask)));
imGrid = imshow(red);
set(imGrid,'AlphaData',globalStruct.grid);
hold off
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Extent, blue divided by red');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over convexAreaText.
function convexAreaText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to convexAreaText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop,[])
hold on
imArea = imshow(globalStruct.convexArea_color);
hold off
set(imArea,'AlphaData',globalStruct.convexArea_mask);
set(hObject,'ForegroundColor','r');
set(handles.text29,'String','Convex Area');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over zText.
function zText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to zText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over phiText.
function phiText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to phiText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over aText.
function aText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to aText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over meanPixelText.
function meanPixelText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to meanPixelText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over stdPixelText.
function stdPixelText_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to stdPixelText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function areaText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to areaText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global globalStruct
imshow(globalStruct.crop,[])
set(handles.text29,'String','');
set(handles.areaText,'ForegroundColor','b');
set(handles.perimeterText,'ForegroundColor','b');
set(handles.p2aText,'ForegroundColor','b');
set(handles.eccentricityText,'ForegroundColor','b');
set(handles.majAxisText,'ForegroundColor','b');
set(handles.minAxisText,'ForegroundColor','b');
set(handles.orientationText,'ForegroundColor','b');
set(handles.solidityText,'ForegroundColor','b');
set(handles.extentText,'ForegroundColor','b');
set(handles.convexAreaText,'ForegroundColor','b');
