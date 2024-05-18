function [pics, avg_list, classes] = RGB_Palette(im_path, nClusters, showFlag)
    close all;
    
    img =  im2double(imread(im_path));
    % img =  im2double(imread("../color.jpg"));
    img_lin = img.^2.2;
    [height, width, ~] = size(img);
    
    % prepare data
    redC = img_lin(:,:,1);
    greenC= img_lin(:,:,2);
    blueC= img_lin(:,:,3);
    data = double([redC(:), blueC(:), greenC(:)]);
    
    % perform kmeans on 7 clusters
    [idx, centroids] = kmeans(data, nClusters, Replicates=2);
    
    % make a cell array of classes
    classes = cell(1,7);
    for i =1:nClusters
        class = reshape(idx==i,height,width);
        classes{i} = class;
    end
    
    % show colored pixels of img_lin where class1,2,3,... == 1
    pics = cell(1,nClusters);
    res = cell(1,nClusters);
    for i = 1:length(classes)
        cur = classes{i};
        
        % reconstruct the colors
        out_red = cur .* img_lin(:,:,1);
        out_green= cur .* img_lin(:,:,2);
        out_blue= cur .* img_lin(:,:,3);
        pic_col = cat(3, out_red, out_green, out_blue);
        
        % split and modify hue, sat, value
        [H, S, V] = rgb2hsv(pic_col);
        % edit here ...
    
        pic_out = cat(3, H, S, V);
        pic_out = hsv2rgb(pic_out);
        pics{i} = pic_out;
    
        out = cat(3, out_red, out_green, out_blue);
        res{i} = out;
    end
    
    % get the average values
    avg_list = cell(1,nClusters);
    for i = 1:length(res)
        wdw = img_lin;
        wdw(:,:,1) = centroids(i,1);
        wdw(:,:,2) = centroids(i,3); % this bothers me a lot
        wdw(:,:,3) = centroids(i,2);
    
        avg_list{i} = wdw;
    end
    
    collated = [pics, avg_list];
    
    if showFlag
        montage(collated,Size=[2 NaN],BorderSize=[2,2],BackgroundColor=[1,1,1]);
    end
end