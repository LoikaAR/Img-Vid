function [freq_reds, freq_greens, freq_blues] = histogram(image_path)
    % plot the frequency of each intensity of an image
    img = imread(image_path);
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

    L = unique(red);
    freq_reds = zeros(size(unique_reds));
    freq_greens= zeros(size(unique_greens));
    freq_blues = zeros(size(unique_blues));

    for i = 1:256
        % count the occurence of each unique value in their channel
        freq_reds(i) = sum(unique_reds(i) == red); 
        freq_greens(i) = sum(unique_greens(i) == green);
        freq_blues(i) = sum(unique_blues(i) == blue);
    end

    plot(L, freq_reds, 'r', L, freq_greens, 'g', L, freq_blues, 'b');
end