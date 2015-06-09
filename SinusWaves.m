% Script to call Wavefunction in GUI
clear all
close all

phi = 1;

figure1 = figure();
t = timer('Period', 0.5, 'TimerFcn', @Wavefunction, 'ExecutionMode', 'FixedRate');
start(t);
uiwait(figure1);
stop(t);
delete(t);