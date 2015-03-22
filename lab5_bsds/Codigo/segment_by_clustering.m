function my_segmentation = segment_by_clustering(rgb_image, feature_space, clustering_method, number_of_clusters)
% rgb_image = imread('2018.jpg');
% feature_space = 'rgb';
% clustering_method = 'watershed';
% number_of_clusters = 100;

if (strcmp(clustering_method, 'hierarchical')==1)
    rgb_image = imresize(rgb_image, 0.4);
end

%convert image to double and extract size
rgb_image = double(rgb_image);
sI = size(rgb_image);

% Determine the space selected by user   
spaces = {'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy', 'hsv+xy'};
space_pick = 0;

for i=1:numel(spaces) 
    space_pick = strcmp(spaces(i), feature_space);
    if space_pick == 1
        space_pick = i;
        break
    end
end
% Determine the cluster chosen by user
clusters = {'kmeans', 'gmm', 'hierarchical', 'watershed'};
cluster_pick = 0;

for i=1:numel(clusters)
    cluster_pick = strcmp(clusters(i), clustering_method);
    if cluster_pick == 1
        cluster_pick = i;
        break
    end
end

%convert image
if(space_pick == 1)
    I = rgb_image;
    I = reshape(I(:), [], 3);
    Ig  = double(rgb2gray(uint16(rgb_image)));
	
elseif(space_pick == 2)
    I = RGB2Lab(rgb_image);
    Ig = I(:,:,1);
    I = reshape(I(:), [], 3);
elseif(space_pick == 3)
    I = rgb2hsv(rgb_image);
    Ig = I(:,:,3);
    I = reshape(I(:), [], 3);
elseif(space_pick == 4)
    I = zeros(sI(1), sI(2), 5);
    I(:,:,1) = rgb_image(:,:,1);
    I(:,:,2) = rgb_image(:,:,2);
    I(:,:,3) = rgb_image(:,:,3);
    Ig  = double(rgb2gray(uint16(rgb_image)));
    
    for i=1:sI(1),
        for j=1:sI(2),
            %i es para filas, y
            %j es para columnas, x
            I(i,j,4) = j; %para X
            I(i,j,5) = i; %para Y    
        end
    end
    I = reshape(I(:), [], 5);
elseif(space_pick == 5)
    I = zeros(sI(1), sI(2), 5);
    lab = RGB2Lab(rgb_image);
    I(:,:,1) = lab(:,:,1);
    I(:,:,2) = lab(:,:,2);
    I(:,:,3) = lab(:,:,3);
    Ig = lab(:,:,1);
    
    for i=1:sI(1),
        for j=1:sI(2),
            %i es para filas, y
            %j es para columnas, x
            I(i,j,4) = j; %para X
            I(i,j,5) = i; %para Y    
        end
    end
    I = reshape(I(:), [], 5);
elseif(space_pick == 6)
    I = zeros(sI(1), sI(2), 5);
    hsv = rgb2hsv(rgb_image);
    Ig = hsv(:,:,3);
    I(:,:,1) = hsv(:,:,1);
    I(:,:,2) = hsv(:,:,2);
    I(:,:,3) = hsv(:,:,3);
    
    for i=1:sI(1),
        for j=1:sI(2),
            %i es para filas, y
            %j es para columnas, x
            I(i,j,4) = j; %para X
            I(i,j,5) = i; %para Y    
        end
    end
    I = reshape(I(:), [], 5);
end

% Clustering method

%% K-MEANS
if (cluster_pick == 1)
    C = kmeans(I, number_of_clusters);
    C = reshape(C, [sI(1) sI(2)]);
   
    color = round(255/number_of_clusters);
    my_segmentation = C;
    Seg = C * color;

    figure(1)
    imshow(Seg, [], 'Colormap', jet);

%% GMM
elseif (cluster_pick == 2)
    C = gmdistribution.fit(I, number_of_clusters);
    C2 = cluster(C, I); 
    C2 = reshape(C2, sI(1), sI(2));

    my_segmentation = C2;    
    color = round(255/number_of_clusters);
    Seg = C2 * color;
    
    figure(1)
    imshow(Seg, [], 'Colormap', jet);

%% Hierarchical
elseif (cluster_pick == 3)
    
    Z = linkage(I,'centroid', 'euclidean', 'savememory', 'on');
    T = cluster(Z, 'maxclust', number_of_clusters);
    C2 = reshape(T, sI(1), sI(2));
    C2 = imresize(C2, 2.5);
    my_segmentation = C2;
    color = round(255/number_of_clusters);
    Seg = C2 * color;
    
    figure(1)
    imshow(Seg, [], 'Colormap', jet);

%% Watersheds
elseif (cluster_pick == 4)
    I = Ig;
    hsobel_y = fspecial('sobel');
    hsobel_x = hsobel_y';
    Isobx = imfilter(I, hsobel_x, 'replicate');
    Isoby = imfilter(I, hsobel_y, 'replicate');
    gradmag = sqrt(Isobx.^2 + Isoby.^2);
    m = imextendedmin(gradmag, number_of_clusters);
    gradmag2 = imimposemin(gradmag, m);
    L = watershed(gradmag2);
    bgm = L==0;
    
     my_segmentation = bgm;
    
    figure(2)
    imshow(my_segmentation, [], 'Colormap', jet);
end


end