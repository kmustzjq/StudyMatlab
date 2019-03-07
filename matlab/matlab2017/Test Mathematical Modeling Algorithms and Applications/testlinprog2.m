f=[-2,-3,5];
A=[-2 5 -1;
    1 3 1];
B=[-10,12]';
Aeq=[1,1,1];
Beq=7;
lb=zeros(3,1);
[m,n]=linprog(f,A,B,Aeq,Beq,lb)
