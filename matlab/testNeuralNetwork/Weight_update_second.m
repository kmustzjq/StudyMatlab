function [weight] = Weight_update_second(initial,a,b,c,learnrate)
%a�ǳ�ʼ�������b��ͨ����Ԫ�����ֵ,c�����������Ȩֵ�ĵ���
%����w5��cΪouth1,����w6��cΪouth2,����c=[outh1,outh2]
%initial��һ���ڶ�����Ԫ��Ȩ��[w5-w8]
derivative1=-(a(1,1)-b(1,1))*b(1,1)*(1-b(1,1))*c(1,1);
derivative2=-(a(1,2)-b(1,2))*b(1,2)*(1-b(1,2))*c(1,2);
m=size(initial,1);
weight=zeros(m,2);
for i=1:m
    %��w5,w6
    weight(i,1)=initial(i,1)-learnrate*derivative1;
    %��w7,w8
    weight(i,2)=initial(i,2)-learnrate*derivative2;
end
end

