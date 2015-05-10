clear
clc

original = imread('open_sub/1.JPG');
mark = imread('open_mark/1.JPG');
mark = rgb2gray(mark);


[height width] = size(original);
count = (height-4)*(width-4) %mask = 5*5

train = [train; original];

 while (count)
    for i = 1:(height-4)
        for j = 1:(width-4)
            for k = 1:5
                if mark(i+k-1, j+k-1) == 255
                    train_result = [train_result; 1];
                end
            end
        end
        count = count - 1;
    end
 end
