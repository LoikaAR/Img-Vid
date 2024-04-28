close all;

dim = 1024;

img = ones(dim, dim);
img = img .*0.9;
center = dim/2;
R = 250;
img(center, center) = 0;
img(center:center+R, center:center+R) = 0;
img(center-R:center, center-R:center) = 0;
img(center-R:center, center:center+R) = 0;
img(center:center+R, center-R:center) = 0;

% Spatial domain
% img = padarray(img, [10, 10], 0, 'both');

sigma = 2;
I_blur = imgaussfilt(img, sigma);


imshow(img);