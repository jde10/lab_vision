clear all; close all; clc

k = (2:2:100);

fileDir = '/Users/JDLVF/Documents/MATLAB/BSR/BSDS500/data/images/test/';
D = dir('/Users/JDLVF/Documents/MATLAB/BSR/BSDS500/data/images/test/*.jpg');
for j=1:length(D)
    imdir = strcat(fileDir, D(j).name);
    I = imread(imdir);
    for i=1:numel(k),
        segs{i} = segment_by_clustering(I, 'hsv', 'kmeans', k(i));
    end
    name = strtok(D(j).name, '.');
    name = strcat(name, '.mat');
    save(name, 'segs');
    clear segs name
end
