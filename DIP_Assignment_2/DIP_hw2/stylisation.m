img_path = "delicate_arch.jpg";
img = imread(img_path);
I_ycbcr = rgb2ycbcr(double(img)./255);
I_gray = double(rgb2gray(img))./255;
img = im2double(img);

% find edges
img_edges = edge(I_gray, "canny", 0.27);

% dilate edges
se = strel("square", 3);
img_edges = imdilate(img_edges, se);

% iteratively apply bilateral filter
dos = 0.01;
sigma = 7;
img_soft = I_gray;
for i = 1:10
    img_soft = imbilatfilt(img_soft, dos, sigma);
end

result = img_soft - img_edges;

J_ycbcr = cat(3,result,I_ycbcr(:,:,2),I_ycbcr(:,:,3)); 
J_rgb = ycbcr2rgb(J_ycbcr);
tiledlayout(2,1);

nexttile;
imshow(img); title("Original");

nexttile;
imshow(J_rgb); title("Stylized");