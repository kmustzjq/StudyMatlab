function f = Hermite(x,y,y_1,x0)
%求已知数据点的向后差分牛顿插值多项式
%已知数据点的x 坐标向量:x
%已知数据点的y 坐标向量:y
%已知数据点的导数向量:y_1
%求得的Hermite插值多项式或x0处的插值:f
f = 0.0;
if(length(x) == length(y))
    if(length(y) == length(y_1))
        n = length(x);
        for i=1:n
            h = 1.0;
            a = 0.0;
            %%计算hi和ai
            for j=1:n
                if( j ~= i)
                    h = h*(x0-x(j))^2/((x(i)-x(j))^2);
                    a = a + 1/(x(i)-x(j));
                end
            end
            f = f + h*((x(i)-x0)*(2*a*y(i)-y_1(i))+y(i));
        end
    else
        disp('y和y的导数的维数不相等！');
    end
else
    disp('x和y的维数不相等！');
end
end

