function varargout = prototype(varargin)
% PROTOTYPE MATLAB code for prototype.fig
%      PROTOTYPE, by itself, creates a new PROTOTYPE or raises the existing
%      singleton*.
%
%      H = PROTOTYPE returns the handle to a new PROTOTYPE or the handle to
%      the existing singleton*.
%
%      PROTOTYPE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROTOTYPE.M with the given input arguments.
%
%      PROTOTYPE('Property','Value',...) creates a new PROTOTYPE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before prototype_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to prototype_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help prototype

% Last Modified by GUIDE v2.5 04-Dec-2017 12:31:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @prototype_OpeningFcn, ...
                   'gui_OutputFcn',  @prototype_OutputFcn, ...
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


% --- Executes just before prototype is made visible.
function prototype_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to prototype (see VARARGIN)

% Initialize
% global speaker
speaker = 1;
% speaker_str = sprintf('Speaker %d', speaker);
% set(handles.speaker_text, 'string', speaker_str);

% global noise
noise = 1;
% noise_str = sprintf('Noise %d', noise);
% set(handles.noise_text, 'string', noise_str);

% global position
position = 1;
% position_str = sprintf('Position %d', position);
% set(handles.position_text, 'string',position_str);

% global sentence
sentence = 0;
sentence_str = sprintf('Sentence %d', sentence);
set(handles.sentence_text, 'string', sentence_str);


% Choose default command line output for prototype
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes prototype wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = prototype_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in repeat_pushbutton.
function repeat_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to repeat_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in click_pushbutton.
function click_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to click_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get state
speaker = get(handles.speaker_popupmenu, 'Value');
noise = get(handles.noise_popupmenu, 'Value');
position = get(handles.position_popupmenu, 'Value');

tmp_str = get(handles.sentence_text, 'String');
sentence = sscanf(tmp_str(end),'%d');
sentence = sentence + 1;
sentence_str = sprintf('Sentence %d', sentence);
set(handles.sentence_text, 'String', sentence_str);

% Sentences to read
switch sentence
    case 1
        tmp_val = get(handles.position_popupmenu, 'Value');
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = strcat('Estou na posição número-', num2str(tmp_val));
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
    case 2
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = strcat('Vizzy');
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
    case 3
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = strcat('Chico');
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
    case 4
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = strcat('O robô Vizzy vai ajudar a fazer exercício físico.');
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
    case 5
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = strcat('O robô Chico também faz exercício.');
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
        
    case 6
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = 'Vai poder ser usado em hospitais e clínicas.';
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
        
    case 7
        
        % initial silence countdown
        countdown_ini(5, handles);
        
        % display sentence
        str = 'Será um dos primeiros robôs fisioterapeutas do mundo.';
        set(handles.screen_text, 'String', str);
        set(handles.screen_text, 'ForegroundColor', [0 0.7 0]);
        
        % record audio
        fs =48e3;
        r = audiorecorder(fs, 16, 1);
        record(r);
        while getkey ~= 13 % equivalent to "enter" key
        end
        stop(r)
        
        % get audio data
        sig = getaudiodata(r, 'int16');
        
        % write wav file
        filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence),'_main', '.wav');
        audiowrite(filename,sig,fs);
        % record and store sentence
        % final silence countdown
        countdown_fin(5, handles);
        % record and store final silence
        
        sentence = 0;
        sentence_str = sprintf('Sentence %d', sentence);
        set(handles.sentence_text, 'String', sentence_str);
        set(handles.screen_text, 'String', 'Avance para a próxima posição, por favor');
        set(handles.screen_text, 'ForegroundColor', 'black');
        
end
    

function countdown_ini (time_seconds, handles)

% Get state
speaker = get(handles.speaker_popupmenu, 'Value');
noise = get(handles.noise_popupmenu, 'Value');
position = get(handles.position_popupmenu, 'Value');
tmp_str = get(handles.sentence_text, 'String');
sentence = sscanf(tmp_str(end),'%d');

% Record
fs = 44e3;
r = audiorecorder(fs, 16, 1);
record(r)
for i = time_seconds:-1:1
    set(handles.screen_text, 'String', num2str(i));
    pause (1);
end
stop(r);

% Get audio data
sig = getaudiodata(r, 'int16');

% Write wav file
filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence), '_ini_silence', '.wav');
audiowrite(filename,sig,fs);

function countdown_fin (time_seconds, handles)

% Get state
speaker = get(handles.speaker_popupmenu, 'Value');
noise = get(handles.noise_popupmenu, 'Value');
position = get(handles.position_popupmenu, 'Value');
tmp_str = get(handles.sentence_text, 'String');
sentence = sscanf(tmp_str(end),'%d');

fs = 44e3;

% record audio
r = audiorecorder(fs, 16, 1);
record(r)
set(handles.screen_text, 'String', 'Aguarde...');set(handles.screen_text, 'ForegroundColor', 'black');
for i = time_seconds:-1:1
    % set(handles.screen_text, 'String', num2str(i));
    pause (1);
end
stop(r);
set(handles.screen_text, 'String', 'Próxima frase: '); set(handles.screen_text, 'ForegroundColor', 'black');

% get audio data
sig = getaudiodata(r, 'int16');

% write wav file
filename = strcat('speaker-', num2str(speaker), '_noise-', num2str(noise), '_position-', num2str(position), '_sentence-', num2str(sentence), '_fin_silence', '.wav');
audiowrite(filename,sig,fs);


% --- Executes on selection change in speaker_popupmenu.
function speaker_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to speaker_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns speaker_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from speaker_popupmenu


% --- Executes during object creation, after setting all properties.
function speaker_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speaker_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noise_popupmenu.
function noise_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to noise_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noise_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noise_popupmenu


% --- Executes during object creation, after setting all properties.
function noise_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noise_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in position_popupmenu.
function position_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to position_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns position_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from position_popupmenu


% --- Executes during object creation, after setting all properties.
function position_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on screen_text and none of its controls.
function screen_text_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to screen_text (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
