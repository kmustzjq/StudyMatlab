function [y] = quicksort(A)
tic
%%这是快速排序，原理是取中间一个值middle，大于middle放在右边（A_right）
%等于middle放在中间（A_middle）
%小于middle放在左边（A_left）
A_col=length(A);   %求出向量A的长度
if A_col<=1;%只有一个数，就不需要排序
    answer=A;
else
    middle=A(1,fix(A_col/2));%取出中间数
    A_left=[];%小于middle放左边
    A_middle=[];%等于middle放中间
    A_right=[];%大于middle放右边
    for i=1:A_col  %遍历变量A
        if A(i)<middle
            A_left=[A_left A(i)];
        elseif A(i) == middle
            A_middle=[A_middle A(i)];
        else
            A_right=[A_right A(i)];
        end
    end
   answer=[quicksort(A_left) A_middle quicksort(A_right)];%利用递归
end
y=answer;
toc
end