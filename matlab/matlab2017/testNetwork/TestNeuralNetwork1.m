clear,clc
%����ѵ������ʸ��
%pΪ��������
p=-1:0.05:1;
T=sin(2*pi*p)+0.1*randn(size(p));
%����ѵ���������ݵ�
figure(1)
plot(p,T,'+');
title('�����������ݵ�');
xlabel('�������');
ylabel('Ŀ�����');
hold on;
%���Ʋ�����������������
figure(2);
plot(p,sin(2*pi*p),':');
title('�����������ݵ�');
xlabel('�������');
ylabel('Ŀ�����');
hold on;
%������֤����
%��֤����������ʸ��
v.p=-0.975:0.05:0.975;
v.T=sin(2*pi*v.p)+0.1*randn(size(v.p));
%����һ���µ�ǰ��������
net=newff(minmax(p),[5,1],{'tansig','purelin'},'traingdx');
%����ѵ������
net.trainParam.epochs=500;
net.trainParam.goal=1e-6;
% net=init(net);
% [net,tr]=train(net,v.p,v.T,[],[],v);
%��BP������з���
A=sim(net,p);
%����������
E=T-A;
MSE=mse(E);
%���Ʒ�������
figure(3)
plot(p,A,p,T,'+');
title('�����������ݵ�');
xlabel('�������');
ylabel('Ŀ�����');















