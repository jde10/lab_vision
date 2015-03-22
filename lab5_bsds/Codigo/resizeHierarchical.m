clear all; close all; clc

%481 321

fileDir = '/media/jdelavega/Disk2/MATLAB/Files/HierarchicalLab/';
GTDir = '/media/jdelavega/Disk2/MATLAB/Files/BSR/BSDS500/data/groundTruth/train/';
D = dir('/media/jdelavega/Disk2/MATLAB/Files/HierarchicalLab/*.mat');
DGT = dir('/media/jdelavega/Disk2/MATLAB/Files/BSR/BSDS500/data/groundTruth/train/*.mat');

for k=1:length(D),
   load(strcat(fileDir, D(k).name));
   
   for j=1:length(DGT),
      if (strcmp(D(k).name, DGT(j).name)==1)
          load(strcat(GTDir, DGT(j).name))
          sI = size(groundTruth{1}.Segmentation)
      end
   end
   for i=1:length(segs)
      I = segs{i};
      clear segs{i}
      segs{i} = imresize(I, [sI(1) sI(2)]);
   end
   save(D(k).name, 'segs')
end