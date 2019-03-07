%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%参数
format long;
R1=0.5;     %折射的半径
h=1000;    %光源与目标面距离
hh=10;       %透射面高度
spe=30;
R2=hh*tan(spe*pi/180);    %反射的半径
M=1000;    %计算次数
B=9;       %折射面初始高度
n0=1;n=1.49;  %折射率
for i=1:M
theta1(i)=(atan(R1/hh))*i/M;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%求透射曲面
v_Out_x(1)=0;
v_Out_y(1)=1000;
v_In_x(1)=0;
v_In_y(1)=B;
v_N_x(1)=0;
v_N_y(1)=(v_Out_y(1)-v_In_y(1))/sqrt(2-2*v_Out_y(1)*v_In_y(1));
x(1)=0;
y(1)=hh;
x(2)=y(1)/cot(theta1(1));
y(2)=hh;
for i=1:M-2
    v_Out_x(i+1)=0;
    v_Out_y(i+1)=1;
    v_In_x(i+1)=sin(theta1(i));
    v_In_y(i+1)=cos(theta1(i));
    v_N_x(i+1)=(n*v_Out_x(i+1)-v_In_x(i+1))/sqrt(1+1.49^2-2*n*(v_Out_x(i+1)*v_In_x(i+1)+v_Out_y(i+1)*v_In_y(i+1)));
    v_N_y(i+1)=(n*v_Out_y(i+1)-v_In_y(i+1))/sqrt(1+1.49^2-2*n*(v_Out_x(i+1)*v_In_x(i+1)+v_Out_y(i+1)*v_In_y(i+1)));
    x(i+2)=(v_N_x(i+1)*x(i+1)+v_N_y(i+1)*y(i+1))/(v_N_x(i+1)+v_N_y(i+1)*cot(theta1(i+1)));
    y(i+2)=cot(theta1(i+1))*x(i+2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%反射面参数
r_step=0.2; %步距
N=round(R2-x(M))/r_step;
for j=1:N
r(j)=x(M)+j*r_step;
end

for i=1:M
theta2(1,i)=atan(x(M)/hh)+spe*pi*i/(180*M);
gamma(1,i)=asin((cos(theta2(1,i)))/n);
beta(1,i)=gamma(1,i)/2+pi/4;
kk(1,i)=tan(gamma(1,i));
end
for j=2:N
for i=1:M
theta2(j,i)=atan(r(j-1)/hh)+spe*pi*i/(180*M);
gamma(j,i)=asin((cos(theta2(j,i)))/n);
beta(j,i)=gamma(j,i)/2+pi/4;
kk(j,i)=tan(gamma(j,i));
end
end


%%%%%%%%%%%%%%%%%%%%%%求反射曲面
j=1;
for i=1:M-1

a(1,i)=x(M);
b(1,i)=a(1,i)*cot(theta2(1,i));
a(1,i+1)=x(M);
b(1,i+1)=a(1,i+1)*cot(theta2(1,i+1)); 
x1(1,1)=r(1);
y1(1,1)=kk(1,1)*(x1(1,1)-a(1,1))+b(1,1);
x1(1,i+1)=(-y1(1,i)+b(1,i+1)-kk(1,i+1)*a(1,i+1)+tan(beta(1,i))*x1(1,i))/(tan(beta(1,i))-kk(1,i+1)); 
y1(1,i+1)=tan(gamma(1,i+1))*(x1(1,i+1)-a(1,i+1))+b(1,i+1);

if x1(1,i)<a(1,i)
       MM(j)=i+1;
         break;
end
end
%%%%%%%%%将其按从小到大排序，去零
j=1;
ii=0;
for i=MM(j):-1:1
    ii=ii+1;
    x2(j,ii)=x1(j,i);
    y2(j,ii)=y1(j,i);
end

%%%%画后面的线
for j=2:N
for i=1:M-1

a(j,i)=r(j-1);
b(j,i)=a(j,i)*cot(theta2(j,i));
a(j,i+1)=r(j-1);
b(j,i+1)=a(j,i+1)*cot(theta2(j,i+1)); 

x1(j,1)=r(j);
y1(j,1)=kk(j,1)*(x1(j,1)-a(j,1))+b(j,1);



x1(j,i+1)=(-y1(j,i)+b(j,i+1)-kk(j,i+1)*a(j,i+1)+tan(beta(j,i))*x1(j,i))/(tan(beta(j,i))-kk(j,i+1)); 
y1(j,i+1)=tan(gamma(j,i+1))*(x1(j,i+1)-a(j,i+1))+b(j,i+1);
 
      if x1(j,i+1)<a(j,i+1)
         MM(j)=i+1;
         break;
       else MM(j)=M;
       end
end
end

%%%%%%%%%%%%%%%%%将后面的线的起始点与终止点对调，即线的计算方向对调
for j=2:N
ii=0;
for i=MM(j):-1:1
    ii=ii+1;
    x2(j,ii)=x1(j,i);
    y2(j,ii)=y1(j,i);
end
end
%%%%%%%%%%%%%%%%%%将所有的反射线连接
ii=0;
for j=1:N
for i=1:MM(j)
    ii=ii+1;
    x3(ii)=x2(j,i);
    y3(ii)=y2(j,i);
    MMM=ii;
end
end
%%%%%%%%%%%%%加入透射曲线
ii=M;

for i=1:MMM
    ii=ii+1;
    x(ii)=x3(i);
    y(ii)=y3(i);
end

% digits(10) 
% x4=zeros(1,length(x));
% y4=zeros(1,length(x));
% for i=1:length(x)
% x4(1,i)=vpa(x(1,i),4);
% y4(1,i)=vpa(y(1,i),4);
% end
% x4=vpa(x,7)
% y4=vpa(y,7)
new_data_xy_theta=zeros(1356,2);
% data_xy_theta=zeros(1356,2);
new_data_xy_theta(:,1)=x';
new_data_xy_theta(:,2)=y';
data_xy_theta=double(vpa(new_data_xy_theta))
% data_xy_theta(:,1)=vpa(x',13);
% data_xy_theta(:,2)=vpa(y',13);
%save data_xy_theta.txt data_xy_theta -ascii -double;




