clear,clc
%定义训练样本矢量
%p为输入向量
p=-1:0.05:1;
T=sin(2*pi*p)+0.1*randn(size(p));
%绘制训练样本数据点
figure(1)
plot(p,T,'+');
title('绘制样本数据点');
xlabel('输入变量');
ylabel('目标变量');
hold on;
%绘制不含噪声的正弦曲线
figure(2);
plot(p,sin(2*pi*p),':');
title('绘制样本数据点');
xlabel('输入变量');
ylabel('目标变量');
hold on;
%定义验证样本
%验证样本的输入矢量
v.p=-0.975:0.05:0.975;
v.T=sin(2*pi*v.p)+0.1*randn(size(v.p));
%创建一个新的前向神经网络
net=newff(minmax(p),[5,1],{'tansig','purelin'},'traingdx');
%设置训练参数
net.trainParam.epochs=500;
net.trainParam.goal=1e-6;
% net=init(net);
% [net,tr]=train(net,v.p,v.T,[],[],v);
%对BP网络进行仿真
A=sim(net,p);
%计算仿真误差
E=T-A;
MSE=mse(E);
%绘制仿真曲线
figure(3)
plot(p,A,p,T,'+');
title('绘制样本数据点');
xlabel('输入变量');
ylabel('目标变量');















