% on average, the world is grey
% get the average RGB value, make it grey

wb_img = imread("white_balance_input.jpg");

imshow(wb_img);

red_channel = wb_img(:,:,1);
green_channel = wb_img(:,:,2);
blue_channel = wb_img(:,:,3);

