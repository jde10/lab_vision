clear all; close all; clc

% %% figura 1
% 
% %buddha
% Im1 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/buddha/image_0001.jpg'), [256,256]);
% Im2 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/buddha/image_0002.jpg'), [256,256]);
% Im3 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/buddha/image_0003.jpg'), [256, 256]);
% 
% %piano
% Im4 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/grand_piano/image_0001.jpg'), [256,256]);
% Im5 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/grand_piano/image_0002.jpg'), [256,256]);
% Im6 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/grand_piano/image_0003.jpg'), [256,256]);
% 
% %stegosaurus
% Im7 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/stegosaurus/image_0001.jpg'), [256,256]);
% Im8 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/stegosaurus/image_0002.jpg'), [256,256]);
% Im9 = imresize(imread('/Users/JDLVF/Documents/MATLAB/caltech101/data/caltech-101/101_ObjectCategories/stegosaurus/image_0003.jpg'), [256,256]);
% 
% FIG_1 = [Im1, Im2, Im3; Im4, Im5, Im6; Im7, Im8, Im9];
% 
% figure, 
% imshow(FIG_1)
% print('-dpng', 'fig1PHOW.png')
% 
% %% figura 2
% Im10 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/weasel/n02441942_29342.JPEG')
% Im11 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/weasel/n02441942_28318.JPEG')
% Im12 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/weasel/n02441942_27965.JPEG')
% 
% Im13 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/golfcart/n03445924_31914.JPEG')
% Im14 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/golfcart/n03445924_29191.JPEG')
% Im15 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/golfcart/n03445924_28749.JPEG')
% 
% Im16 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/banana/n07753592_25774.JPEG')
% Im17 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/banana/n07753592_25240.JPEG')
% Im18 = imread('/Users/JDLVF/Documents/MATLAB/imagenet_tiny/train/banana/n07753592_24491.JPEG')
% 
% FIG_2 = [Im10, Im11, Im12; Im13, Im14, Im15; Im16, Im17, Im18];
% 
% figure, 
% imshow(FIG_2)
% print('-dpng', 'fig2PHOW.png')

%% Train data

%15     30      50
trainY = [15.60, 19.67, 22.48];
trainX = [15, 30, 50];

figure, 
plot(trainX, trainY, 'b')
xlabel('# de imagenes de entrenamiento')
ylabel('Accuracy')
print('-dpng', 'fig3trainPHOW.png')

%% Categories
        %25     50      100     200
catY = [39.28, 33.80, 29.44, 22.48];
catX = [25, 50, 100, 200];

figure, 
plot(catX, catY, 'b')
xlabel('# de categor?as de entrenamiento')
ylabel('Accuracy')

print('-dpng', 'fig4catPHOW.png')

%% Spatial X
            %[1,2]  [2,4] [8,16]
spatialZ = [39.04, 39.28, 34.88 ];
spatialX = [1, 2, 8];
spatialY = [2, 4, 16];
spatial = [1,2,39.04;2,4,39.28; 8,16,34.88];
 

figure,
mesh(spatial)
colormap(jet)
xlabel('tamano en X')
ylabel('tamano en Y')
zlabel('Accuracy')

print('-dpng', 'fig5spatialPHOW.png')

%% Times analysis

