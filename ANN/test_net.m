num_pic = 451;

for i = 1:num_pic
    
    outfile = 'out/';
    number = num2str(i);
    fmt = '.JPG';

    out_file_name = strcat(outfile, number);
    out_file_name = strcat(out_file_name, fmt);

    current_file = imread(out_file_name);
    
    current_file = reshape(current_file', 1, []);
    
    if i ~= 1
        training = [training; current_file];
    else
        training = current_file;
    end
    
    if i == 1
        training_result = [1];
    elseif i < 204
        training_result = [training_result; 1];
    else
        training_result = [training_result; -1];
    end
    
end

p = double(training')/255;
t = training_result';

net = newff(p, t, [2]);
net.trainFcn = 'trainscg'
%net.trainParam.lr = 0.002
%net.trainparam.epochs = 1000
%net.trainparam.goal = 1e-30
net.trainParam.max_fail = 200
[net,tr] = train(net,p,t)

correct = 0;
for i = 1:num_pic
    if sim(net, p(:, i)) > 0 && t(i) > 0
        correct = correct + 1;
    elseif sim(net, p(:, i)) < 0 && t(i) < 0
        correct = correct + 1;
    end
end

err = 1 - correct/num_pic


