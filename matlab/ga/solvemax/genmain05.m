%�������������Ϸ���QQ:427883942

%�����Ŵ��㷨�����������ֵ.m
clear
clc
popsize=50;                                       %Ⱥ���С
chromlength=10;                                   %�ַ������ȣ����峤�ȣ�
pc=0.8;                                           %�������
pm=0.2;                                         %�������
pop=initpop(popsize,chromlength);                 %���������ʼȺ��
result=zeros(2,20);
for i=1:200                                        %20Ϊ��������
[objvalue]=calobjvalue(pop);                      %����Ŀ�꺯��
fitvalue=calfitvalue(objvalue);                   %����Ⱥ����ÿ���������Ӧ��(������Ϊ0)
[newpop1]=selection(pop,fitvalue);                 %����
%[newpop2]=crossover(newpop1,pc);                       %����
[newpop]=crossover(newpop1,pc); 
%[newpop]=mutation(newpop2,pm);  %����    
[bestindividual,bestfit]=best(pop,fitvalue); %���Ⱥ������Ӧֵ���ĸ��弰����Ӧֵ
result(1,i)=i;
result(2,i)=max(bestfit);
pop5=bestindividual;
x(i)=decodechrom(pop5,1,chromlength)*10/1023;     %����ֵ�� �е���ת��Ϊ���������
pop=newpop;
end
fplot('10*sin(5*x)+7*cos(4*x)',[0 10])          %Ŀ�꺯��
hold on
plot(x,result(2,:),'r*')
hold off
[z index]=max(result(2,:));   %�������ֵ����λ��
x5=x(index)         %�������ֵ��Ӧ��xֵ
max_result=z
