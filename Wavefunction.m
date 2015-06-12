function Wavefunction(handle, event)

c = 343;          % sound velocity for calculating frequency

global coordinates
global coordinatesA
global coordinatesB
global coordinatesL
global mousebutton

% variables for coordinates/A/B are set to zero if the coordinates aren't 
%set already
if isempty(coordinates)
    coordinates = [0 0];
end

if isempty(coordinatesA)
    coordinatesA = [0 0];
end

if isempty(coordinatesB)
    coordinatesB = [0 0];
end

% it is checked if the user clicked right or left mouse-button 

if strcmp(mousebutton,'right')
    coordinatesA = coordinates;
elseif strcmp(mousebutton,'left')
    coordinatesB = coordinates;
elseif strcmp(mousebutton,'both')
   coordinatesL = coordinates;
end

freqA = 100;
freqB = 100;
amplA = 1;
amplB = 1;
phaseA = 180;
phaseB = 180;
angle = '2D';

%% Calculation of parameters used in generating sinusoids
% input frequency is transformed to wave number
kA = (2*pi()*freqA)/c;  
kB = (2*pi()*freqB)/c;

% input phase in degree is transformed to radiant
phaseA = (2*pi()/360)*phaseA;
phaseB = (2*pi()/360)*phaseB;

% the coordinates of the sources A and B are set, default place is central
xA =(-25 - coordinatesA(1)):0.1:(25 - coordinatesA(1));
yA =(-25 - coordinatesA(2)):0.1:(25 - coordinatesA(2));
[Xa,Ya] = meshgrid(xA,yA); % create rectangullar mesh

xb=(-25 - coordinatesB(1)):0.1:(25 - coordinatesB(1));
yb=(-25 - coordinatesB(2)):0.1:(25 - coordinatesB(2));
[Xb,Yb] = meshgrid(xb,yb);

xgrund = -25:0.1:25;
ygrund = -25:0.1:25;
[Xgrund,Ygrund] = meshgrid(xgrund,ygrund);


Ra=sqrt(Xa.^2+Ya.^2);       %radius
Rb=sqrt(Xb.^2+Yb.^2);       

%% Animation of the sinusoidal waves
% MUSS NOCH VERNÜNFTIG HOCHGEZÄHLT WERDEN!
time = clock;
phi = time(6)*-2;


Za = amplA * sin(kA * Ra + (phi+phaseA));
Zb = amplB * sin(kB * Rb + (phi+phaseB));
Zmix = Za + Zb;

figure1 = surf(Xgrund, Ygrund, Zmix); 

set(figure1,'ButtonDownFcn',@clickCallback);

if strcmp(angle,'3D')
    view([0 50])
else
    view([0 90])
end

colormap('gray');
shading interp;

if ~isempty(coordinatesL)
    % Hier kommt dann der Linienplot hin
%     xVec = coordinatesL(1)-5:coordinatesL(1)+5;
%     yVec = coordinatesL(2)-5:coordinatesL(2)+5;
end


end
