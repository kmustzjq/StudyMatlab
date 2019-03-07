clc,clear;
H=[1 -1;-1 2];
f=[-2;-6];
A=[1 1;-1 2;2 1];
B=[2;2;3];
lb=zeros(2,1);
[x,fval,exitflag,output,lambda]=quadprog(H,f,A,B,[],[],lb);