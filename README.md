# WellenausbreitungGitordner
Gitordner für die zweite Programmieraufgabe (Wellenausbreitung) im SS15 


**README**
----------
>This project which exists of several functions and scripts serves as a framework for the given task during the study module data and algorithm.

**Description of the project**

The job of the students is to provide a GUI programme which simulates the propagation of two sinosoidal waves. On this occasion, the wave field should be shown as an animated graphic. Besides, the possibility should insist on being able to place two sound sources successively within these graphic.
In this case as the sound sources are sinusoidale waves. These waves should emit circle waves which overlap. 
In addition, an amplitude, frequency and phase should be able to be put for each of the two sound sources. 

**Usage examples and an instruction for the user**

In order to run the scripts and functions MATLAB R2015a must be used. The script SinusWaves is required to represent the animated sine presentation, after running the script a GUI will follow. This GUI should be operated in full-screen mode, so that an entire and well representation is allowed. After that, different values ​​for the frequency, amplitude and phase can be adjusted by using the six different sliders. In each case three of the sliders are responsible for one source. So it´s possible to specifie the sources by different parameter values ​​for the sources. The placement of the sources is done by clicking into the simulation. On this occasion, the positions can be freely chosen and changed always during the whole simulation. Setting the Source A is done by pressing the left and Source B by pressing the right mouse button. When you press the left mouse button and shift, a line plot will be presented. This lineplot shows the local waveform or rather the local sum of the two sources.
After the user has made different parameter inputs and run the line plot, new settings can be made.

**Dependencies and installation tips**

To be able to show the graphical user interface in a good manner, the use of MATLAB R2015a is required. While using prior MATLAB versions mistakes can originate and a flawless implementation is not guaranteed any more.

**Authors**

The students of the Jade Hochschule of Oldenburg made, as a task within the study module data and algorithm, this MATLAB scripts and functions.
- Andrea Decker (6007828)
- Anika Morgenstern (6006711)
- Svenja Pape (6007209) 

**Version history**

Version 0.1 -> 08.06.2015 
- basic structure. It still exists no GUI.
Functions: It´s possible to see sine waves overlapping. Adjusting of the amplitude, frequency and phase occurs above a dialogue field.

Version 0.1.1 -> 09.06.2015 
- SinusWaves1 was transformed in a GUI. SinusWaves is a script to call + Wavefunction is now a function. Add of clickCallback to get coordinates. With a mouse click on the plot you get the coordinates.

Version 0.2.1 -> 09.06.2015 
- The sources can be placed arbitrarily by right and left mouse click.

Version 0.2.1 -> 11.06.2015 
- Try out of different GUI features (GUI-Slider is out commented. Improving commentation of the function clickCallback.

Version 0.3.1 - > 06.12.2015 
- Add of a line plot. The meshgrid of the plot is counted only in integer increments . The meshgrid has no more negative axis ( no 0 ). Creation of basic Meshgrids now outsourced . Outsourcing the selection of amplitude , frequency and phase . Magic-Numbers when creating the Meshgrids (resolution ("resolution", increment)avoided).

Version 0.3.2 - > 13.06.2015 
- Bug fixed in "click callback" by mistake. Added negative axes again, as there are problems in setting the sources otherwise. Get a third function of the mouse to select coordinates (use shift+left mouse button).  Axes were changed to -200 to 200 with increments of one. Thereby allowing a better read of coordinates for line plot.

Version 0.3.3 - > 13.06.2015 
- Fixed a bug in "click callback" and "left shift" has been renamed to "left shift". On this occasion, the amplitude is indicated by "Zmix", more than 5 points before and after the elective point in wave direction. For this, the left mouse button+shift must be created. (ISSUE: Works so far in the positive range) Further problems existing artifacts in waveplot, partly missing registration of the mouse button and just representation in positiven area possible .

Version 0.4.1 - > 13/06/2015 
- New creation of the function for displaying the line plot at any point in Waveplot . Bugs have been removed, before only in 1st quadrant a line plot was possible and error when clicking near the edges/axes. Furthermore, the axes were improved and unnecessary labels removed. Adding a short user manual as a title. Revise and supplement missing commentary .

Version 0.4.2 - > 13.06.2015 
- Choice of a 3D view has been removed because this was not compatible with other features. Replaceing of default "inputdlg" GUI of Matlab with an own created GUI. For slider switch between suitable values is now available​​. The waveplot appears only when the user has set the parameters. Present problem only unique use is possible, then programm must be restarted. In addition, the file "Input Dialog" was partially commented.

Version 0.4.3 - > 13.06.2015 
- Computing power was reduced by lower maxArea. Using a global variable: phase can be incremented now.

**Explanation of the MATLAB-Code**
