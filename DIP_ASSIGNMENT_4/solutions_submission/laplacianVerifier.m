function [] = laplacianVerifier(lapPyramid, nLevels)
    out = lapPyramid{nLevels+1};
    for i = nLevels:-1:1
        cur = lapPyramid{i};
        out = imresize(out, [size(cur, 1), size(cur, 2)],"nearest") + cur;
    end
    imshow(out);
end