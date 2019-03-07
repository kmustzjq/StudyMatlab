% %a=0.5:0.25:3;
% %b=[4,4,4,4,4,4,4,4,5,5,5];
% %plot(a,b)
% c=1.25:0.25:4;
% d=[3,3,3,3,4,4,4,4,4,5,5,5];
% plot(c,d)
clc,clear;
i=1;
r=zeros(1,100);
keyboard;
while i<100
r(1,i)=binornd(1000,0.99);
i=i+1;
end
%t=(r==500)
%sum(t)
r