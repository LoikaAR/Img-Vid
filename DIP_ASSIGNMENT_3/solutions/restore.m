close all;

img = imread("../san_domenico.png");
img = im2double(img);
img_f = fft2(img);

[height, width, ~] = size(img);

mask = ones(height, width);

% imshow(fftshift(img_f)/500);

[x, y, ~] = impixel(abs(fftshift(img_f)/500));

% radius
R = 15;

[h,w]=meshgrid(1:height);
for i = 1:size(x)
    mask((h-x(i)).^2+(w-y(i)).^2<R^2)=0;
end

res_f = img_f .* fftshift(mask);

out = abs(ifft2(res_f));
imshow(out);

