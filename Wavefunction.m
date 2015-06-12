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
% it is checked if the user clicked right or left mouse-button 
if strcmp(mousebutton,'right')
    coordinatesA = coordinates;
elseif strcmp(mousebutton,'left')
    coordinatesB = coordinates;
elseif strcmp(mousebutton,'both')
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
%set already
startPoint = (maxArea - minArea)/2; % HÄLFTE VON AREA MAX!!!

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
xA =(minArea - coordinatesA(1)):resolution:(maxArea - coordinatesA(1));
yA =(minArea - coordinatesA(2)):resolution:(maxArea - coordinatesA(2));
[Xa,Ya] = meshgrid(xA,yA); % create rectangullar mesh

xb=(minArea - coordinatesB(1)):resolution:(maxArea - coordinatesB(1));
yb=(minArea - coordinatesB(2)):resolution:(maxArea - coordinatesB(2));
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

figure1 = surf(XArea, YArea, Zmix); 


%surf(Xgrund,Ygrund, Z2);
figure1 = surf(XArea, YArea, Zmix);  %RICHTIGE ÜBERLAGERUNG
% sliderFreq = uicontrol(figure1, 'Style', 'slider',... VERSUCH ZU GUI
%                        'Min',10,'Max',300, ...
%                        'Value',100, ...
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

% if ~isempty(coordinatesL)
%     % Hier kommt dann der Linienplot hin
% %     xVec = coordinatesL(1)-5:coordinatesL(1)+5;
% %     yVec = coordinatesL(2)-5:coordinatesL(2)+5;
% end


end
