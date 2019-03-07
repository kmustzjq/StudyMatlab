clc,clear
JiZhunCeng=[1 1 1 4 1 1/2;
    1 1 2 4 1 1/2;
    1 1/2 1 5 3 1/2;
    1/4 1/4 1/5 1 1/3 1/3;
    1 1 1/3 3 1 1;
    2 2 2 3 3 1];
B1=[1 1/4 1/2;4 1 3;2 1/3 1];
B2=[1 1/4 1/5;4 1 1/2;5 2 1];
B3=[1 3 1/3;1/3 1 1/7;3 1 1];
B4=[1 1/3 5;3 1 7;1/5 1/7 1];
B5=[1 1 7;1 1 7;1/7 1/7 1];
B6=[1 7 9;1/7 1 1;1/9 1 1];
B=[B1;B2;B3;B4;B5;B6];
[x,y]=eig(JiZhunCeng);
lamda=max(diag(y));
index=find(diag(y)==lamda);
w0=x(:,index)/sum(x(:,index))
w=[];
for i=1:6
    [x1,y1]=eig(B(3*(i-1)+1:3*i,1:3));
    lamda1=max(diag(y1));
    index1=find(diag(y1)==lamda1);
    w1=x1(:,index1)/sum(x1(:,index1));
    w=[w,w1];
end
w


