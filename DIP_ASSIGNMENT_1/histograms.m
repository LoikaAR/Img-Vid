% plot the frequency of each intensity of an image
img = imread("ferrari.JPG");
img = im2uint8(img);

red = img(:,:,1);
red = reshape(red,1,[]);
unique_reds = unique(red);
red = sort(red);

green = img(:,:,2);
green = reshape(green,1,[]);
unique_greens = unique(green);
green = sort(green);

blue = img(:,:,3);
blue = reshape(blue,1,[]);
unique_blues = unique(blue);
blue = sort(blue);

freq_reds = zeros(size(unique_reds));
freq_greens= zeros(size(unique_greens));
freq_blues= zeros(size(unique_blues));

for i = 1:length(unique_reds)
    freq_reds(i) = sum(red == unique_reds(i));
    freq_greens(i) = sum(green == unique_greens(i));
    freq_blues(i) = sum(blue == unique_blues(i));
end

plot(unique_reds, freq_reds, 'r', unique_reds, freq_greens, 'g', unique_reds, freq_blues, 'b');