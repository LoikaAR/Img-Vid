image_path = "ferrari.JPG";
img = imread(image_path);
img = rgb2hsv(img);

subplot(1,2,1);
imshow(hsv2rgb(img)); title("Original")

% [freq_reds, freq_greens, freq_blues] = histogram(image_path);
[h, ~] = imhist(img(:,:,3));

% figure();
% plot(h);

% cumulative density
cdf = cumsum(h);

% normalizing
cdf = rescale(cdf, 0, 1);

% applying to image 
eq = cdf(round(img(:,:,3)*255+1));

img(:,:,3) = eq;

% h_eq = imhist(eq);
% figure();
% plot(h_eq);

subplot(1,2,2);
imshow(hsv2rgb(img)); title("Global Histogram Equalization");

% plot(vec_L, eq_red, '--r', vec_L, eq_green, '--g', vec_L, eq_blue, '--b');