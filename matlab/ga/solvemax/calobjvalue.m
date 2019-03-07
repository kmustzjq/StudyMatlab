%Name: calobjvalue.m
%实现目标函数的计算
function [objvalue]=calobjvalue(pop)
temp1=decodechrom(pop,1,10);            %将pop每行转化成十进制数,decodechrom.m函数将二进制编码转换成十进制
x=temp1*10/1023;                        %将二值域 中的数转化为变量域的数
objvalue=10*sin(5*x)+7*cos(4*x);        %计算目标函数值
