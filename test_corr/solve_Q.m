%�ó�����Ϊ����һ��ʱ�����е�����غ���,��Qͳ����
function [corr_data1,Q] = solve_Q(data,Fh)
%%%%%data��ʱ�����У�Fh������ͺ���
Q=zeros(2,Fh);
corr_data1=zeros(2,Fh);
for h=1:Fh
n=length(data);
y1=data(1,1:n-h);
y2=data(1,h+1:n);
%%%%���ֵ%%%%%
mean_data=sum(data)/n;
%%%����Э����%%%%%
cov_y1y2=0;
for i=1:length(y1)
    cov_y1y2=cov_y1y2+(y1(1,i)-mean_data).*(y2(1,i)-mean_data);
end

%%%���㷽��%%%%%%
var_data=0;
for i_1=1:n
    var_data=var_data+(data(1,i)-mean_data).^2;
end
%%%%%���������ϵ��%%%%%%%
corr_y1y2=cov_y1y2/var_data;
corr_data1(1,h)=h;
corr_data1(2,h)=corr_y1y2;
%%%%%%����Qͳ����
test_Q=0;
for i_k=1:h
    test_Q=test_Q+corr_data1(2,i_k)^2/(n-i_k);
end
test_Q=n*(n-2)*test_Q;
Q(1,h)=h;
Q(2,h)=test_Q;
end
end