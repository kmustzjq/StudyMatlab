clc,clear
yt=[50 52 47 51 49 48 51 40 48 52 51 59]';
n=length(yt);
a=[0.2 0.5 0.8];
m=length(a);
yhat(1,1:m)=(yt(1,1)+yt(2,1))/2;
for i=2:n
    %yhat(i,:)=a*yt(i-1,1)+(1-a).*yhat(i-1,:);
    yhat(i,:)=a*yt(i-1,1)+(1-a).*yhat(i-1,:);
end
yhat
err=sqrt(mean((repmat(yt,1,m)-yhat).^2))