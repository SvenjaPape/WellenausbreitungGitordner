function Wavefunction(handle, event)

%% Global variables
% variables are set global to fetch them from clickCallback-function
global coordinates
global coordinatesA
global coordinatesB
global coordinatesL
global mousebutton

% variables are set global to fetch them from "SinusWaves" script
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
global angle


%% Coordinates are splitted for Sources A/B and line plot
% it is checked which mouse-button the user clicked (and if shift was held) 
if strcmp(mousebutton,'right')
    coordinatesA = coordinates;
elseif strcmp(mousebutton,'left')
    coordinatesB = coordinates;
elseif strcmp(mousebutton,'leftShift')
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
kA = (2*pi()*freqA)/c;  
kB = (2*pi()*freqB)/c;

% input phase in degree is transformed to radiant
phaseA = (2*pi()/360)*phaseA;
phaseB = (2*pi()/360)*phaseB;


% variables for coordinates A/B are set to center of plot, if the 
%coordinates aren't set already
startPoint = (maxArea + minArea)/2; % center of plot is calculated
%moveNumber = (startPoint - minArea);


if isempty(coordinates)
    coordinates = [startPoint startPoint];
end

if isempty(coordinatesA)
    coordinatesA = [startPoint startPoint];
end

if isempty(coordinatesB)
    coordinatesB = [startPoint startPoint];
end


% the coordinates of the sources A and B are set, default place is central
% xA =(minArea - coordinatesA(1)):resolution:(maxArea - coordinatesA(1));
% yA =(minArea - coordinatesA(2)):resolution:(maxArea - coordinatesA(2));
% [Xa,Ya] = meshgrid(xA,yA); % create rectangullar mesh




xA =(minArea - coordinatesA(1,1)):resolution:(maxArea - coordinatesA(1,1));
yA =(minArea - coordinatesA(1,2)):resolution:(maxArea - coordinatesA(1,2));
[Xa,Ya] = meshgrid(xA,yA); % create rectangullar mesh



xb=(minArea - coordinatesB(1,1)):resolution:(maxArea - coordinatesB(1,1));
yb=(minArea - coordinatesB(1,2)):resolution:(maxArea - coordinatesB(1,2));
[Xb,Yb] = meshgrid(xb,yb);



%% Animation of the sinusoidal waves
% MUSS NOCH VERNÜNFTIG HOCHGEZÄHLT WERDEN!
time = clock;
phi = time(6)*-2;

% radial expansion of sources A and B
Ra=sqrt(Xa.^2+Ya.^2);       
Rb=sqrt(Xb.^2+Yb.^2);

% the sinusoids A and B with user-desired properties are created
Za = amplA * sin(kA * Ra + (phi+phaseA));
Zb = amplB * sin(kB * Rb + (phi+phaseB));
Zmix = Za + Zb; % ... and their interference is calculated

% Sufaces with sinusoidal waves is plotted in subplot
subplot(1,2,1);
figure1 = surf(XArea, YArea, Zmix);

% sliderFreq = uicontrol(figure2, 'Style', 'slider',... VERSUCH ZU GUI
%                        'Min',10,'Max',50, ...
%                        'Value',20, ...
%                        'SliderStep',[1 10],...
%                        'Position',[30 20 10 10]);

set(figure1,'ButtonDownFcn',@clickCallback);

% axis are changed, so that the plot is a square without label
xlim([minArea maxArea]);
ylim([minArea maxArea]);
axis equal
axis off
TitleWave = {'Place sources by', 'double click right or left'};
title(TitleWave)
color('m');

% the view-angle on the surface plot is set, for the 2D or 3D-view 
if strcmp(angle,'3D')
    view([0 50])
else
    view([0 90])
end

% amplitudes are shown in nuances of gray
colormap('gray');   
shading interp;

%% Line plot section
amplZmix(10)=0;     % preallocate vector for amplitudes
subplot(1,2,2)      % subplot is created already at this point, so that the 
                    %area next to the waveplot isn't empty
set(gca,'XTickLabel',{}) % hide X-labels

% display help for user
TitleLine = {'LINEPLOT', 'Click "left+Shift" in waveplot'};
title(TitleLine) 


% if statement to check if a place for line-plot is chosen 
if ~isempty(coordinatesL)
    coordinatesL = coordinatesL - 10; % So that a length of 10 is shown
                                      %align with the mouseclick
                                      
    % Amplitude of sinusoidal-interference is fetched at user chosen
    %coordinates for line-plot, and at 9 further coordinates align with
    %click to get short live-plot
    for ss = (1:10)
        coordinatesL = coordinatesL + 1;
        
        % fetch current X and Y-coordinates 
        coordinateXLines = floor(coordinatesL(1,1));
        coordinateYLines = floor(coordinatesL(1,2));
        
        % fetch "Zmix"-amplitude at current coordinates
        amplZmix(ss) = Zmix(coordinateXLines,coordinateYLines);
        
        plot(amplZmix,'k-')
        
        % Axis of line-plot are set
        maxAmplZmix = (max(amplA, amplB))*2;
        xlim([1 10]);
        ylim([-maxAmplZmix maxAmplZmix]);
        set(gca,'XTickLabel',{}) 
        
        title(TitleLine) % display help for user
    end
end

end
