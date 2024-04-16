close all;

img = imread("../san_domenico.png");
% img = imread("../ai_image.jpeg");
img = im2double(img);
img_f = fft2(img);

[height, width, ~] = size(img);

mask = ones(height, width);

% imshow(fftshift(img_f)/500);

[x, y, ~] = impixel(abs(fftshift(img_f)/500));

R = 20;
[h,w]=meshgrid(1:height);
for i = 1:size(x)
    mask((h-x(i)).^2+(w-y(i)).^2<R^2)=0;
end

res_f = mask .* abs(img_f);
% imshow(res_f);

out = ifft2(res_f);
imshow(abs(out));

