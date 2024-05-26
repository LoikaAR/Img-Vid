function [lapPyramid] = laplacianPyramid(impath, nLevels)
    close all;

    img = im2double(imread(impath));

    gaussPyramid = cell(1,nLevels+1);
    gaussPyramid{1} = img;
    for i = 2:nLevels+1
        cur_lvl = imgaussfilt(gaussPyramid{i-1},1);
        cur_lvl_sub = imresize(cur_lvl, 0.5,'nearest');
        gaussPyramid{i} = cur_lvl_sub;
    end

    lapPyramid = cell(1,nLevels+1);

    for i = 1:nLevels
        cur = gaussPyramid{i};
        prev = gaussPyramid{i+1};

        prev = imresize(prev, [size(cur, 1), size(cur, 2)], "nearest");
        
        out = cur - prev;
        lapPyramid{i} = out;
    end
    lapPyramid{nLevels+1} = gaussPyramid{nLevels+1};
end
