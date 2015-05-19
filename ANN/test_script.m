clear

err_history = [];
test_history = [];

for i = 1:1000

clearvars -except err_history test_history
test_net
testing

err_history = [err_history, err];
test_history = [test_history, test_err];

if err < 0.16
    if test_err < 0.16
        save net;
    end
end

end