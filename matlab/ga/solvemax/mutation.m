%Name: mutation.m
%����
function [newpop]=mutation(pop,pm)
[px,py]=size(pop);
newpop=ones(size(pop));
for i=1:px
    if(rand<pm)                          %randΪ�������һ����Ԫ{0,1}���������pmΪ0.001
        mpoint=round(rand*py);
        if mpoint<=0                     %��ѭ����ʹmpoint�R1
            mpoint=1;
        end
        newpop(i)=pop(i);
        if any(newpop(i,mpoint))==0      %��ѭ������i��mpoint��Ԫ�ر���
            newpop(i,mpoint)=1;
        else
            newpop(i,mpoint)=0;
        end
    else
        newpop(i)=pop(i);                %�������֮�⣬������
    end
end