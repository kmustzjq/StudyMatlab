a=2:5;
b=[1,4,5,6];
c=1:4;
d=2:2:8;
AA=cell(2);
AA{1,1}=a;
AA{1,2}=b;
AA{2,1}=c;
AA{2,2}=d;
AA
BB=cell2mat(AA)