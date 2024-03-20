cat_img = imread("cat.jpg");
cat_img = im2double(cat_img);
background = imread("background.jpg");
background = im2double(background);
[bkg_rows, bkg_cols,~] = size(background);

% resize foreground to match background
cat_img = imresize(cat_img, [bkg_rows, bkg_cols]);

% foreground color channels
cat_red = cat_img(:,:,1);
cat_green = cat_img(:,:,2);
cat_blue = cat_img(:,:,3);

% background color channels
bkg_red = background(:,:,1);
bkg_green = background(:,:,2);
bkg_blue = background(:,:,3);

% get the relative green level
green_lvl = cat_green.*(cat_green - cat_red).*(cat_green - cat_blue);

% set threshold
threshold = 0.3*mean(green_lvl(green_lvl > 0));
filter = green_lvl > threshold;

% replace pixels
cat_red(filter) = bkg_red(filter);
cat_green(filter) = bkg_green(filter);
cat_blue(filter) = bkg_blue(filter);

% final recombined image
recombined = cat(3, cat_red, cat_green, cat_blue);

% plot
subplot(3,1,1);
imshow(cat_img); title("Original Foreground");
subplot(3,1,2);
imshow(background); title("Original Background");
subplot(3,1,3);
imshow(recombined); title("Combined");