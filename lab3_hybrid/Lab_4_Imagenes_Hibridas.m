clear all; close all; clc;

I_b = imread('bird.bmp');
I_p = imread('plane.bmp');

s_Ib = size(I_b);
s_Ip = size(I_p);

h_lp = fspecial('gaussian', 44, 8);        %low pass

%apply High pass filter to bird

I_b_lowp = imfilter(I_b, h_lp);        %apply low pass

I_b_highp = I_b - I_b_lowp;         %"high pass filter"

%apply low pass filter to bird

I_p_lowp = imfilter(I_p, h_lp);        %apply low pass

%Fast fourier transforms
fft_I_b = fft2(I_b);
fft_h_lp = fft2(h_lp);
fft_I_b_highp = fft2(I_b_highp);

fft_I_p = fft2(I_p);
fft_I_p_lowp = fft2(I_p_lowp);

figure(1)
subplot(1,3,1), imshow(fft_I_b), title('FFT bird.bmp');
subplot(1,3,2), imshow(fft_h_lp), title('FFT Gaussian Filter');
subplot(1,3,3), imshow(fft_I_b_highp), title('FFT High passed bird');

print('-dpng', 'Fourier_bird_and_filter.png');

figure(2)
subplot(1,3,1), imshow(fft_I_p), title('FFT plane.bmp');
subplot(1,3,2), imshow(fft_h_lp), title('FFT Gaussian Filter');
subplot(1,3,3), imshow(fft_I_p_lowp), title('FFT Low Passed plane');
print('-dpng', 'Fourier_plane_and_filter.png');

%2-D discrete cosine transform
% dct_I_b = dct2(I_b, [3 3]);
% dct_h_lp = dct2(h_lp, [1 1]);
% dct_I_b_highp = dct2(I_b_highp, [3 3]);
% 
% dct_I_p = dct2(I_p, [3 3]);
% dct_I_p_lowp = dct2(I_p_lowp, [3 3]);
% 
% figure(3)
% subplot(1,3,1), imshow(dct_I_b), title('DCT bird.bmp');
% subplot(1,3,2), imshow(dct_h_lp), title('DCT Gaussian Filter');
% subplot(1,3,3), imshow(dct_I_b_highp), title('DCT High passed bird');
% 
% print('-dpng', 'DCT_bird_and_filter.png');
% 
% figure(4)
% subplot(1,3,1), imshow(dct_I_p), title('DCT plane.bmp');
% subplot(1,3,2), imshow(dct_h_lp), title('DCT Gaussian Filter');
% subplot(1,3,3), imshow(dct_I_p_lowp), title('DCT Low Passed plane');
% print('-dpng', 'DCT_plane_and_filter.png');

%Adding the images

Hyb = I_b_highp + I_p_lowp;

figure (5)
imshow(Hyb)
title('Hybrid Plane Bird');
print('-djpeg','basePyramidPlaneBird.jpg') 

%forming the pyramid
X1 = impyramid(Hyb, 'reduce');
X2 = impyramid(X1, 'reduce');
X3 = impyramid(X2, 'reduce');
X4 = impyramid(X3, 'reduce');

%View images

figure(6), imshow(X1)
print('-djpeg','level1_PyramidPlaneBird.jpg');
 
figure(7), imshow(X2)
print('-djpeg','level2_PyramidPlaneBird.jpg');
 
figure(8), imshow(X3)
print('-djpeg','level3_PyramidPlaneBird.jpg');

figure(9), imshow(X4)
print('-djpeg','level4_PyramidPlaneBird.jpg'); 




