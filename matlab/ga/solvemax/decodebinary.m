%Name: decodebinary.m
%���� [2^n 2^(n-1) ... 1] ����������Ȼ����ͣ���������ת��Ϊʮ����
function pop2=decodebinary(pop)
[px,py]=size(pop);                     %��pop�к��������������ά��
for i=1:py
      pop1(:,i)=2.^(py-1).*pop(:,i);
      py=py-1;
end
pop2=sum(pop1,2);
%��pop1��ÿ��֮�ͣ�B=sum��A��dim����ֻ��A�е�dimά��Ԫ�ؽ��м��㡣dim=1������A�и���Ԫ��֮�ͣ�dim=2������A�и���Ԫ��֮�͡�
