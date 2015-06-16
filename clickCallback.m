function [coordinates] = clickCallback(ClickHandle, event)
% callback function 
% Usage: clickCallback(ClickHandle,event)
% Input parameter:
%       handle:     figure handle
%       event:      left empty
% Output: coordinates belonging to position of mouseclick  

% Author: A.Decker, A.Morgenstern, S. Pape
% (c) A.Decker, A. Morgenster, S. Pape Jade Hochschule 
% applied licence see LICENCE.md

%% Sources: 
% get coordinates of mouse click:
% http://stackoverflow.com/questions/14684577/matlab-how-to-get-mouse-click-coordinates
% get mouse-Button side:
% http://www.mathworks.com/matlabcentral/newsreader/view_thread/280159

global statusT
global t

%% Get coordinates of mouse click

% variable "coordinates" is set global to use it in "Wavefunction"
global coordinates


% coordinates are fetched from mouseclick
axesHandle  = get(ClickHandle,'Parent');
coordinates = get(axesHandle,'CurrentPoint');
coordinates = coordinates(1,1:2);

% variable "mousebutton" is set global for further use in "Wavefunction"
global mousebutton

%% Get mouse-Button side
% the user mouse-click is registered as left, right or in combination with
% shift (to have better names in "Wavefunction") and result is saved
  
switch get(gcf, 'selectiontype') 
    case 'normal'
        mousebutton = 'left';
    case 'alt'
        mousebutton = 'right';
    case 'extend'   % Shift + mousebutton left
        mousebutton = 'leftShift';
end

% timer is started again after setting source / choose line plot, an Error
%is displayed if the user clicks without activating the 'Click mode'
if statusT == 1
    figure2 = errordlg('Please click on the Click mode-button first!', ...
             'Click mode Error');
else
    start(t)
    statusT = 1;
end

