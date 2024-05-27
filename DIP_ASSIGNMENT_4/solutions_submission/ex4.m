close all;
impath_happy = "../happy.jpg";
impath_sad = "../sad.jpg";

% load images
img_happy = im2double(imread(impath_happy));
img_sad = im2double(imread(impath_sad));

% perform low-pass filtering of sad img and high-pass of happy img
sigma = 3;
img_happy = img_happy - imgaussfilt(img_happy, sigma);
img_sad = imgaussfilt(img_sad, sigma);
img_sad = imresize(img_sad, [size(img_happy, 1), size(img_happy, 2)]);

% combine result
res = img_happy + img_sad;

imshow(res); title("Hybrid image, size = " ...
    + size(res, 1) + " x " + size(res, 2)); 