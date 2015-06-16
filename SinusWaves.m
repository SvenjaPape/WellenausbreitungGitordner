% Script to run a simulation of the wave propagation of two sinusoidals
% Usage: run(SinusWaves.m)
% Output: GUI which performs the simulation

% Author: A.Decker, A.Morgenstern, S. Pape
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

clear all 
close all

% variables are set global to use them and their values in other files 
global statusT
statusT = 1;    % variable for indicator if timer is running, is set to "1" 
                %for "timer is running" 

%% Important variables are set global for further use in "Wavefunction"

global xArea
global yArea

global XArea
global YArea

global minArea
global maxArea
global resolution
global phi

% variable are set global to use it and it's value in other files 
global t

phi = -1;    % onetime set of variable for wave-movement

% variables for size of area are Set 
minArea = 50;   % so that indices are always > 0 even if lineplot is made 
                % at a corner
maxArea = 350;

resolution = 1; % the "resolution" (stepsize) of the area is set

xArea = minArea:resolution:maxArea;
yArea = minArea:resolution:maxArea;
[XArea,YArea] = meshgrid(xArea,yArea);

global figure1
figure1 = figure('Color', [0.9 0.98 0.99]);     % color of GUI is changed

% Input dialog is used to set parameters
InputDialog

t = timer('Period', 0.35, 'TimerFcn', @Wavefunction, 'ExecutionMode', 'FixedRate');
start(t);
uiwait(figure1);
stop(t);
delete(t);