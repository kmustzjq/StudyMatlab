%开发互助与资料分享：QQ:427883942

%定制遗传算法交叉变异求最值.m
clear
clc
popsize=50;                                       %群体大小
chromlength=10;                                   %字符串长度（个体长度）
pc=0.8;                                           %交叉概率
pm=0.2;                                         %变异概率
pop=initpop(popsize,chromlength);                 %随机产生初始群体
result=zeros(2,20);
for i=1:200                                        %20为迭代次数
[objvalue]=calobjvalue(pop);                      %计算目标函数
fitvalue=calfitvalue(objvalue);                   %计算群体中每个个体的适应度(负数变为0)
[newpop1]=selection(pop,fitvalue);                 %复制
%[newpop2]=crossover(newpop1,pc);                       %交叉
[newpop]=crossover(newpop1,pc); 
%[newpop]=mutation(newpop2,pm);  %变异    
[bestindividual,bestfit]=best(pop,fitvalue); %求出群体中适应值最大的个体及其适应值
result(1,i)=i;
result(2,i)=max(bestfit);
pop5=bestindividual;
x(i)=decodechrom(pop5,1,chromlength)*10/1023;     %将二值域 中的数转化为变量域的数
pop=newpop;
end
fplot('10*sin(5*x)+7*cos(4*x)',[0 10])          %目标函数
hold on
plot(x,result(2,:),'r*')
hold off
[z index]=max(result(2,:));   %计算最大值及其位置
x5=x(index)         %计算最大值对应的x值
max_result=z
