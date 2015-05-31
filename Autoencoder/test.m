num = 232;

back_ground = imread('close/1.JPG');
back_ground_gray = rgb2gray(back_ground);

for i = 1:num

    file = '/';
    outfile = 'close_gray/';
    number = num2str(i);
    fmt = '.JPG';
    

    file_name = strcat(file, number);
    file_name = strcat(file_name, fmt);
    out_file_name = strcat(outfile, number);
    out_file_name = strcat(out_file_name, fmt);
    
    current_file = imread(file_name);
    current_file_gray = rgb2gray(current_file);

    [height width] = size(file_name);

    imwrite(current_file_gray, out_file_name);
    
end
