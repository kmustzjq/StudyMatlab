function sumQ2 = fcn_n2_logic4(warmup,sizeSample,numSample,jobN,q2)
persistent TotalQ2;
% Initializing global variables and output
%��ʼ��ȫ�ֱ��������
sumQ2 = -1;
if isempty(TotalQ2)%�������Զ������,�����е�
   TotalQ2=0;
end
% Simulation sample control algorithm
%�������������㷨
if jobN > warmup 
      TotalQ2=TotalQ2+q2; 
end    
if jobN==warmup+sizeSample*numSample
        sumQ2=TotalQ2;
end
