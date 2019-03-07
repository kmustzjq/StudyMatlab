%load('data.mat')
data=100+rand(1,1000);
%data=[3605.6,4073.9,4551.3,4901.4,5489.2,6076.3,7164.4,8792.1,10132.8,11784,14704,16466,18319.5,21280.4,25863.6,34500.6,46690.7,58510.5,68330.4,74894.2,79003.3,82673.1,89112.5];
Fh=20;
[corr_data1,Q]=solve_Q(data,Fh)
[h,p]=adftest(data,'model','TS','lags',0:2)
adftest(data)
