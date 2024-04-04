% make contours at edges
% smooth the image within the contours

img = imread("delicate_arch.jpg");
I_ycbcr = rgb2ycbcr(double(img)./255);
I_gray = double(rgb2gray(img))./255;

se = strel("square", 2);
img_eroded = imerode(I_gray, se);

img_contours = I_gray - img_eroded;

img_enhanced = I_gray .* img_contours;
img_combined = I_gray - img_enhanced;
% img_soft = imbilatfilt(img_combined, 0.5, 10);

img_soft = imbilatfilt(I_gray, 0.5, 2);
result = img_soft - img_contours;

J_ycbcr = cat(3,result,I_ycbcr(:,:,2),I_ycbcr(:,:,3)); 
J_rgb = ycbcr2rgb(J_ycbcr);
imshow(J_rgb);