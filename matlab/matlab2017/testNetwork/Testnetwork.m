clear,clc
k=2;
p=-1:0.05:8;
t=1+sin(k*pi/2*p);
figure
plot(p,t,'r-')
title('要逼近的非线性函数');
xlabel('时间');
ylabel('非线性函数');


n=15;
net=newff(minmax(p),[n,1],{'tansig' 'purelin'},'trainlm');
y1=sim(net,p);
figure
plot(p,t,'r-',p,y1,'b:');
title('未训练网络的输出结果');
xlabel('时间');
ylabel('仿真输出-非线性函数');


net.trainParam.epochs=2000;
net.trainParam.goal=0.001;
net=train(net,p,t);

y2=sim(net,p);
figure
plot(p,t,'r-',p,y1,'g:',p,y2,'b--')
title('训练网络的输出结果');
xlabel('时间');
ylabel('仿真输出');


