function sliderCallback(handles,callbackdata)
% Callbackfunction to read the values from the sliders and update it
% Usage: sliderCallback(handle,event)
% Input parameter:
%       handle:     figure handle
%       event:      left empty
% Output: animation of sinusoidals and lineplot  

% Author: A. Decker, A. Morgenstern, S. Pape
% (c) A.Decker, A. Morgenster, S. Pape Jade Hochschule 
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% applied licence see LICENCE.md

%% Define needed variables global
global freqA
global freqB
global amplA
global amplB
global phaseA
global phaseB

% variables are set global to use them and their values in other files 
global status
global t

T =  num2str(handles.Tag);  % get the tag of the uicontrol as a string
% if the incoming tag is matching, the value of the slider is changed
    if regexp(T,'SfreqA') == 1  
        freqA = handles.Value;
    elseif regexp(T,'SfreqB') == 1
        freqB = handles.Value;
    elseif regexp(T,'SamplA') == 1
        amplA = handles.Value;
    elseif regexp(T,'SamplB') == 1
        amplB = handles.Value; 
    elseif regexp(T,'SphasA') == 1
        phaseA = handles.Value; 
    else spB = handles.Value;
        phaseB = spB;
    end

end



