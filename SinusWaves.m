% Script to call Wavefunction in GUI
clear all
close all

global freqA
global freqB
global amplA
global amplB
global phaseA
global phaseB
global angle

%% Input dialog for disired parameters of sources
prompt={'Enter frequency of source A:',...
        'Enter frequency of source B:',...
        'Enter amplitude of source A:', ...
        'Enter amplitude of source B:', ...
        'Enter phase of source A:'...
        'Enter phase of source B:', ...
        '3D oder 2D eingeben'};
name='Input for sinusoids';
numlines=1;
defaultanswer={'10','10', '1', '1',  '0', '180', '2D'};
answer=inputdlg(prompt,name,numlines,defaultanswer);

freqA = str2double(answer{1});
freqB = str2double(answer{2});
amplA = str2double(answer{3});
amplB = str2double(answer{4});
phaseA = str2double(answer{5});
phaseB = str2double(answer{6});
angle = answer{7};

phi = 1;    % onetime set of variable for wave-movement

global xArea
global yArea

global XArea
global YArea

global minArea
global maxArea
global resolution

% variables for size of area are Set 
minArea = 50;   % so that indices are always > 0 even if lineplot is made 
                %at a corner
maxArea = 450;

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