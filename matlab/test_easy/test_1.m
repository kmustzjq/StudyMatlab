 tmax=10;
 lambda=0.95;

arrtime=exprnd(lambda);  % Poisson arrivals
i=1;                  
  while (min(arrtime(i,:))<=tmax)
    arrtime = [arrtime; arrtime(i, :)+exprnd(lambda)];  
    i=i+1;
  end
  arrtime
n=length(arrtime)           % arrival times t_1,...t_n         
arrsubtr=arrtime-(0:n-1)'
arrmatrix=arrsubtr*ones(1,n); 
deptime=(1:n)+max(triu(arrmatrix))
B=[ones(n,1) arrtime ; -ones(n,1) deptime']
Bsort=sortrows(B,2)
jumps=Bsort(:,1)
jumptimes=[0;Bsort(:,2)]
systsize=[0;cumsum(jumps)]
systtime=deptime-arrtime'