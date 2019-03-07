%�ó�����Ϊ����һ��ʱ�����е�����غ���,Qͳ������ƫ���ϵ��
function [corr_data1,Q,partial_corr] = solve_tseries(data,Fh)
format short
%%%%%data��ʱ�����У�Fh������ͺ���
Q=zeros(2,Fh);
corr_data1=zeros(2,Fh);
partial_corr=zeros(2,Fh);
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
%%%%����ƫ���ϵ��
if h==1
    partial_corr(1,1)=h;
    partial_corr(2,1)=corr_data1(2,1);
else
    D=eye(h);
    for j_1=1:h
        for j_2=j_1+1:h
            D(j_1,j_2)=corr_data1(2,j_2-j_1);
        end 
        for j_3=1:j_1
            D(j_1,j_3)=D(j_3,j_1);
        end 
    end
    D_k=[D(:,1:h-1) (corr_data1(2,1:h))'];
    partial_corr(1,h)=h;
    partial_corr(2,h)=det(D_k)/det(D);    
end
end
end