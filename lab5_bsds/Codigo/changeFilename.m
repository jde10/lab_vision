direc = '/media/jdelavega/Disk2/MATLAB/Files/watershedlab/';
fileDir = '/media/jdelavega/Disk2/MATLAB/Files/watershedlab/*.mat';
D = dir(fileDir);

for k=1:length(D),
    load(strcat(direc, D(k).name));
    name = strtok(D(k).name, '.');
    name = strcat(name, '.mat');
    save(name, 'segs');
    clear segs name
end