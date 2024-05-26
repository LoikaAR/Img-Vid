close all;
impath_happy = "../happy.jpg";
impath_sad = "../sad.jpg";

% nLevels = 4;
% lap_happy = laplacianPyramid(impath_happy, nLevels);
% lap_sad = laplacianPyramid(impath_sad, nLevels);
% 
% target_happy = lap_happy{2};
% target_sad = lap_sad{3};
% target_sad = imresize(target_sad, [size(target_happy, 1), size(target_happy, 2)]);
% 
% res = target_happy + target_sad;

img_happy = im2double(imread(impath_happy));
img_sad = im2double(imread(impath_sad));

sigma = 3;
img_happy = img_happy - imgaussfilt(img_happy, sigma);

img_sad = imgaussfilt(img_sad, sigma);
img_sad = imresize(img_sad, [size(img_happy, 1), size(img_happy, 2)]);

res = img_happy + img_sad;


imshow(res);