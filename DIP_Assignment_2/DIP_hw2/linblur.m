close all;
kernel = anisotropic_gaussian_kernel(45, 10, 1);
img = imread("graz.png");
img = im2double(img);

res = conv2(kernel, img);
% imshow(kernel);

montage({img, res});

