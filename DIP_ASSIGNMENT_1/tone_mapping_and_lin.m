ferrari = imread("./ferrari.JPG");
ferrari_db = im2double(ferrari);

% imshow(ferrari_db)
out = zeros(size(ferrari_db));

% inverted the function
ferrari_corrected = ferrari_db.^log(2.2);


% optionals
ferrari_adjusted_bright = ferrari_corrected.*1.3; % brightness
ferrari_adjusted_contrast = ferrari_adjusted_bright.^1.3; % contrast

subplot(2,2,1)
imshow(ferrari_db); title("Original");
subplot(2,2,2)
imshow(ferrari_corrected); title("Inverted gamma correction");
subplot(2,2,3)
imshow(ferrari_adjusted_bright); title("Increased brightness");
subplot(2,2,4)
imshow(ferrari_adjusted_contrast); title("Increased contrast");

