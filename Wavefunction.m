function Wavefunction(handle, event)

c = 343;          % sound velocity for calculating frequency

%% Ideen:
% - Vielleicht noch einen Dämpfungsfaktor?
% - 



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


%% Processing in order to place Sources
% it is checked mouse-button which mouse-button (+ shit) the user used 
if strcmp(mousebutton,'right')
    coordinatesA = coordinates;
elseif strcmp(mousebutton,'left')
    coordinatesB = coordinates;
elseif strcmp(mousebutton,'leftShift')
   coordinatesL = coordinates;
end



% freqA = 10;
% freqB = 10;
% amplA = 1;
% amplB = 1;
% phaseA = 180;
% phaseB = 180;
% angle = '3D';


%% Calculation of parameters used in generating sinusoids
% input frequency is transformed to wave number
kA = (2*pi()*freqA)/c;  
kB = (2*pi()*freqB)/c;

% input phase in degree is transformed to radiant
phaseA = (2*pi()/360)*phaseA;
phaseB = (2*pi()/360)*phaseB;


% variables for coordinates/A/B are set to zero if the coordinates aren't 
%set already, so that sources start in the center of plot
startPoint = (maxArea + minArea)/2; % HÄLFTE VON AREA MAX!!!
moveNumber = (startPoint - minArea);


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


Ra=sqrt(Xa.^2+Ya.^2);       %radius
Rb=sqrt(Xb.^2+Yb.^2);


Za = amplA * sin(kA * Ra + (phi+phaseA));
Zb = amplB * sin(kB * Rb + (phi+phaseB));
Zmix = Za + Zb;

% Sufaces with sinusoidal waves is plotted
subplot(1,2,1)
figure1 = surf(XArea, YArea, Zmix);

% sliderFreq = uicontrol(figure2, 'Style', 'slider',... VERSUCH ZU GUI
%                        'Min',10,'Max',50, ...
%                        'Value',20, ...
%                        'SliderStep',[1 10],...
%                        'Position',[30 20 10 10]);

set(figure1,'ButtonDownFcn',@clickCallback);

xlim([minArea maxArea]);
ylim([minArea maxArea]);

if strcmp(angle,'3D')
    view([0 50])
else
    view([0 90])
end

colormap('gray');
shading interp;

%% Line plot section
amplZmix = [];
if ~isempty(coordinatesL)
    %disp(coordinatesL);
    coordinatesL = coordinatesL - 10; % So that a symmetric area is shown around the mouseclick
    for ss = (1:20)
        coordinatesL = coordinatesL + 1;
        coordinateXLines = floor(coordinatesL(1,1));
        coordinateYLines = floor(coordinatesL(1,2));
        
        amplZmix(ss) = Zmix(coordinateXLines,coordinateYLines);
        
        subplot(1,2,2)
        plot(amplZmix)
        
        maxAmplZmix = (max(amplA, amplB))*2;
        ylim([-maxAmplZmix maxAmplZmix]);
        
    end
    coordinatesL = [];
end
disp(amplZmix)

% if ~isempty(coordinatesL)
%     Hier kommt dann der Linienplot hin
%     xVec = coordinatesL(1)-5:coordinatesL(1)+5;
%     yVec = coordinatesL(2)-5:coordinatesL(2)+5;
% end


end
