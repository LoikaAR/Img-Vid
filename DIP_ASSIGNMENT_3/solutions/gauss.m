close all;

% Make image
dim = 1024;
img = ones(dim, dim);
img = img .*0.9;
center = dim/2;
R = 250;
img(center, center) = 0;
img(center:center+R, center:center+R) = 0;
img(center-R:center, center-R:center) = 0;
img(center-R:center, center:center+R) = 0;
img(center:center+R, center-R:center) = 0;

% Spatial domain
img = padarray(img, [10, 10], 0, 'both');
sigma = 10;
I_blur = imgaussfilt(img, sigma);

% Frequency domain
% compute FT
I_ft = fft2(img);

% compute gaussian (low-pass) filter
[X,Y]= meshgrid(-522:521,-522:521);
D = sqrt(X.^2 + Y.^2);
D = D/max(D(:));
sigma_freq = (1 / (2*pi*sigma));
D = exp(-D.^2/2/sigma_freq^2);
D = D/max(D(:));

I_ft_filtered= I_ft .* fftshift(D);
I_out = ifft2(I_ft_filtered);

% visualize
figure; 
tiledlayout(3,2);

nexttile;
imshow(img); title("Original");

% shifted FT
vI=abs(fftshift(I_ft));
nexttile;
imshow(vI/100); title("Fourier transform");

% kernel
nexttile;
imshow(D); title("Kernel");

% FT * kernel
nexttile;
imshow(abs(fftshift(I_ft_filtered))); title("filtered fourier");

% spatial result
nexttile;
imshow(I_blur); title("Spatial domain Gaussian blur, \sigma=" + sigma);

% frequency result
nexttile;
imshow(abs(I_out)); title("Frequency domain Gaussian blur, \sigma=" + sigma_freq);


