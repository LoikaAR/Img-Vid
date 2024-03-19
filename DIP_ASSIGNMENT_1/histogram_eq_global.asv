function [eq] = histogram_eq_global(img, flag)
%     img = imread(image_path);
%     img = rgb2hsv(img);
    
    [h, ~] = imhist(img(:,:,3));

    % cumulative density
    cdf = cumsum(h);
    
    % normalizing
    cdf = rescale(cdf, 0, 1);
    
    % applying to image 
    eq = cdf(round(img(:,:,3)*255+1));
    img(:,:,3) = eq;
    
    % plot the info
    if (flag)
        subplot(2,2,1);
        imshow(imread("ferrari.JPG")); title("Original")
        
        subplot(2,2,2);
        imshow(hsv2rgb(img)); title("Global Histogram Equalization");
    
        subplot(2,2,3);
        plot(h); title("Histogram - Original");
    
        h_eq = imhist(img(:,:,3));
        subplot(2,2,4);
        plot(h_eq); title("Histogram - Global Equalization");
    end
    
end