fgd = imread("drift.jpg");
fgd = im2double(fgd);
fgd = fgd.^2.2;
background = imread("road.jpg");
background = im2double(background);
background = background.^2.2;
[bkg_rows, bkg_cols,~] = size(background);

fgd = imresize(fgd, [bkg_rows, bkg_cols]);

fgd_red = fgd(:,:,1);
fgd_green = fgd(:,:,2);
fgd_blue = fgd(:,:,3);

bkg_red = background(:,:,1);
bkg_green = background(:,:,2);
bkg_blue = background(:,:,3);

green_lvl = fgd_green.*(fgd_green - fgd_red).*(fgd_green - fgd_blue);
threshold = 0.004*mean(green_lvl(green_lvl > 0));
filter = green_lvl > threshold;

fgd_red(filter) = bkg_red(filter);
fgd_green(filter) = bkg_green(filter);
fgd_blue(filter) = bkg_blue(filter);

recombined = cat(3, fgd_red, fgd_green, fgd_blue);
recombined_bright = recombined.*1.2;
recombined_contrast = recombined_bright.^1.3;


subplot(2,2,1);
imshow(fgd); title("Original Foreground");
subplot(2,2,2);
imshow(background); title("Original Background");
subplot(2,2,3);
imshow(recombined); title("Combined");
subplot(2,2,4);
imshow(recombined_contrast); title("Adjusted");