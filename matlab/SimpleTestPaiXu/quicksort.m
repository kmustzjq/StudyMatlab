function [y] = quicksort(A)
tic
%%���ǿ�������ԭ����ȡ�м�һ��ֵmiddle������middle�����ұߣ�A_right��
%����middle�����м䣨A_middle��
%С��middle������ߣ�A_left��
A_col=length(A);   %�������A�ĳ���
if A_col<=1;%ֻ��һ�������Ͳ���Ҫ����
    answer=A;
else
    middle=A(1,fix(A_col/2));%ȡ���м���
    A_left=[];%С��middle�����
    A_middle=[];%����middle���м�
    A_right=[];%����middle���ұ�
    for i=1:A_col  %��������A
        if A(i)<middle
            A_left=[A_left A(i)];
        elseif A(i) == middle
            A_middle=[A_middle A(i)];
        else
            A_right=[A_right A(i)];
        end
    end
   answer=[quicksort(A_left) A_middle quicksort(A_right)];%���õݹ�
end
y=answer;
toc
end