close all;
impath = "../queen.jpg";
img = imread(impath);
img = im2double(img);

% avg_list = RGB_Palette(impath, 32, false);

redC = img(:,:,1);
greenC = img(:,:,2);
blueC = img(:,:,3);

[counts_red, binAllocs_red] = imhist(redC, 32);
[counts_green, binAllocs_green] = imhist(greenC, 32);
[counts_blue, binAllocs_blue] = imhist(blueC, 32);

plot(binAllocs_green, counts_green);

test = img;

test(:,:,1) = binAllocs_red(32);
test(:,:,2) = binAllocs_green(32);
test(:,:,3) = binAllocs_blue(32);

mat = ones(100,100);

% out = test.*mat;

imshow(test);