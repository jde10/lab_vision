clear all; close all; clc

%Banco de filtros
[filterBank] = fbCreate;

%Directorio
imDir = ('C:\Users\j.de10\Documents\MATLAB\train\');
imFile = ('C:\Users\j.de10\Documents\MATLAB\train\T01*');

D0 = dir(imFile);

%imagen de referencia
I = imread(strcat(imDir, D0(1).name));
I = double(I)/255; %normalized grayscale image

%numero de textones en el diccionario
k = 60;

%Crear diccionario de textones
[map, textons] = computeTextons(fbRun(filterBank,I),k);
figure, 
imshow(map)

Ifull = I;
mapFull = map;
%% test

for i=2:numel(D0),
    It = imread(strcat(imDir, D0(i).name));
    It = double(It)/255;
    tmap = assignTextons(fbRun(filterBank, It), textons');
    Ifull = [Ifull, It];
    mapFull = [mapFull, tmap];
end

figure,
image(mapFull)
colormat(jet)