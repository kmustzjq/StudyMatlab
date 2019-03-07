clear;clc;  
x=[3,3;4,3;1,1;];  
y=[1,1,-1];  
Pindex=find(y>0);  
tIndex=1:length(y);  
Nindex=setdiff(tIndex,Pindex);  
plot(x(Pindex,1),x(Pindex,2),'*');  
hold on;  
plot(x(Nindex,1),x(Nindex,2),'p');  
  
[w]=perceptionLearn(x,y,1,20);  
xline=linspace(-2,5,20);  
yline=-w(2)/w(3).*xline-w(1)/w(3);  
plot(xline,yline,'r');  
  
y=[1,1,0];  
[w]=LogisticRegression(x,y,0.1,2000);  
xline=linspace(-2,5,20);  
yline=-w(2)/w(3).*xline-w(1)/w(3);  
plot(xline,yline,'g');  
  
legend('正样本','负样本','感知机','逻辑回归')  