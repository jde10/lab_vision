%Banco de filtros
[filterBank] = fbCreate;

%Directorio
imDir = ('/Users/JDLVF/Documents/MATLAB/textures/train/');
imFile = ('/Users/JDLVF/Documents/MATLAB/textures/train/*.jpg');

D0 = dir(imFile);

%imagen de referencia
Im1 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T01_01.jpg');
Im1 = double(Im1)/255; %normalized grayscale image
Im2 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T02_01.jpg');
Im2 = double(Im2)/255; %normalized grayscale image
Im3 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T03_01.jpg');
Im3 = double(Im3)/255; %normalized grayscale image
Im4 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T04_01.jpg');
Im4 = double(Im4)/255; %normalized grayscale image
Im5 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T05_01.jpg');
Im5 = double(Im5)/255; %normalized grayscale image
Im6 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T06_01.jpg');
Im6 = double(Im6)/255; %normalized grayscale image
Im7 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T07_01.jpg');
Im7 = double(Im7)/255; %normalized grayscale image
Im8 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T08_02.jpg');
Im8 = double(Im8)/255; %normalized grayscale image
Im9 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T09_01.jpg');
Im9 = double(Im9)/255; %normalized grayscale image
Im10 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T10_03.jpg');
Im10 = double(Im10)/255; %normalized grayscale image

Im11 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T11_01.jpg');
Im11 = double(Im11)/255; %normalized grayscale image
Im12 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T12_01.jpg');
Im12 = double(Im12)/255; %normalized grayscale image
Im13 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T13_03.jpg');
Im13 = double(Im13)/255; %normalized grayscale image
Im14 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T14_02.jpg');
Im14 = double(Im14)/255; %normalized grayscale image
Im15 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T15_01.jpg');
Im15 = double(Im15)/255; %normalized grayscale image
Im16 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T16_01.jpg');
Im16 = double(Im16)/255; %normalized grayscale image
Im17 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T17_01.jpg');
Im17 = double(Im17)/255; %normalized grayscale image
Im18 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T18_02.jpg');
Im18 = double(Im18)/255; %normalized grayscale image
Im19 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T19_01.jpg');
Im19 = double(Im19)/255; %normalized grayscale image
Im20 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T20_01.jpg');
Im20 = double(Im20)/255; %normalized grayscale image

Im21 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T21_01.jpg');
Im21 = double(Im21)/255; %normalized grayscale image
Im22 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T22_01.jpg');
Im22 = double(Im22)/255; %normalized grayscale image
Im23 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T23_03.jpg');
Im23 = double(Im23)/255; %normalized grayscale image
Im24 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T24_01.jpg');
Im24 = double(Im24)/255; %normalized grayscale image
Im25 = imread('/Users/JDLVF/Documents/MATLAB/textures/train/T25_02.jpg');
Im25 = double(Im25)/255; %normalized grayscale image

I = [Im1, Im2, Im3, Im4, Im5; Im6, Im7, Im8, Im9, Im10; Im11, Im12, Im13, Im14, Im15; Im16, Im17, Im18, Im19, Im20; Im21, Im22, Im23, Im24, Im25];
figure
imshow(I)
%numero de textones en el diccionario
k = 60;

%Crear diccionario de textones
[map, textons] = computeTextons(fbRun(filterBank,I),k);