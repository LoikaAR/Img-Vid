cat_img = imread("cat.jpg");
cat_img = im2double(cat_img);
background = imread("background.jpg");
background = im2double(background);
[cat_rows, cat_cols, ~] = size(cat_img);
[bkg_rows, bkg_cols,~] = size(background);

x = 1:256;
h_red = imhist(cat_img(:,:,1));
h_green = imhist(cat_img(:,:,2));
h_blue = imhist(cat_img(:,:,3));

cat_red = cat_img(:,:,1);
cat_green = cat_img(:,:,2);
cat_blue = cat_img(:,:,3);

bkg_red = background(:,:,1);
bkg_green = background(:,:,2);
bkg_blue = background(:,:,3);

% mask_d = (cat_img(:,:,1) == 0) & (cat_img(:,:,2) == 1) & (cat_img(:,:,3) == 0);

% get the level of green
green_lvl = cat_green.*(cat_green - cat_red).*(cat_green - cat_blue);

% set threshold
threshold = 0.3*mean(green_lvl(green_lvl > 0));
filter = green_lvl > threshold;

% overlay stuff
masked_out = cat_img - filter;
masked_out = imresize(masked_out, [bkg_rows, bkg_cols]);
size_mask = size(masked_out);

out = background + masked_out;
imshow(out);

% position = [1,1];
% background(position(2):position(2)+size(masked_out, 1)-1, position(1):position(1)+size(masked_out, 2)-1, :) = masked_out;
% imshow(background);

% cat_red(green_lvl) = bkg_red(green_lvl);
% cat_green(green_lvl) = bkg_green(green_lvl);
% cat_blue(green_lvl) = bkg_blue(green_lvl);