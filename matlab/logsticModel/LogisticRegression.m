function [w]=LogisticRegression(x,y,learningRate,maxEpoch)  
% Logistic Regression  
% x,y һ��Ϊһ��������yȡֵ{0,1}  
% ����ݶȷ�  
[m,n]=size(x);  
x=[ones(m,1) x];  
w=zeros(1,n+1);  
for epoch=1:maxEpoch  
    for samlendex=1:m  
        w=w+learningRate*(y(samlendex)-1/(1+exp(-x(samlendex,:)*w')))*x(samlendex,:);  
    end  
end 

