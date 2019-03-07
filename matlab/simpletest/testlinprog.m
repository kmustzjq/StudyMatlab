clc,clear;
f=[-7;-5];
A=[3 2;
    4 6;
    0,7];
B=[80;220;230];
lb=zeros(2,1);
[x,fval]=linprog(f,A,B,[],[],lb)