clear
clc

back_ground = imread('open2/1.JPG');
back_ground_gray = rgb2gray(back_ground);

current_file = imread('open2/2.JPG');
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

imwrite(sub, 'open_sub/1.jpg');

mark = imread('open_sub/1.JPG');
[height width] = size(mark);

    for i = 1:height
        for j = 1:width
            if sub(i, j) == 255
                sub(i, j) = 254;
            end
        end
    end
    
    imwrite(mark, 'open_mark/2.JPG');
