function sliderCallback(handles,callbackdata)
% Callbackfunction to read the values from the sliders and update it
% Usage: sliderCallback(handle,event)
% Input parameter:
%       handle:     figure handle
%       event:      left empty
% Output: animation of sinusoidals and lineplot  

% Author: A. Decker, A. Morgenstern, S. Pape
% (c) A.Decker, A. Morgenster, S. Pape Jade Hochschule 
% applied licence see LICENCE.md

%% Define needed variables global
global freqA
global freqB
global amplA
global amplB
global phaseA
global phaseB
T =  num2str(handles.Tag);  % get the tag of the uicontrol as a string
% if the incoming tag is matching, the value of the slider is changed
    if regexp(T,'SfreqA') == 1  
        sfA = handles.Value;
        freqA = sfA;
    elseif regexp(T,'SfreqB') == 1
        sfB = handles.Value;
        freqB = sfB;
    elseif regexp(T,'SamplA') == 1
        saA = handles.Value;
        amplA = saA;
    elseif regexp(T,'SamplB') == 1
        saB = handles.Value;
        amplB = saB;  
    elseif regexp(T,'SphasA') == 1
        spA = handles.Value;
        phaseA = spA;  
    else spB = handles.Value;
        phaseB = spB;  
    end
end



