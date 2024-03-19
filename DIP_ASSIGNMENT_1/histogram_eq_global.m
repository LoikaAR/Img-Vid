function [eq] = histogram_eq_global(img, flag)
    % img should already be in hsv format
    % img = rgb2hsv(img);
    
    % compute the histogram 
    [h, ~] = imhist(img(:,:,3));

    % get cumulative density
    cdf = cumsum(h);
    
    % normalize
    cdf = rescale(cdf, 0, 1);
    
    % apply to image 
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