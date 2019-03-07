goal=[300 -200];
weight=[300 -200];
x0=[30,55];
A=[2,1;-1,-1;-1,0];
B=[300,-200,-40];
lb=zeros(2,1);
[x,fval]=fgoalattain(@ex10_16,goal,weight,x0,A,B,[],[],lb)
