close all;
impath = "../queen.jpg";
img = imread(impath);
img = im2double(img);

[height, width, ~] = size(img);

nClusters = 64;

[pics, avg_list, classes, idx] = CIELab_Palette(impath, nClusters, false);

out = zeros(height, width);

for i = 1:nClusters
    layer = classes{i};

    color = avg_list{i};
    redC = color(:,:,1);
    greenC = color(:,:,2);
    blueC = color(:,:,3);
    
    mask = ones(height, width,3);

    out_red = layer .* redC;
    out_green= layer .* greenC;
    out_blue= layer .* blueC;
    layer_col = cat(3, out_red, out_green, out_blue);
    
    out = out + layer_col;
end

grey = 0.2989 * out(:,:,1) + 0.5870 * out(:,:,2) + 0.1140 * out(:,:,3);

montage({out, gray});