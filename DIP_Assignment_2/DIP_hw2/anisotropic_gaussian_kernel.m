function [kernel] = anisotropic_gaussian_kernel(theta, std_x, std_y)
    close all;
    kernel_size = 10;

%     [x, y] = meshgrid(1:kernel_size,1:kernel_size);
%     med_x = median(median(x));
%     med_y = median(median(y));
%     x = x - med_x;
%     y = y - med_y;
%     kernel = x.^2 + y.^2;
%     kernel = sqrt(kernel);
%     kernel = exp(-((((kernel(1,:)*cos(theta)-kernel(:,1)*sin(theta))^2)/2*std_x^2) + ((kernel(1,:)*sin(theta)+kernel(:,1)*cos(theta))^2)/2*std_y^2));
%     kernel = normalize(kernel);

    kernel = zeros(kernel_size,kernel_size);
    dims = size(kernel);
%   loop starts from top left not center that is why it comes out the way it does
    for x = 1:dims(1)
        for y = 1:dims(2)
            theta_x = x*cos(theta) - y*sin(theta);
            theta_y = x*sin(theta) + y*cos(theta);
            
            term_x = (theta_x^2)/(2*(std_x^2));
            term_y = (theta_y^2)/(2*(std_y^2));
            term_sum = term_x + term_y;
            
            kernel(x,y) = exp(-term_sum);
        end
    end
%     imshow(kernel);
end
