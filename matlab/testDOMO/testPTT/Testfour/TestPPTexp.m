n=6
y=rand(1,100);
alpha=[0.1 0.3 0.9];
%alpha=0.1
m=length(alpha);
yhat(1,1:m)=(y(1)+y(2))/2;
for i=2:n
    yhat(i,:)=alpha*y(i-1)+(1-alpha).*yhat(i-1);
end