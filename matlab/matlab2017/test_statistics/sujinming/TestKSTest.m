x=[420 500 920 1380 1510 1650 1760 2100 2320 2350]';
[h,p,l,c]=kstest(x,[x expcdf(x,1500)])

%ks检验威布尔分布
x1=exprnd(2,100,1);
[h1,p1]=kstest(x1,[x1 expcdf(x1,2)])
[h2,p2]=kstest(x1,[x1,normcdf(x1,1,2)])

%%秩和检验ranksum
x3=poissrnd(5,10,1);
y3=poissrnd(2,20,1);
[p h]=ranksum(x3,y3,0.05)