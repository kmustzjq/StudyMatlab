function [Etotal] = SolveEtotal(a,b)
%a�ǳ�ʼ�������b��ͨ����Ԫ�����ֵ
e=a-b;
Etotal=0;
for i=1:length(e)
    Etotal=Etotal+0.5*e(1,i)*e(1,i);
end
end

