function [jumptimes, systsize] = simmd2(tmax,lambda,a,b)
% SIMMD2 simulate a M/G/1 queueing system. 
%a�Ǿ��ȷֲ���ʱ�俪ʼ,b�Ǿ��ȷֲ���ʱ����ֹ
%����tmax��ϵͳֹͣ
%����ʱ����Ӿ��ȷֲ�
%ȷ������ֲ�
arrtime=exprnd(lambda);  % Poisson arrivals
i=1;                  
  while (min(arrtime(i,:))<=tmax)
    arrtime = [arrtime; arrtime(i, :)+exprnd(lambda)];  
    i=i+1;
  end
n=length(arrtime);           % arrival times t_1,...t_n         
%arrsubtr=arrtime-(0:n-1)';           % t_k-(k-1)
%arrmatrix=arrsubtr*ones(1,n);     
%���￪ʼȷ���뿪�ֲ�ʱ��
deptime=zeros(1,n);
for i_1=1:n
    deptime(1:i_1)=unifrnd(a,b);  % departure times 
end                                    % u_k=k+max(t_1,..,t_k-k+1)
B=[ones(n,1) arrtime ; -ones(n,1) deptime']
Bsort=sortrows(B,2);                 % sort jumps in order
jumps=Bsort(:,1)
jumptimes=[0;Bsort(:,2)]
systsize=[0;cumsum(jumps)];                 % M/G/1 process
systtime=deptime-arrtime';                  % system times 
% plot a histogram of system times
hist(systtime,30);
end
