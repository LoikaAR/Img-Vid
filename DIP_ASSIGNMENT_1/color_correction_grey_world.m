% get the average RGB value, make it grey

wb_img_original = imread("white_balance_input.jpg");
wb_img = im2double(wb_img_original);

red_channel = wb_img(:,:,1);
green_channel = wb_img(:,:,2);
blue_channel = wb_img(:,:,3);

avg_red = mean(red_channel, "all");
avg_green = mean(green_channel, "all");
avg_blue = mean(blue_channel, "all");

r_new = (avg_red + avg_blue + avg_green) / 3;
g_new = (avg_red + avg_blue + avg_green) / 3;
b_new = (avg_red + avg_blue + avg_green) / 3;

alpha_red = r_new / avg_red;
alpha_green = g_new / avg_green;
alpha_blue = b_new / avg_blue;

wb_img(:,:,1) = wb_img(:,:,1)*alpha_red;
wb_img(:,:,2) = wb_img(:,:,2)*alpha_green;
wb_img(:,:,3) = wb_img(:,:,3)*alpha_blue;

subplot(1,2,1);
imshow(wb_img_original); title("Original");
subplot(1,2,2);
imshow(wb_img); title("Gray world correction");