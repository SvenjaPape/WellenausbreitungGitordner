function Wavefunction(handle, event)
% function to calculate and animate the sinusoidals and the line plot
% Usage: Wavefunction(handle,event)
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

%% Global variables
% variables are set global to fetch them from clickCallback-function
global coordinates
global coordinatesA
global coordinatesB
global coordinatesL
global mousebutton

% variables are set global to fetch them from "SinusWaves" script
global phi

global XArea
global YArea

global minArea
global maxArea
global resolution

global freqA
global freqB
global amplA
global amplB
global phaseA
global phaseB

% variable is set global to use it and it's value in other files 
global statusT



%% Coordinates are splitted for Sources A/B and line plot
% it is checked which mouse-button the user clicked (and if shift was held)
%additionally it's checked if 'Click mode' is activated
if strcmp(mousebutton,'right') && statusT == 0 
    coordinatesA = coordinates;
elseif strcmp(mousebutton,'left') && statusT == 0
    coordinatesB = coordinates;
elseif strcmp(mousebutton,'leftShift') && statusT == 0
   coordinatesL = coordinates;

   % if statement prevents upper-"out of bound access" in later line-plot
   if max(coordinatesL) > (maxArea-50)
       overhang = (max(coordinatesL) - (maxArea-50));
       coordinatesL = coordinatesL - overhang; % subtract overhang
   end

end

%% Calculation of parameters used in generating sinusoids
c = 343;          % sound velocity for calculating frequency

% input frequency is transformed to wave number
kA = (2*pi*freqA)/c;  
kB = (2*pi*freqB)/c;

% input phase in degree is transformed to radian
% phaseA = ((2*pi)/360)*phaseA;
% phaseB = ((2*pi)/360)*phaseB;

% variables for coordinates A/B are set to center of plot, if the 
% coordinates aren't set already
startPoint = (maxArea + minArea)/2; % center of plot is calculated

if isempty(coordinates)
    coordinates = [startPoint startPoint];
end

if isempty(coordinatesA)
    coordinatesA = [startPoint startPoint];
end

if isempty(coordinatesB)
    coordinatesB = [startPoint startPoint];
end

xA =(minArea - coordinatesA(1,1)):resolution:(maxArea - coordinatesA(1,1));
yA =(minArea - coordinatesA(1,2)):resolution:(maxArea - coordinatesA(1,2));
[Xa,Ya] = meshgrid(xA,yA); % create rectangular mesh

xb=(minArea - coordinatesB(1,1)):resolution:(maxArea - coordinatesB(1,1));
yb=(minArea - coordinatesB(1,2)):resolution:(maxArea - coordinatesB(1,2));
[Xb,Yb] = meshgrid(xb,yb);

%% Animation of the sinusoidal waves
% the phase is counted backwards so that the waves are moving from center away
phi = phi -1 ;

% radial expansion of sources A and B
Ra=sqrt(Xa.^2+Ya.^2);       
Rb=sqrt(Xb.^2+Yb.^2);

% the sinusoids A and B with user-desired properties are created
Za = amplA * sin(kA * Ra + (phi+phaseA));
Zb = amplB * sin(kB * Rb + (phi+phaseB));
Zmix = Za + Zb; % ... and their interference is calculated

% surface with sinusoidal waves is plotted in subplot
subplot(1,3,2)
set(gca, 'OuterPosition', [0.21, 0.05, 0.4, 0.9])
figure1 = surf(XArea, YArea, Zmix);

set(figure1,'ButtonDownFcn',@clickCallback);

% axis are changed, so that the plot is a square without label
xlim([minArea maxArea]);
ylim([minArea maxArea]);
axis equal
axis off
TitleWave = {'Place sources by', 'clicking right or left mousebutton'};
title(TitleWave)
color('m');

view([0 90])    % "2D"-view from above 

% amplitudes are shown in nuances of gray
colormap('gray');   
shading interp;

%% Line plot section
amplZmix(10)=0;     % preallocate vector for amplitudes
subplot(1,3,3)      % subplot is created already at this point, so that the 
                    % area next to the waveplot isn't empty
set(gca, 'OuterPosition', [0.64, 0.05, 0.35, 0.9])
      
set(gca,'XTickLabel',{}) % hide X-labels

% display help for user
TitleLine = {'LINEPLOT', 'Click "left+Shift" in waveplot'};
title(TitleLine) 

% if statement to check if a place for line-plot is chosen 
if ~isempty(coordinatesL)
    coordinatesL = coordinatesL - 10; % So that a length of 10 is shown
                                      % align with the mouseclick
                                      
    % Amplitude of sinusoidal-interference is fetched at user chosen
    % coordinates for line-plot, and at 9 further coordinates align with
    % click to get short live-plot
    for ss = (1:10)
        coordinatesL = coordinatesL + 1;
        
        % fetch current X and Y-coordinates 
        coordinateXLines = floor(coordinatesL(1,1));
        coordinateYLines = floor(coordinatesL(1,2));
        
        % fetch "Zmix"-amplitude at current coordinates
        amplZmix(ss) = Zmix(coordinateXLines,coordinateYLines);
        
        plot(amplZmix,'k-')
        
        % axis of line-plot are set
        maxAmplZmix = (max(amplA, amplB))*2;
        xlim([1 10]);
        ylim([-maxAmplZmix maxAmplZmix]);
        set(gca,'XTickLabel',{}) 
        
        title(TitleLine) % display help for user
    end
end

end
