function [weight1] = Weight_update_first(first_neural,input,second_neural,a,b,c,learnrate)
%a�ǳ�ʼ�������b��ͨ����Ԫ�����ֵ,c�����������Ȩֵ�ĵ���
%����w5��cΪouth1,����w6��cΪouth2,����c=[outh1,outh2]
%initial��һ���ڶ�����Ԫ��Ȩ��[w5-w8]
derivative1=-(a(1,1)-b(1,1))*b(1,1)*(1-b(1,1))*c(1,1)*(1-c(1,1));
derivative2=-(a(1,2)-b(1,2))*b(1,2)*(1-b(1,2))*c(1,2)*(1-c(1,2));
m=size(second_neural,1);
weight1=zeros(m,2);
for i=1:m
    %��w1,w2
    weight1(i,1)=first_neural(i,1)-learnrate*input(1,i)*(...
        second_neural(i,1)*derivative1+second_neural(i,2)*derivative2);
    %��w3,w4
    weight1(i,2)=first_neural(i,2)-learnrate*input(1,i)*(...
        second_neural(i,1)*derivative1+second_neural(i,2)*derivative2);
end
end

