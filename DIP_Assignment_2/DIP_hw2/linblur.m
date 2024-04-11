close all;
theta = 45;
std_x = 10;
std_y = 10;
kernel = anisotropic_gaussian_kernel(theta, std_x, std_y);
img = imread("graz.png");
img = im2double(img);
res = conv2(img, kernel, 'same');

figure
tiledlayout(1,2);

nexttile;
imshow(img);
title("Original");

nexttile;
imshow(res);
title("With Anisotropic Kernel, \theta = " + theta + ...
    ", \sigma_x = " + std_x + ", \sigma_y = " + std_y);
