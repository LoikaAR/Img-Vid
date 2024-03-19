wb_pic = imread("white_balance_input.jpg");
wb_pic = im2double(wb_pic);
imshow(wb_pic);

% select sample pixel
[x, y, rgb] = impixel(wb_pic);

% equalize the rgb values
rgb_new = (rgb(1) + rgb(2) + rgb(3)) / 3;

% find alpha
alpha_R = rgb_new/(rgb(1));
alpha_G = rgb_new/(rgb(2));
alpha_B = rgb_new/(rgb(3));

% process every pixel's corresponding channels
wb_pic(:,:,1) = wb_pic(:,:,1)*alpha_R;
wb_pic(:,:,2) = wb_pic(:,:,2)*alpha_G;
wb_pic(:,:,3) = wb_pic(:,:,3)*alpha_B;

% do I need 
imshow(wb_pic);