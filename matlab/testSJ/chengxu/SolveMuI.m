function [ mui] = SolveMuI(p,d_i,T,r)

mui=p*(1-((1-d_i)/(1+r))^T)*(1-d_i)/(r+d_i);


end

