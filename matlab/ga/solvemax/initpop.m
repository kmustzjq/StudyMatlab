%Name: initpop.m
%��ʼ��
function pop=initpop(popsize,chromlength)
pop=round(rand(popsize,chromlength));         
% rand�������ÿ����ԪΪ {0,1} ����Ϊpopsize������Ϊchromlength�ľ���
% round�Ծ����ÿ����Ԫ�������뷨���л��������������ĳ�ʼ��Ⱥ��
