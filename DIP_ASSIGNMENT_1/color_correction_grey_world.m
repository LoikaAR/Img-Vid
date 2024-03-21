% get the average RGB value, make it grey
wb_img_original = imread("white_balance_input.jpg");
wb_img = im2double(wb_img_original);
wb_img = wb_img.^2.2;

% get individual channels
red_channel = wb_img(:,:,1);
green_channel = wb_img(:,:,2);
blue_channel = wb_img(:,:,3);

% get averages of respective channel
avg_red = mean(red_channel, "all");
avg_green = mean(green_channel, "all");
avg_blue = mean(blue_channel, "all");

% get the average across channels
rgb_new = (avg_red + avg_blue + avg_green) / 3;

% calculate respective multipliers
alpha_red = rgb_new / avg_red;
alpha_green = rgb_new / avg_green;
alpha_blue = rgb_new / avg_blue;

% modify the channels
wb_img(:,:,1) = wb_img(:,:,1)*alpha_red;
wb_img(:,:,2) = wb_img(:,:,2)*alpha_green;
wb_img(:,:,3) = wb_img(:,:,3)*alpha_blue;

% plot
subplot(1,2,1);
imshow(wb_img_original); title("Original");
subplot(1,2,2);
imshow(wb_img); title("Gray world correction");