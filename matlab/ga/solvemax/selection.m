%Name: selection.m
%ѡ����
function [newpop]=selection(pop,fitvalue)
totalfit=sum(fitvalue);%����Ӧֵ֮��
fitvalue=fitvalue/totalfit;%�������屻ѡ��ĸ���
fitvalue=cumsum(fitvalue); %�ۻ����ʣ��� fitvalue=[1 2 3 4]���� cumsum(fitvalue)=[1 3 6 10] 
[px,py]=size(pop);
ms=sort(rand(px,1)); %��С�������У���"rand(px,1)"������һ�������������̶���ʽ�ı�ʾ��������С��������
fitin=1;  %fivalue��һ������fitin����������Ԫ��λ����fitvalue(fitin)�����fitin������ĵ������屻ѡ��ĸ���
newin=1;  %ͬ��
while newin<=px
  if(ms(newin))<fitvalue(fitin)         %ms(newin)��ʾ����ms�������е�"newin"λ��ֵ��ͬ��fitvalue(fitin)
newpop(newin,:)=pop(fitin,:);      %��ֵ ,��������Ⱥ�� �ĵ�fitin�����屣������һ��(newpop)
newin=newin+1;
  else
   fitin=fitin+1;
  end
end
