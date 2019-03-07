%Name: decodebinary.m
%产生 [2^n 2^(n-1) ... 1] 的行向量，然后求和，将二进制转化为十进制
function pop2=decodebinary(pop)
[px,py]=size(pop);                     %求pop行和例数，即数组的维数
for i=1:py
      pop1(:,i)=2.^(py-1).*pop(:,i);
      py=py-1;
end
pop2=sum(pop1,2);
%求pop1的每行之和，B=sum（A，dim），只对A中第dim维的元素进行计算。dim=1，计算A中各列元素之和；dim=2，计算A中各行元素之和。
