function [kernel] = anisotropic_gaussian_kernel(theta, std_x, std_y)
    close all;
    kernel_size = 7;
    [x, y] = meshgrid(1:kernel_size,1:kernel_size);
    med_x = median(median(x));
    med_y = median(median(y));
    x = x - med_x;
    y = y - med_y;

    x = x.*cos(theta) - y.*sin(theta);
    y = x.*sin(theta) + y.*cos(theta);
    kernel = -(((x.^2)./2*std_x^2) + ((y.^2)./2*std_y^2));
    
%     kernel = abs(kernel);
%     kernel = 1 - kernel;

    s = sum(kernel, "all");
    kernel = kernel./s;

    sum(kernel)
   
%     kernel
    imshow(kernel);
end
