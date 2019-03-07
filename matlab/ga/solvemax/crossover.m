%Name: crossover.m
%交叉
function [newpop]=crossover(pop,pc)
[px,py]=size(pop);
newpop=ones(size(pop));                              %定义px×py维1矩阵
for i=1:2:px-1                                       %i=1~19,间隔2
if(rand<pc)                                          %rand为随机产生一个单元{0,1}，交叉概率pc为0.6
cpoint=round(rand*py);                               %以cpoint为交叉点，交叉后产生新的子个体
newpop(i,:)=[pop(i,1:cpoint),pop(i+1,cpoint+1:py)];
newpop(i+1,:)=[pop(i+1,1:cpoint),pop(i,cpoint+1:py)];
else
newpop(i,:)=pop(i);
newpop(i+1,:)=pop(i+1);
end
end