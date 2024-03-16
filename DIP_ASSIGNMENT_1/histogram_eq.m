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

ecdf_red = zeros(1, length(unique_reds));
ecdf_green = zeros(1, length(unique_greens));
ecdf_blue = zeros(1, length(unique_blues));

for i = 1:length(unique_reds)
    ecdf_red(i) = sum(red <= unique_reds(i))/length(unique_reds);
    ecdf_green(i) = sum(green <= unique_greens(i))/length(unique_reds);
    ecdf_blue(i) = sum(blue <= unique_blues(i))/length(unique_reds);
end

ecdf_red = normalize(ecdf_red);
ecdf_green = normalize(ecdf_green);
ecdf_blue = normalize(ecdf_blue);

for i = 1:length(unique_reds)
    

img(:,:,1) = img(:,:,1)