clear all; close all; clc;

I_b = imread('Heath.png');
I_p = imread('Joker.png');

s_Ib = size(I_b);
s_Ip = size(I_p);

h_lp = fspecial('gaussian', 44, 8);        %low pass

%apply High pass filter to Heath

I_b_lowp = imfilter(I_b, h_lp);        %apply low pass

I_b_highp = I_b - I_b_lowp;         %"high pass filter"

%apply low pass filter to Heath

I_p_lowp = imfilter(I_p, h_lp);        %apply low pass

%Fast fourier transforms
fft_I_b = fft2(I_b);
fft_h_lp = fft2(h_lp);
fft_I_b_highp = fft2(I_b_highp);

fft_I_p = fft2(I_p);
fft_I_p_lowp = fft2(I_p_lowp);

figure(1)
subplot(1,3,1), imshow(fft_I_b), title('FFT Heath.bmp');
subplot(1,3,2), imshow(fft_h_lp), title('FFT Gaussian Filter');
subplot(1,3,3), imshow(fft_I_b_highp), title('FFT High passed Heath');

print('-dpng', 'Fourier_Heath_and_filter.png');

figure(2)
subplot(1,3,1), imshow(fft_I_p), title('FFT Joker.bmp');
subplot(1,3,2), imshow(fft_h_lp), title('FFT Gaussian Filter');
subplot(1,3,3), imshow(fft_I_p_lowp), title('FFT Low Passed Joker');
print('-dpng', 'Fourier_Joker_and_filter.png');

%2-D discrete cosine transform
% dct_I_b = dct2(I_b, [3 3]);
% dct_h_lp = dct2(h_lp, [1 1]);
% dct_I_b_highp = dct2(I_b_highp, [3 3]);
% 
% dct_I_p = dct2(I_p, [3 3]);
% dct_I_p_lowp = dct2(I_p_lowp, [3 3]);
% 
% figure(3)
% subplot(1,3,1), imshow(dct_I_b), title('DCT Heath.bmp');
% subplot(1,3,2), imshow(dct_h_lp), title('DCT Gaussian Filter');
% subplot(1,3,3), imshow(dct_I_b_highp), title('DCT High passed Heath');
% 
% print('-dpng', 'DCT_Heath_and_filter.png');
% 
% figure(4)
% subplot(1,3,1), imshow(dct_I_p), title('DCT Joker.bmp');
% subplot(1,3,2), imshow(dct_h_lp), title('DCT Gaussian Filter');
% subplot(1,3,3), imshow(dct_I_p_lowp), title('DCT Low Passed Joker');
% print('-dpng', 'DCT_Joker_and_filter.png');

%Adding the images

Hyb = I_b_highp + I_p_lowp;

figure (5)
imshow(Hyb)
title('Hybrid Joker Heath');
print('-djpeg','basePyramidJokerHeath.jpg') 

%forming the pyramid
X1 = impyramid(Hyb, 'reduce');
X2 = impyramid(X1, 'reduce');
X3 = impyramid(X2, 'reduce');
X4 = impyramid(X3, 'reduce');

%View images

figure(6), imshow(X1)
print('-djpeg','level1_PyramidJokerHeath.jpg');
 
figure(7), imshow(X2)
print('-djpeg','level2_PyramidJokerHeath.jpg');
 
figure(8), imshow(X3)
print('-djpeg','level3_PyramidJokerHeath.jpg');

figure(9), imshow(X4)
print('-djpeg','level4_PyramidJokerHeath.jpg'); 




