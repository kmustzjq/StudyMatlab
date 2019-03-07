clc,clear
yt=[676 825 774 716 940 1159 1484 1524 1668 1688 1958 ...
    2031 2234 2566 2820 3006 3093 3277 3514 3779 4107]';
alpha=0.3;
n=length(yt);
st1(1)=yt(1);st2(1)=yt(1);
for i=2:n
    st1(i)=alpha*yt(i)+(1-alpha)*st1(i-1);
    st2(i)=alpha*st1(i)+(1-alpha)*st2(i-1);
end
xlswrite('fadian.xls',[st1',st2'])
a=2*st1-st2;
b=alpha/(1-alpha)*(st1-st2);
yhat=a+b;
xlswrite('fadian.xls',yhat','Sheet1','C2')

