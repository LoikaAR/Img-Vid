img = imread("delicate_arch.jpg");
img = im2double(img);

d_of_s = 6;
std_dev = 5;

img_one_gauss= imbilatfilt(img, d_of_s, std_dev);

subplot(2,1,1);
imshow(img_one_gauss); title("1x Filter, DoS = " ...
    + d_of_s + ", Standard Deviation = " + std_dev);

g_filters = 10;

img_many_gauss = img;
std_dev_smaller = 2;

for i = 1:g_filters
    img_many_gauss= imbilatfilt(img_many_gauss, d_of_s, std_dev_smaller);
end

subplot(2,1,2);
imshow(img_many_gauss); title("10x Filter, DoS = " ...
    + d_of_s + ", Standard Deviation = " + std_dev_smaller);