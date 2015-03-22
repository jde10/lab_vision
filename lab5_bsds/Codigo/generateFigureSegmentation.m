clear all; close all; clc

%% Read Original Image
I = imread('/Users/JDLVF/Documents/MATLAB/BSR/bench/data/images/8068.jpg');

figure,
imshow(I)

print('-dpng', 'imagenPrueba.png')

clusters = 30

%% Generate K-Means Segmentation
K1 = segment_by_clustering(I, 'rgb', 'watershed', clusters);
K2 = segment_by_clustering(I, 'rgb+xy', 'watershed', clusters);
K3 = segment_by_clustering(I, 'hsv', 'watershed', clusters);
K4 = segment_by_clustering(I, 'hsv+xy', 'watershed', clusters);
K5 = segment_by_clustering(I, 'lab', 'watershed', clusters);
K6 = segment_by_clustering(I, 'lab+xy', 'watershed', clusters);

figure,
subplot(2,3,1)
imshow(K1,[], 'Colormap', jet)
title('watershed RGB')
subplot(2,3,2)
imshow(K2,[], 'Colormap', jet)
title('watershed RGB+XY')
subplot(2,3,3)
imshow(K3,[], 'Colormap', jet)
title('watershed HSV')
subplot(2,3,4)
imshow(K4,[], 'Colormap', jet)
title('watershed HSV+XY')
subplot(2,3,5)
imshow(K5,[], 'Colormap', jet)
title('watershed LAB')
subplot(2,3,6)
imshow(K6,[], 'Colormap', jet)
title('watershed LAB+XY')

print('-dpng', 'segmentacionsPruebaWatershed.png')