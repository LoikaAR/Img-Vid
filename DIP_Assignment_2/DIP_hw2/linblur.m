close all;
kernel = anisotropic_gaussian_kernel(-45, 10, 10);
img = imread("graz.png");
img = im2double(img);

hw = floor([size(kernel,1) size(kernel,2)]/2);

img = padarray(img, hw, 'replicate', 'both');

res = conv2(img, kernel, 'same');

montage({img, res});

