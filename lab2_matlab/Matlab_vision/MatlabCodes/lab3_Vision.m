close all; clear all; clc;
%%Reading images
I_1 = imread('/Users/JDLVF/Documents/MATLAB/misc/5.1.12.tiff');
I_1i = imfinfo('/Users/JDLVF/Documents/MATLAB/misc/5.1.12.tiff');
Answer1 = strcat('The dimension of the output of 5.1.12 is:', num2str(I_1i.Height), 'x', num2str(I_1i.Width));
disp(Answer1)

I_2 = imread('/Users/JDLVF/Documents/MATLAB/misc/4.2.03.tiff');
I_2i = imfinfo('/Users/JDLVF/Documents/MATLAB/misc/4.2.03.tiff');
Answer2 = strcat('The dimension of the output of 4.2.03 is:', num2str(I_2i.Height), 'x', num2str(I_2i.Width));
disp(Answer2)

%% Displaying images
figure(1)
imshow(I_1)         %displays the image

figure(2)
image(I_2)          %Displays an axis on the outer border of the image

%% Writing images
imwrite(I_1, '5_1_12.jpg', 'jpg', 'Comment', 'My JPEG file')

%% Adding Noise

sI = size(I_1);
V = rand([sI(1) sI(2)]);

I_gaussian = imnoise(I_1, 'gaussian');
I_poisson = imnoise(I_1, 'poisson');
I_sp = imnoise(I_1, 'salt & pepper');
I_speckle = imnoise(I_1, 'speckle');
I_localvar = imnoise(I_1, 'localvar', V);

imwrite(I_gaussian, '5.1.12.gauss.tiff');
imwrite(I_poisson, '5.1.12.poiss.tiff');
imwrite(I_sp, '5.1.12.sp.tiff');
imwrite(I_speckle, '5.1.12.speck.tiff');
imwrite(I_localvar, '5.1.12.locvar.tiff');

imwrite(I_gaussian, '5_1_12_gaussian.jpg', 'jpg', 'Comment', 'My JPEG file')
imwrite(I_poisson, '5_1_12_poisson.jpg', 'jpg', 'Comment', 'My JPEG file')
imwrite(I_sp, '5_1_12_sp.jpg', 'jpg', 'Comment', 'My JPEG file')
imwrite(I_speckle, '5_1_12_speckle.jpg', 'jpg', 'Comment', 'My JPEG file')
imwrite(I_localvar, '5_1_12_localvar.jpg', 'jpg', 'Comment', 'My JPEG file')

%% Median filter

% mean filter:
h = fspecial('average', [3 3]);
I_meanf = imfilter(I_sp, h);
I_median = medfilt2(I_sp, [3 3]);

figure(3)
subplot(1,2,1)
imshow(I_meanf)
title('S&P mean filter [3 3]')


subplot(1,2,2)
imshow(I_median)
title('S&P median filter [3 3]')

print('-dpng', 'SnP_mean_median_filter_3x3.png');

h = fspecial('average', [5 5]);
I_meanf2 = imfilter(I_sp, h);
I_median2 = medfilt2(I_sp, [5 5]);

figure(4)
subplot(1,2,1)
imshow(I_meanf2)
title('S&P mean filter [5 5]')


subplot(1,2,2)
imshow(I_median2)
title('S&P median filter [5 5]')
print('-dpng', 'SnP_mean_median_filter_5x5.png');


h = fspecial('average', [3 3]);
I_meanfsp = imfilter(I_sp, h);
I_mediansp = medfilt2(I_sp, [3 3]);

figure(5)
subplot(1,2,1)
imshow(I_meanfsp)
title('Speck mean filter [5 5]')


subplot(1,2,2)
imshow(I_mediansp)
title('speck median filter [5 5]')
print('-dpng', 'Speck_mean_median_filter_5x5.png');


h = fspecial('average', [5 5]);
I_meanfGa = imfilter(I_gaussian, h);
I_medianGa = medfilt2(I_gaussian, [5 5]);

figure(6)
subplot(1,2,1)
imshow(I_meanfGa)
title('Gaussian mean filter [5 5]')


subplot(1,2,2)
imshow(I_medianGa)
title('Gaussian median filter [5 5]')
print('-dpng', 'Gaussian_mean_median_filter_5x5.png');


h = fspecial('average', [5 5]);
I_meanflc = imfilter(I_localvar, h);
I_medianlc = medfilt2(I_localvar, [5 5]);

figure(7)
subplot(1,2,1)
imshow(I_meanflc)
title('Local Variance mean filter [5 5]')


subplot(1,2,2)
imshow(I_medianlc)
title('Local Variance median filter [5 5]')
print('-dpng', 'LocalVar_mean_median_filter_5x5.png');

%% Blur

h1 = fspecial('average', [3 3]);
h2 = fspecial('gaussian', [3 3], 0.5);
h3 = fspecial('gaussian', [3 3], 3);

h4 = fspecial('average', [7 7]);
h5 = fspecial('gaussian', [7 7], 0.5);
h6 = fspecial('gaussian', [7 7], 3);

I_smoothmean1 = imfilter(I_1, h1);
I_smoothgauss1 = imfilter(I_1, h2);
I_smoothgauss1pri = imfilter(I_1, h3);

I_smoothmean2 = imfilter(I_1, h4);
I_smoothgauss2 = imfilter(I_1, h5);
I_smoothgauss2pri = imfilter(I_1, h6);

figure(8)
subplot(1,2,1)
imshow(I_smoothmean1)
title('Smoothing mean filter [3 3]')


subplot(1,2,2)
imshow(I_smoothgauss1)
title('Smoothing gaussian filter [3 3], sigma 0.5')
print('-dpng', 'Smooth_mean_gaussian_filter_3x3.png');


figure (9)
subplot(1,2,1)
imshow(I_smoothmean2)
title('Smoothing mean filter [7 7]')


subplot(1,2,2)
imshow(I_smoothgauss2)
title('Smoothing gaussian filter [7 7], sigma 0.5')
print('-dpng', 'Smooth_mean_gaussian_filter_7x7.png');


figure (10)
subplot(1,2,1)
imshow(I_smoothmean2)
title('Smoothing mean filter [7 7]')


subplot(1,2,2)
imshow(I_smoothgauss2pri)
title('Smoothing gaussian filter [7 7], sigma 3')
print('-dpng', 'Smooth_mean_gaussian_filter_7x7_sigma3.png');


figure (11)
subplot(1,2,1)
imshow(I_smoothmean1)
title('Smoothing mean filter [3 3]')


subplot(1,2,2)
imshow(I_smoothgauss1pri)
title('Smoothing gaussian filter [3 3], sigma 3')
print('-dpng', 'Smooth_mean_gaussian_filter_3x3_sigma3.png');

%% Sharpen

I_1sharp = imsharpen(I_1);

figure(12)
imshow(I_1sharp)
title('Sharpened 5.1.12.tiff')
print('-dpng', 'Sharpened_5.1.12.png');


I_smoothsharp = imsharpen(I_smoothmean1);

figure(13)
subplot(1,2,1)
imshow(I_smoothmean1)
title('5.1.12.tiff Smoothed with mean filter [3 3]');

subplot(1,2,2)
imshow(I_smoothsharp)
title('5.1.12.tiff Smoothed with mean filter [3 3] and sharpened');
print('-dpng', 'Smoothed_and_Sharpened_5.1.12.png');


%% Edge Detection

h1 = fspecial('laplacian');
h2 = fspecial('log');
h3 = fspecial('prewitt');
h4 = fspecial('sobel');

disp('Prewitt filter:')
disp(h3)
disp('Sobel filter:')
disp(h4)

I_h1 = imfilter(I_1, h1);
I_h2 = imfilter(I_1, h2);
I_h3 = imfilter(I_1, h3);
I_h4 = imfilter(I_1, h4);

figure (14)
imshow(I_h1)
title('Laplacian Edge Detection on 5.1.12.tiff')
print('-dpng', 'Laplacian_edgeDet_5.1.12.png');


figure (15)
imshow(I_h2)
title('Laplacian of Gaussian Edge Detection on 5.1.12.tiff')
print('-dpng', 'Log_edgeDet_5.1.12.png');


figure (16)
imshow(I_h3)
title('Prewitt Edge Detection on 5.1.12.tiff')
print('-dpng', 'Prewitt_edgeDet_5.1.12.png');


figure (17)
imshow(I_h4)
title('Sobel Edge Detection on 5.1.12.tiff')
print('-dpng', 'Sobel_edgeDet_5.1.12.png');


%% Color spaces

Mand = imread('/Users/JDLVF/Documents/MATLAB/misc/4.2.03.tiff');
r = Mand(:,:,1);
g = Mand(:,:,2);
b = Mand(:,:,3);

figure (18)
subplot(2,2,1), subimage(Mand);
subplot(2,2,2), subimage(r);
subplot(2,2,3), subimage(g);
subplot(2,2,4), subimage(b);

print('-dpng', 'rgb_mosaic.png');

MandYCbCr = rgb2ycbcr(Mand);
Y = MandYCbCr(:,:,1);
Cb = MandYCbCr(:,:,2);
Cr = MandYCbCr(:,:,3);

figure (19)
subplot(2,2,1), subimage(MandYCbCr);
subplot(2,2,2), subimage(Y);
subplot(2,2,3), subimage(Cb);
subplot(2,2,4), subimage(Cr);

print('-dpng', 'ycbcr_mosaic.png');

MandLab = RGB2Lab(Mand);
L = MandLab(:,:,1);
a = MandLab(:,:,2);
b = MandLab(:,:,3);

figure (20)
subplot(2,2,1), subimage(MandLab);
subplot(2,2,2), subimage(L);
subplot(2,2,3), subimage(a);
subplot(2,2,4), subimage(b);

print('-dpng', 'lab_mosaic.png');

Mandhsv = rgb2hsv(Mand);
H = Mandhsv(:,:,1);
S = Mandhsv(:,:,2);
V = Mandhsv(:,:,3);

figure (21)
subplot(2,2,1), subimage(Mandhsv);
subplot(2,2,2), subimage(H);
subplot(2,2,3), subimage(S);
subplot(2,2,4), subimage(V);


print('-dpng', 'hsv_mosaic.png')

%% Pyramids

I0 = I_1;
I1 = impyramid(I0, 'reduce');
I2 = impyramid(I1, 'reduce');
I3 = impyramid(I2, 'reduce');

figure (22)
subplot(2,2,1), imshow(I0), title('Level1');
subplot(2,2,2), imshow(I1), title('Level2');
subplot(2,2,3), imshow(I2), title('Level3');
subplot(2,2,4), imshow(I3), title('Level4');

print('-djpeg', 'pyramid_mosaic.jpg')

%% Template Matching

I_3 = imread('/Users/JDLVF/Documents/MATLAB/sequences/motion04.512.tiff');

figure (23)
train = imcrop(I_3)

c= normx2corr(train,I_3);
[sx,sy] = size(I_3);
d = floor(size(train)/2);
dx=d(1);
dy=d(2);
c2=c(dx+1:sx+dx,dy+1:sy+dy);
c3=c2.^3;
cr=0.5+0.5*c3;
y=mat2gray(I_3);
cb=0.5*ones(size(I_3));
ycbcr=cat(3,y,cb,cr);
rgb=ycbcr2rgb(ycbcr);
imshow(rgb);
 