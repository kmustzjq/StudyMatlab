function [y] = fun_sinh(x)
sym x
y=(exp(x)-exp(-x))/2;
t=0:pi/4:2*pi;
plot(t,y)
end

