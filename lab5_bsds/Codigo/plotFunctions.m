addpath benchmarks
clear all; close all; clc

f = open('isoF.fig'); 
hold on
plot_eval('/media/jdelavega/Disk2/MATLAB/Files/test/test_eval', 'k'), 
hold on
plot_eval('/media/jdelavega/Disk2/MATLAB/Files/test_wsExt', 'm'), 
hold on
plot_eval('/media/jdelavega/Disk2/MATLAB/Files/test_kmeansSel', 'b'), 
legend('Human - F=0.79','Curves','UCM2 - F=0.76','Watershed - F=0.53','K-means - F=0.48', 'Location','SouthWest')

