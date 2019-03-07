%Name: mutation.m
%变异
function [newpop]=mutation(pop,pm)
[px,py]=size(pop);
newpop=ones(size(pop));
for i=1:px
    if(rand<pm)                          %rand为随机产生一个单元{0,1}，变异概率pm为0.001
        mpoint=round(rand*py);
        if mpoint<=0                     %子循环，使mpoint≧1
            mpoint=1;
        end
        newpop(i)=pop(i);
        if any(newpop(i,mpoint))==0      %子循环，将i行mpoint列元素变异
            newpop(i,mpoint)=1;
        else
            newpop(i,mpoint)=0;
        end
    else
        newpop(i)=pop(i);                %变异概率之外，不变异
    end
end