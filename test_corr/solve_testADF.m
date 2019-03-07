function [beta,Ttest,R,adjust_R,F_test,Dickey_Fuller] = solve_testADF(data,k)
format short
y=diff(data);
n =length(y);
z=[];
k=k+1;
h=k;
while h>=1
    z_h=y(1,h:(n-k+h))';
    z=[z z_h];
    h=h-1;   
end
yt=z(:,1);
datat1=data(k:n)';
tt=(k:n)';
const=ones(1,n-k+1)';
%%求多元线性回归
if k>1
    yt1=z(:,2:k);
    AA=[datat1,const,tt,yt1];
    beta=inv(AA'*AA)*AA'*yt;
else
    AA=[datat1,const,tt];
    beta=inv(AA'*AA)*AA'*yt;
end

%%%求可决系数R的平方
ess=0;
tss=0;
mean_yt=sum(yt)/length(yt);
for e_1=1:length(yt)
    ess=ess+(yt(e_1,1)-(AA(e_1,:)*beta)).^2;
    tss=tss+(yt(e_1,1)-mean_yt).^2;
end
R=1-ess/tss;
%%%求修正可决系数adjust_R
adjust_R=1-((n-1)*(1-R))/(n-length(beta));

%求多元回归分析F检验
F_test=((tss-ess)/(length(beta)-1))/(ess/(n-length(beta)));
%求多元回归分析的T检验
c_jj=zeros(1,length(beta));
CJ=inv(AA'*AA);
for   c_j1=1:length(beta)
    c_jj(1,c_j1)=CJ(c_j1,c_j1);
end
Ttest=zeros(1,length(beta));
for   T_1=1:length(beta)
    Ttest(1,T_1)=beta(T_1,1)/(sqrt(c_jj(1,T_1)*ess/(n-length(beta))));
end

table_1=[4.38  4.15  4.04  3.99  3.98  3.96]';
table_2=[3.95  3.80  3.73  3.69  3.68  3.66]';
table_3=[3.60  3.50  3.45  3.43  3.42  3.41]';
table_4=[3.24  3.18  3.15  3.13  3.13  3.12]';
table_5=[1.14  1.19  1.22  1.23  1.24  1.25]';
table_6=[0.80  0.87  0.90  0.92  0.93  0.94]';
table_7=[0.50  0.58  0.62  0.64  0.65  0.66]';
table_8=[0.15  0.24  0.28  0.31  0.32  0.33]';
table=[table_1 table_2 table_3 table_4 table_5 table_6 table_7 table_8];
table=-table;
tablen=length(table(1,:));
%%%差值拟合
table_N=[25, 50, 100, 250, 500, 100000];%样本个数
table_P=[0.01, 0.025, 0.05, 0.10, 0.90, 0.95, 0.975, 0.99];%样本的置信区间
tableipl =zeros(1,tablen);
%样本个数和置信水平值的线性插值拟合
if n<=table_N(1,1)
    tableipl=table(1,:);
end
if n>=table_N(1,length(table_N))
    tableipl=table(length(table(:,1)),:);
end
t_i1=1;
while n>table_N(1,t_i1)
    if n<=table_N(1,t_i1+1)
        for t_i2=1:tablen
            tableipl(1,t_i2)=table(t_i1,t_i2)+(table(t_i1+1,t_i2)-table(t_i1,t_i2))*(n-table_N(1,t_i1))/(table_N(1,t_i1+1)-table_N(1,t_i1));
        end
    end
t_i1=t_i1+1;
end

%经过样本拟合后在对置信区间进行线性插值拟合
STAT=Ttest(1,1);
if STAT<=tableipl(1,1)
    disp('p_value smaller than printed p_value');
end
if STAT>=table_N(1,length(table_N))
   disp('p_value greater than printed p_value');
end
ST_i1=1;
while STAT>tableipl(1,ST_i1)
    if STAT<=tableipl(1,ST_i1+1)
        for ST_i2=1:tablen
            interpol=table_P(1,ST_i1)+(table_P(1,ST_i1+1)-table_P(1,ST_i1))*(STAT-tableipl(1,ST_i1))/(tableipl(1,ST_i1+1)-tableipl(1,ST_i1));
        end
        PVAL=interpol
    end
ST_i1=ST_i1+1;
end
Dickey_Fuller=STAT;
end

