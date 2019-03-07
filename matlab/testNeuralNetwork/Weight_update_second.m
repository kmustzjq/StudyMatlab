function [weight] = Weight_update_second(initial,a,b,c,learnrate)
%a是初始的输出，b是通过神经元输出的值,c是输出对所求权值的导数
%比如w5的c为outh1,比如w6的c为outh2,所以c=[outh1,outh2]
%initial是一个第二层神经元的权重[w5-w8]
derivative1=-(a(1,1)-b(1,1))*b(1,1)*(1-b(1,1))*c(1,1);
derivative2=-(a(1,2)-b(1,2))*b(1,2)*(1-b(1,2))*c(1,2);
m=size(initial,1);
weight=zeros(m,2);
for i=1:m
    %算w5,w6
    weight(i,1)=initial(i,1)-learnrate*derivative1;
    %算w7,w8
    weight(i,2)=initial(i,2)-learnrate*derivative2;
end
end

