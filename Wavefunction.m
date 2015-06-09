function Wavefunction(handle, event)

%Quelle:
%-Ansicht von oben: https://nf.nci.org.au/facilities/software/Matlab/techdoc/ref/pcolor.html 
c = 343;          % sound velocity for calculating frequency


%% Ideen:
% - Vielleicht noch einen Dämpfungsfaktor?
% - 

%% Input dialog for disired parameters of sources
% prompt={'Enter frequency of source A:',...
%         'Enter frequency of source B:',...
%         'Enter amplitude of source A:', ...
%         'Enter amplitude of source B:', ...
%         'Enter phase of source A:'...
%         'Enter phase of source B:', ...
%         '3D oder 2D eingeben'};
% name='Input for sinusoids';
% numlines=1;
% defaultanswer={'100','10', '1', '1',  '0', '180', '2D'};
% answer=inputdlg(prompt,name,numlines,defaultanswer);
% 
% freqA = str2double(answer{1});
% freqB = str2double(answer{2});
% amplA = str2double(answer{3});
% amplB = str2double(answer{4});
% phaseA = str2double(answer{5});
% phaseB = str2double(answer{6});
% angle = answer{7};


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

xa=-11:0.1:39;
ya=-11:0.1:39;
[Xa,Ya] = meshgrid(xa,ya); % greate rectangullar mesh

xb=-20:0.1:30;
yb=-20:0.1:30;
[Xb,Yb] = meshgrid(xb,yb);

xgrund = -25:0.1:25;
ygrund = -25:0.1:25;
[Xgrund,Ygrund] = meshgrid(xgrund,ygrund);


Ra=sqrt(Xa.^2+Ya.^2);       %radius
Rb=sqrt(Xb.^2+Yb.^2);       

%% Animation of the sinusoidal waves
% MUSS NOCH VERNÜNFTIG!
time = clock;
phi = time(6)*-2;


Za = amplA * sin(kA * Ra + (phi+phaseA));
Zb = amplB * sin(kB * Rb + (phi+phaseB));
Zmix = Za + Zb;


%surf(Xgrund,Ygrund, Z2);
surf(Xgrund, Ygrund, Zmix);  %RICHTIGE ÜBERLAGERUNG

if strcmp(angle,'3D')
    view([0 50])
else
    view([0 90])
end

%axis equal;
colormap('gray');
shading interp;


end
