function [coordinates] = clickCallback(ClickHandle, event)
%% Get coordinates of mouse click
% QUELLE: http://stackoverflow.com/questions/14684577/matlab-how-to-get-mouse-click-coordinates
% variable "coordinates" is set global to use it in "Wavefunction"
global coordinates

% coordinates are fetched from mouseclick
axesHandle  = get(ClickHandle,'Parent');
coordinates = get(axesHandle,'CurrentPoint'); 
coordinates = coordinates(1,1:2);

% variable "mousebutton" is set global to use it in "Wavefunction"
global mousebutton

%% Get mouse-Button side
% the user mouse-click is registered as left or right and result is saved
%Quelle: http://www.mathworks.com/matlabcentral/newsreader/view_thread/280159
switch get(gcf, 'selectiontype')
    case 'normal'
        mousebutton = 'left';
    case 'alt'
        mousebutton = 'right';
end

end

