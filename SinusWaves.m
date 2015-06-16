% Script to run a simulation of the wave propagation of two sinusoidals
% Usage: run(SinusWaves.m)
% Output: GUI which performs the simulation

% Author: A.Decker, A.Morgenstern, S. Pape
% (c) A.Decker, A. Morgenster, S. Pape Jade Hochschule 
% applied licence see LICENCE.md 

clear all 
close all

%% Important variables are set global for further use in "Wavefunction"

global xArea
global yArea

global XArea
global YArea

global minArea
global maxArea
global resolution
global phi

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
figure1 = figure();

% Input dialog is used to set parameters
InputDialog

t = timer('Period', 0.3, 'TimerFcn', @Wavefunction, 'ExecutionMode', 'FixedRate');
start(t);
uiwait(figure1);
stop(t);
delete(t);