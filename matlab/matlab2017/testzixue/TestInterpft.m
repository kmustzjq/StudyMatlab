clear,clc
x=0:1.2:10;
y=sin(x);
n=2*length(x);
yi=interpft(y,n);
xi=0:0.6:10.4;
hold on
plot(x,y,'rd-');
plot(xi,yi,'b+-')
title('插值拟合结果')
legend('原始','插值')