clear,clc
k=2;
p=-1:0.05:8;
t=1+sin(k*pi/2*p);
figure
plot(p,t,'r-')
title('Ҫ�ƽ��ķ����Ժ���');
xlabel('ʱ��');
ylabel('�����Ժ���');


n=15;
net=newff(minmax(p),[n,1],{'tansig' 'purelin'},'trainlm');
y1=sim(net,p);
figure
plot(p,t,'r-',p,y1,'b:');
title('δѵ�������������');
xlabel('ʱ��');
ylabel('�������-�����Ժ���');


net.trainParam.epochs=2000;
net.trainParam.goal=0.001;
net=train(net,p,t);

y2=sim(net,p);
figure
plot(p,t,'r-',p,y1,'g:',p,y2,'b--')
title('ѵ�������������');
xlabel('ʱ��');
ylabel('�������');


