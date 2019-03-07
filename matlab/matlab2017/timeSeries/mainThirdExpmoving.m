clc,clear
yt=[20.04 20.06 25.72 34.61 51.77 55.92 8.65 131.11 148.58 162.67 232.26]';
n=length(yt);
alpha=0.3;
st1_0=mean(yt(1:3));
st2_0=st1_0;
st3_0=st1_0;
st1(1)=alpha*yt(1)+(1-alpha)*st1_0;
st2(1)=alpha*st1(1)+(1-alpha)*st2_0;
st3(1)=alpha*st2(1)+(1-alpha)*st3_0;
for i=2:n
    st1(i)=alpha*yt(i)+alpha*st1(i-1);
    st2(i)=alpha*st1(i)+alpha*st2(i-1);
    st3(i)=alpha*st2(i)+alpha*st3(i-1);
end
xlswrite('touzi.xls',[st1',st2',st3'])
st1=[st1_0,st1];
st2=[st2_0,st2];
st3=[st3_0,st3];
a=3*st1-3*st2+st3;
b=0.5*alpha/(1-alpha)^2*((6-5*alpha)*st1-2*(5-4*alpha)*st2+(4-3*alpha)*st3);
c=0.5*alpha^2/(1-alpha)^2*(st1-2*st2+st3);
yhat=a+b+c;
xlswrite('touzi.xls',yhat','Sheet1','D1')
plot(1:n,yt,'*',1:n,yhat(1:n),'O')
legend('ʵ��ֵ',' Ԥ��ֵ')
