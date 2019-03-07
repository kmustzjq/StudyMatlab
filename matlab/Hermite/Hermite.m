function f = Hermite(x,y,y_1,x0)
%����֪���ݵ�������ţ�ٲ�ֵ����ʽ
%��֪���ݵ��x ��������:x
%��֪���ݵ��y ��������:y
%��֪���ݵ�ĵ�������:y_1
%��õ�Hermite��ֵ����ʽ��x0���Ĳ�ֵ:f
f = 0.0;
if(length(x) == length(y))
    if(length(y) == length(y_1))
        n = length(x);
        for i=1:n
            h = 1.0;
            a = 0.0;
            %%����hi��ai
            for j=1:n
                if( j ~= i)
                    h = h*(x0-x(j))^2/((x(i)-x(j))^2);
                    a = a + 1/(x(i)-x(j));
                end
            end
            f = f + h*((x(i)-x0)*(2*a*y(i)-y_1(i))+y(i));
        end
    else
        disp('y��y�ĵ�����ά������ȣ�');
    end
else
    disp('x��y��ά������ȣ�');
end
end

