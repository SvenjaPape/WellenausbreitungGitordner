function [x,y] = clickCallback(handle, event)
% QUELLE: http://stackoverflow.com/questions/14684577/matlab-how-to-get-mouse-click-coordinates
axesHandle  = get(handle,'Parent');
coordinates = get(axesHandle,'CurrentPoint'); 
coordinates = coordinates(1,1:2);

disp(coordinates)


end

