close all;

img = imread("san_domenico.png");
% img = imread("moon.png");
img = im2double(img);
img_f = fft2(img);
[height, width, ~] = size(img);

% show FT of img
% imshow(abs(img_f));

% get pixels coords
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

% show mask
% imshow(mask);

% apply filter to the frequency domain
res_f = img_f .* fftshift(mask);

% show result of filter on frequency domain
% imshow(abs(fftshift(res_f)/500));

% apply inverse fft
out = abs(ifft2(res_f));
% imshow(out); 

