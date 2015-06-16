**README**
----------
>This project, which exists of several functions and scripts serves as a framework for the given task during the study module data and algorithm.

**Description of the project**

The aim of the project is to provide a GUI programme which simulates the propagation of two sinosoidal waves. On this occasion, the wave field should be shown as an animated graphic. Besides, the possibility should insist on being able to place two sound sources successively within these graphic.
In this case the sound source are sinusoidale waves. These waves should emit circle waves which overlap. 
In addition amplitude, frequency and the startingphase should be able to be set for each of the two sources. 

**Usage and an instruction for the user**
**Short version**
- Start script SinusWaves with MATLAB R2015a.
- Right and left mouseclick in the waveplot to set sources.
- Set desired parameters with sliders.
- To get a lineplot: Hold shift and click anywhere in waveplot with left mousebutton. 

**Long version**
In order to run the scripts and functions, MATLAB R2015a must be used. The script SinusWaves is required to represent the animated sine presentation, after running the script a GUI will follow. This GUI should be operated in full-screen mode, so that an entire and well representation is allowed. After that, different values for the frequency, amplitude and phase can be adjusted by using the six different sliders. In each case, three of the sliders are responsible for one source. So it´s possible to specify the sources by different parameter values for the sources. The placement of the sources is done by clicking into the simulation. On this occasion, the positions can be freely chosen and changed always during the whole simulation. Setting the Source "left" is done by pressing the left and Source "right" by pressing the right mouse button. When you press the left mouse button and shift, a line plot will be presented. This lineplot shows the local waveform or rather the local sum of the two sources. The user can change the parameters during the whole run.

**Dependencies and installation tips**

To be able to show the graphical user interface in a good manner, the use of MATLAB R2015a is required. While using prior MATLAB versions mistakes can originate and a flawless implementation is not guaranteed any more.

**Authors**

The students of the Jade Hochschule of Oldenburg made, as a task within the study module data and algorithm, this MATLAB scripts and functions.
- Andrea Decker (6007828)
- Anika Morgenstern (6006711)
- Svenja Pape (6007209) 

**Version history**

Version 0.1 -> 08.06.2015 
- Basic structure. No GUI exists till now.
Functions: It´s possible to see sine waves overlapping. Adjusting of the amplitude, frequency and phase using a dialogue field.

Version 0.1.1 -> 09.06.2015 
- SinusWaves1 was transformed into a GUI. SinusWaves is a script to call + Wavefunction is now a function. Add of clickCallback to get coordinates. With a mouse click on the plot you get the coordinates.

Version 0.2.1 -> 09.06.2015 
- The sources can be placed arbitrarily by right and left mouse click.

Version 0.2.1 -> 11.06.2015 
- Try out of different GUI features (GUI-Slider is commented out. Improving commentation of the function clickCallback.)

Version 0.3.1 - > 06.12.2015 
- Add of a line plot. The meshgrid of the plot is counted only in integer increments. The meshgrid has no more negative axis (no 0). Creation of basic Meshgrids now outsourced. Outsourcing the selection of amplitude, frequency and phase. Magic-Numbers when creating the Meshgrids (resolution ("resolution", increment)avoided).

Version 0.3.2 - > 13.06.2015 
- Bug fixed in "click callback" by mistake. Added negative axes again, as there are problems in setting the sources otherwise. Get a third function of the mouse to select coordinates (use shift+left mouse button). Axes were changed to -200 to 200 with increments of one. Thereby allowing a better read of coordinates for line plot.

Version 0.3.3 - > 13.06.2015 
- Fixed a bug in "click callback" and "left shift" has been renamed to "left shift". On this occasion, the amplitude is indicated by "Zmix", more than 5 points before and after the elective point in wave direction. For this, the left mouse button+shift must be created. (ISSUE: Works so far in the positive range) Further problems existing artifacts in waveplot, partly missing registration of the mouse button and just representation in positiven area possible.

Version 0.4.1 - > 13.06.2015 
- New creation of the function for displaying the line plot at any point in Waveplot. Bugs have been removed, before only in 1st quadrant a line plot was possible and an error occured when clicking near the edges/axes. Furthermore, the axes were improved and unnecessary labels removed. Adding a short user manual as a title. Revise and supplement missing commentary.

Version 0.4.2 - > 13.06.2015 
- Choice of a 3D view has been removed because this was not compatible with other features. Replaceing of default "inputdlg" GUI of Matlab with an own created GUI. For slider switch between suitable values is now available. The waveplot appears only when the user has set the parameters. Present problem only unique use is possible, then programm must be restarted. In addition, the file "Input Dialog" was partially commented.

Version 0.4.3 - > 13.06.2015 
- Computing power was reduced by lower maxArea. Using a global variable, the phase is incremented to get animated waves.

**Explanation of the MATLAB-Code**

 - **SinusWaves** is a MATLAB script which is necessary to run the simulation of the wave propagation of two sinusoidals. To be able to use this script, it must be executed by running it with run(SinusWaves.m). As output you get a GUI which performs the simulation of the sinusoidal waves.
 
 - **Wavefunction** is a function to calculate and animate the sinusoidals and the line plot. If you want to run this script you have to run the Wavefunction by entering the input parameter (run Wavefunction(handle,event)). In this case the handle is a figure handle and the event needs to be empty. As output you get the animation of the sinusoidals and the lineplot, which are included into the GUI, which is opened by SinusWaves.   

 - **sliderCallback**


 


 - **InputDialog** is a script to define all used uicontrols and read out their values. To use this script you need to running it by run(InputDialog.m). As output you get a collection of sliders to change the value of signal related variables. Now you are abel to change the different sliders and see different amplitudes, frequencies and phases. So the different settings change the animated GUI or the used sources, if InputDialog is used in combination with the script SinusWaves.

 - **getClick** is a callback function which can be used by running clickCallback(ClickHandle,event). The input parameter is on the one side the handle (figure handle) and on the other side the empty event. As output you get the coordinates which are belonging to the position of the mouseclick. Without this function you aren´t abel to set the sources on different place in the GUI becaues you´ll get no coordinates to work with.
