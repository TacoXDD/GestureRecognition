num_test = 61;

for i = 1:num_test
    
    outfile = 'test_out/';
    number = num2str(i);
    fmt = '.JPG';

    out_file_name = strcat(outfile, number);
    out_file_name = strcat(out_file_name, fmt);

    current_file = imread(out_file_name);
    
    current_file = reshape(current_file', 1, []);
    
    if i ~= 1
        train = [train; current_file];
    else
        train = current_file;
    end
    
    if i == 1
        train_result = [1];
    elseif i < 36
        train_result = [train_result; 1];
    else
        train_result = [train_result; -1];
    end
    
end

ptest = double(train')/255;
ttest = train_result';


test_correct = 0;
for i = 1:num_test
    if sim(net, ptest(:, i)) > 0 && ttest(i) > 0
        test_correct = test_correct + 1;
    elseif sim(net, ptest(:, i)) < 0 && ttest(i) < 0
        test_correct = test_correct + 1;
    end
end

test_err = 1 - test_correct/num_test



