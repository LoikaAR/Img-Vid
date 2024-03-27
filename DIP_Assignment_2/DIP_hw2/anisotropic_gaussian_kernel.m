function [] = anisotropic_gaussian_kernel(image_path, theta, std_x, std_y)
    img = imread(image_path);
    img = im2double(img);
    img = rescale(img, 0, 1);
    dims = size(img);
    
    for x = 1:dims(1)
        for y = 1:dims(2)
            theta_x = x*cos(theta) - y*sin(theta);
            theta_y = x*sin(theta) + y*cos(theta);
            
            term_x = (theta_x^2)/(2*(std_x^2));
            term_y = (theta_y^2)/(2*(std_y^2));
            term_sum = term_x + term_y;

            img(x,y,:) = exp(-term_sum);
        end
    end

    imshow(img);
end