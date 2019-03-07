function [Etotal] = SolveEtotal(a,b)
%a是初始的输出，b是通过神经元输出的值
e=a-b;
Etotal=0;
for i=1:length(e)
    Etotal=Etotal+0.5*e(1,i)*e(1,i);
end
end

