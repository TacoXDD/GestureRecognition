num_open = 245;
num_close = 308;
num_test = 42;

back_ground = imread('open/0.JPG');
back_ground_gray = rgb2gray(back_ground);

for i = 1:num_close

    file = '/';
    outfile = 'close_out/';
    number = num2str(i);
    fmt = '.JPG';
    

    file_name = strcat(file, number);
    file_name = strcat(file_name, fmt);
    out_file_name = strcat(outfile, number);
    out_file_name = strcat(out_file_name, fmt);
    
    current_file = imread(file_name);
    current_file_gray = rgb2gray(current_file);
    sub = imsubtract(back_ground_gray, current_file_gray);

    [height width] = size(sub);

    for i = 1:height
        for j = 1:width
            if sub(i, j) < 10
                sub(i, j) = 0;
            end
        end
    end

    for i = height:-1:1
        if sum(sub(i, :)) == 0
            sub(i, :) = [];
        end
    end

    for j = width:-1:1
        if sum(sub(:, j)) == 0
            sub(:, j) = [];
        end
    end

    %imshow(sub);
    %sub = filter2(fspecial('laplacian'), sub);
    %sub = edge(sub, 'Canny', 0.20);
    outpic = myResize(sub, [32 32], 'bicubic');
    imwrite(outpic, out_file_name);
    
end
