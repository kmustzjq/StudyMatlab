function [jumptimes, systsize] = simmd2(tmax,lambda,a,b)
% SIMMD2 simulate a M/G/1 queueing system. 
%a是均匀分布的时间开始,b是均匀分布的时间终止
%大于tmax，系统停止
%服务时间服从均匀分布
%确定到达分布
arrtime=exprnd(lambda);  % Poisson arrivals
i=1;                  
  while (min(arrtime(i,:))<=tmax)
    arrtime = [arrtime; arrtime(i, :)+exprnd(lambda)];  
    i=i+1;
  end
n=length(arrtime);           % arrival times t_1,...t_n         
%arrsubtr=arrtime-(0:n-1)';           % t_k-(k-1)
%arrmatrix=arrsubtr*ones(1,n);     
%这里开始确定离开分布时间
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
