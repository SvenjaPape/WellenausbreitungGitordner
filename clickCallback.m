function [coordinates] = clickCallback(ClickHandle, event)
%% Get coordinates of mouse click
% QUELLE: http://stackoverflow.com/questions/14684577/matlab-how-to-get-mouse-click-coordinates
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
%shift (to have better names in "Wavefunction") and result is saved
%Quelle: http://www.mathworks.com/matlabcentral/newsreader/view_thread/280159

switch get(gcf, 'selectiontype') %Problem: Reagiert manchmal nicht+setzt Quelle nicht; Reagiert nicht und führt nochmal alten selectiontype aus
    case 'normal'
        mousebutton = 'left';
        disp('Links')
    case 'alt'
        mousebutton = 'right';
        disp('Rechts')
    case 'extend'   % Shift + mousebutton left
        mousebutton = 'leftShift';
        disp('Links+Shift')
end

end

