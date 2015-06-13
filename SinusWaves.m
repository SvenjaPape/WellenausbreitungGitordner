% Script to call Wavefunction in GUI
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


%% Input dialog is used to set parameters
InputDialog




% variables for size of area are Set 
minArea = 50;   % so that indices are always > 0 even if lineplot is made 
                %at a corner
maxArea = 350;

resolution = 1; % the "resolution" (stepsize) of the area is set

xArea = minArea:resolution:maxArea;
yArea = minArea:resolution:maxArea;
[XArea,YArea] = meshgrid(xArea,yArea);

figure1 = figure();
t = timer('Period', 0.3, 'TimerFcn', @Wavefunction, 'ExecutionMode', 'FixedRate');
start(t);
uiwait(figure1);
stop(t);
delete(t);