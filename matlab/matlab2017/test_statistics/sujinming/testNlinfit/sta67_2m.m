function [ yy ] = sta67_2m(beta0,x)
a=beta0(1);
b=beta0(2);
c=beta0(3);
d=beta0(4);
e=beta0(5);
f=beta0(6);
x1=x(:,1);
x2=x(:,2);
x3=x(:,3);
x4=x(:,4);
x5=x(:,5);
x6=x(:,6);
yy=a*x1+b*x2+c*x3+d*x4+e*x5+f*x6;

end

