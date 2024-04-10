close all;
img = imread("delicate_arch.jpg");
img = im2double(img);

d_of_s = 0.01; % greater vs smaller
std_dev = 8;

img_one_gauss= imbilatfilt(img, d_of_s, std_dev);

g_filters = 10;
img_many_gauss = img;
std_dev_smaller = 2;

for i = 1:g_filters
    img_many_gauss = imbilatfilt(img_many_gauss, d_of_s, std_dev_smaller);
end

figure
tiledlayout(3,1);

nexttile;
imshow(img); title("Original");

nexttile;
imshow(img_one_gauss); title("1x Filter, DoS = " ...
    + d_of_s + ", Standard Deviation = " + std_dev);

nexttile;
imshow(img_many_gauss); title("10x Filter, DoS = " ...
    + d_of_s + ", Standard Deviation = " + std_dev_smaller);
