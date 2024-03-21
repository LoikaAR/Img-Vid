img = imread("ferrari.JPG");
img = rgb2hsv(img);
out = img;

% define the number of chunks and window size
dims = size(img);
chunks = 5;
window_size = floor(dims(1:2)/chunks);

chunk_start = ([0 0].*window_size)+1;

for i = 0:chunks-1
    for j = 0:chunks-1
        % get the chunk from the image
        chunk_end = ([i j].*window_size) + window_size;

        chunk = out(chunk_start(1):chunk_end(1), chunk_start(2):chunk_end(2),:);
        
        % equalize it
        eq_chunk = histogram_eq_global(chunk, false);
        
        % update the chunk in the output image
        out(chunk_start(1):chunk_end(1), chunk_start(2):chunk_end(2),3) = eq_chunk;
    end
end

out = hsv2rgb(out);
imshow(out); title("Adaptive Local Equalization with " + chunks + " windows");