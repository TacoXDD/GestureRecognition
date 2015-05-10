clear

x = 1:7;

y = 8.^x;
plot(x,y);

hold on
    
    z = x.^7;
    plot(x,z);

hold off
