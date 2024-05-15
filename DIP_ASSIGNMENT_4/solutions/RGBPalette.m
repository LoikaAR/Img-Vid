close all;

img =  im2double(imread("../queen.jpg"));
img_lin = img.^2.2;
[height, width, ~] = size(img);

% prepare data
redC = img_lin(:,:,1);
greenC= img_lin(:,:,2);
blueC= img_lin(:,:,3);
data = double([redC(:), blueC(:), greenC(:)]);

% perform kmeans on 7 clusters
[idx, centroids] = kmeans(data, 7, Replicates=1);

% make a cell array of classes
classes = cell(1,7);
for i =1:7
    class = reshape(idx==i,height,width);
    classes{i} = class;
end

% show pixels of img_lin where class1,2,3,... == 1
pics = cell(1,7);
res = cell(1,7);
for i = 1:length(classes)
    cur = classes{i};
    
    out_red = cur .* img_lin(:,:,1);
    out_green= cur .* img_lin(:,:,2);
    out_blue= cur .* img_lin(:,:,3);
    pic_out = cat(3, out_red, out_green, out_blue);
    pics{i} = pic_out;
%     pics{i} = rgb2hsv(pic_out);
    
    out_red(out_red == 0) = NaN;
    out_green(out_green == 0) = NaN;
    out_blue(out_blue == 0) = NaN;

    out = cat(3, out_red, out_green, out_blue);
    res{i} = out;
end

% get the average values
avg_list = cell(1,7);
for i = 1:length(res)
    avg_red = mean(res{i}(:,:,1), "all", "omitnan");
    avg_green = mean(res{i}(:,:,2), "all", "omitnan");
    avg_blue = mean(res{i}(:,:,3), "all", "omitnan");

    wdw = img_lin;
    wdw(:,:,1) = centroids(i,1);
    wdw(:,:,2) = centroids(i,3); % this bothers me a lot
    wdw(:,:,3) = centroids(i,2);
    avg_list{i} = wdw;
end

collated = [pics, avg_list];
montage(collated,Size=[2 NaN],BorderSize=[2,2],BackgroundColor=[1,1,1]);