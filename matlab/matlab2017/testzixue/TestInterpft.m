clear,clc
x=0:1.2:10;
y=sin(x);
n=2*length(x);
yi=interpft(y,n);
xi=0:0.6:10.4;
hold on
plot(x,y,'rd-');
plot(xi,yi,'b+-')
title('��ֵ��Ͻ��')
legend('ԭʼ','��ֵ')