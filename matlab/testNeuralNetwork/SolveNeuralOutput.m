function [out] = SolveNeuralOutput(input,weight_neural,b)
%input���������
%weight_neural����Ԫ��Ȩ��
%b��һ������
col=size(weight_neural,2);
bb=ones(1,col)*b;
%�������Իع�
net=input*weight_neural+bb;
out=zeros(1,col);
for i=1:col
    out(1,i)=1/(1+exp(-net(1,i)));
end
end

