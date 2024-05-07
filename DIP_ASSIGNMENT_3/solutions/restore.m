close all;

% img = imread("san_domenico.png");
% img = imread("moon.png");
% img = imread("AI1.jpeg");
img = imread("ai_image.jpeg");

img = im2double(img);
img_f = fft2(img);
[height, width, ~] = size(img);

factor = height*2;
% get pixels coords - SELECT ARTIFACTS MANUALLY
[x, y, ~] = impixel(abs(fftshift(img_f)/500));

% make the filter
mask = ones(height, width);
% radius
R = 15;
% make circular filter
[h,w]=meshgrid(1:height);
for i = 1:size(x)
    mask((h-x(i)).^2+(w-y(i)).^2<R^2)=0;
end

% apply filter to the frequency domain
res_f = img_f .* fftshift(mask);

% apply inverse fft
out = abs(ifft2(res_f));

% visualize
tiledlayout(2,2);

% show img
imshow(img); title("Original");

% show FT of img
nexttile;
imshow(abs(fftshift(img_f)/500)); title("Image FT");

% show mask
nexttile;
imshow(mask); title("Mask");

% show result of filter on frequency domain
nexttile;
imshow(abs(fftshift(res_f)/500)); title("Result of filter on Frequency Domain");

% show result
nexttile;
imshow(out); title("Inverse FT of image's filtered frequency domain");