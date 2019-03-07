%累积分布函数图形
y=evrnd(0,3,100,1);
cdfplot(y)
hold on
x=-20:0.1:10;
f=evcdf(x,0.3);
plot(x,f,'r--diamond')
xlabel('x')
ylabel('y')
legend('Empirical','Theoretical','location','NW')