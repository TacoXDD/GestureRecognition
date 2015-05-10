input = [0 0; 0 1; 1 0; 1 1]';               %'# each column is an input vector
ouputActual = [0 1 1 0];                     %#

net = newpr(input, ouputActual, 2);          %# 1 hidden layer with 2 neurons
net.divideFcn = '';                          %# use the entire input for training

net = init(net);                             %# init
[net,tr] = train(net, input, ouputActual);   %# train
outputPredicted = sim(net, input);           %# predict

[err,cm] = confusion(ouputActual,outputPredicted);