function [weight1] = Weight_update_first(first_neural,input,second_neural,a,b,c,learnrate)
%a是初始的输出，b是通过神经元输出的值,c是输出对所求权值的导数
%比如w5的c为outh1,比如w6的c为outh2,所以c=[outh1,outh2]
%initial是一个第二层神经元的权重[w5-w8]
derivative1=-(a(1,1)-b(1,1))*b(1,1)*(1-b(1,1))*c(1,1)*(1-c(1,1));
derivative2=-(a(1,2)-b(1,2))*b(1,2)*(1-b(1,2))*c(1,2)*(1-c(1,2));
m=size(second_neural,1);
weight1=zeros(m,2);
for i=1:m
    %算w1,w2
    weight1(i,1)=first_neural(i,1)-learnrate*input(1,i)*(...
        second_neural(i,1)*derivative1+second_neural(i,2)*derivative2);
    %算w3,w4
    weight1(i,2)=first_neural(i,2)-learnrate*input(1,i)*(...
        second_neural(i,1)*derivative1+second_neural(i,2)*derivative2);
end
end

