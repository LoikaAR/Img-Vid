close all;
impath_happy = "../happy.jpg";
impath_sad = "../sad.jpg";

% construct laplacian pyramids
nLevels = 4;
lap_happy = laplacianPyramid(impath_happy, nLevels);
lap_sad = laplacianPyramid(impath_sad, nLevels);

for i = 1:nLevels
    cur_h = lap_happy{i};
    cur_s = lap_sad{i};

    imwrite(cur_h, "./out/happy_lvl_"+i+".jpg");
    imwrite(cur_s, "./out/sad_lvl_"+i+".jpg");
end

% show
% figure,
% imshow(lap_happy{1});
% figure,
% imshow(lap_happy{2});
% figure,
% imshow(lap_happy{3});
% figure,
% imshow(lap_happy{4});
%
% figure,
% imshow(lap_sad{1});
% figure,
% imshow(lap_sad{2});
% figure,
% imshow(lap_sad{3});
% figure,
% imshow(lap_sad{4});