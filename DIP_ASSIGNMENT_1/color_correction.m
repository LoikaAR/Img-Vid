wb_pic = imread("white_balance_input.jpg");

wb_pic = im2double(wb_pic);

imshow(wb_pic);

% [y, x] = find(wb_pic > 100);`