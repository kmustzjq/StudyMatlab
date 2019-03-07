clc,clear
%format long
load('data.mat')
mu=zeros(length(data(:,1)),1);
result=zeros(length(data(:,1)),1);
for i=1:length(data(:,1))
    r=data(i,1);
    d_i=data(i,2);
    p=data(i,3);
    T=data(i,4);
    mu(i,1)=real(SolveMuI(p,d_i,T,r));
    result(i,1)=real(SolveSigmai(p,d_i,T,r));
end
all=[data mu result]