%Name:calfitvalue.m
%计算个体的适应值
function fitvalue=calfitvalue(objvalue)
global Cmin;                       %定义Cmin为全局变量
Cmin=0;
[px,py]=size(objvalue);
for i=1:px
      if objvalue(i)+Cmin>0
          temp=Cmin+objvalue(i);
      else
          temp=0.0;
      end
      fitvalue(i)=temp;
end
fitvalue=fitvalue';
