%Name: crossover.m
%����
function [newpop]=crossover(pop,pc)
[px,py]=size(pop);
newpop=ones(size(pop));                              %����px��pyά1����
for i=1:2:px-1                                       %i=1~19,���2
if(rand<pc)                                          %randΪ�������һ����Ԫ{0,1}���������pcΪ0.6
cpoint=round(rand*py);                               %��cpointΪ����㣬���������µ��Ӹ���
newpop(i,:)=[pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
newpop(i+1,:)=[pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
else
newpop(i,:)=pop(i);
newpop(i+1,:)=pop(i+1);
end
end