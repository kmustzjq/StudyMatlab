%该程序是为了求一个时间序列的自相关函数,Q统计量和偏相关系数
function [corr_data1,Q,partial_corr] = solve_tseries(data,Fh)
format short
%%%%%data是时间序列，Fh是最大滞后数
Q=zeros(2,Fh);
corr_data1=zeros(2,Fh);
partial_corr=zeros(2,Fh);
for h=1:Fh
n=length(data);
y1=data(1,1:n-h);
y2=data(1,h+1:n);
%%%%求均值%%%%%
mean_data=sum(data)/n;
%%%计算协方差%%%%%
cov_y1y2=0;
for i=1:length(y1)
    cov_y1y2=cov_y1y2+(y1(1,i)-mean_data).*(y2(1,i)-mean_data);
end

%%%计算方差%%%%%%
var_data=0;
for i_1=1:n
    var_data=var_data+(data(1,i)-mean_data).^2;
end
%%%%%计算自相关系数%%%%%%%
corr_y1y2=cov_y1y2/var_data;
corr_data1(1,h)=h;
corr_data1(2,h)=corr_y1y2;
%%%%%%计算Q统计量
test_Q=0;
for i_k=1:h
    test_Q=test_Q+corr_data1(2,i_k)^2/(n-i_k);
end
test_Q=n*(n-2)*test_Q;
Q(1,h)=h;
Q(2,h)=test_Q;
%%%%计算偏相关系数
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