goal=[16 14];
weight=[16 14];
x0=[4 4];
A=[1,0;
    0,1;
    -1,-1];
B=[5 6 -7];
lb=zeros(2,1);
[x,fval]=fgoalattain(@ex10_14,x0,goal,weight,A,B,[],[],lb)