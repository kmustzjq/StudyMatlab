function [out] = SolveNeuralOutput(input,weight_neural,b)
%input是输入矩阵
%weight_neural是神经元的权重
%b是一个常数
col=size(weight_neural,2);
bb=ones(1,col)*b;
%计算线性回归
net=input*weight_neural+bb;
out=zeros(1,col);
for i=1:col
    out(1,i)=1/(1+exp(-net(1,i)));
end
end

