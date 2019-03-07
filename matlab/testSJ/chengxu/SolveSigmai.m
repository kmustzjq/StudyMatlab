function [ sigmai] =SolveSigmai(p,d_i,T,r)
[mui]=SolveMuI(p,d_i,T,r);
sum=0;
for i=1:T
    sum1=0;
    for j=1:i
        sum1=sum1+p/((1+r)^j);
    end
    sum=sum+d_i*(1-d_i)^i*(sum1)^2;
end

sumk=0;
for k=1:T
    sumk=sumk+p/((1+r)^k);
end
total=sum+sumk*sumk*((1-d_i)^T)-mui^2;
sigmai=total;
end

