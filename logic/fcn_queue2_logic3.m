function outSample = fcn_queue2_logic3(d,warmup,sizeSample, et)
% This file is designed to control the sample and stop logic of
% the simulation,it also calculate and output sample mean vector
% ���ļ�ּ�ڿ���������ֹͣģ����߼����������㲢���������ֵ����
% eml.extrinsic('cal_CI'); 
% Declare global variables used in the programme
%����������ʹ�õ�ȫ�ֱ���
persistent ttlTime numCustomer countSample ;
 
% Initializing global variables and output
%��ʼ��ȫ�ֱ��������
outSample = -1;
if isempty(ttlTime)%�������Զ������,�����е�
   ttlTime = 0;
   numCustomer = 0;
   countSample = 0;
end
% Simulation sample control algorithm
%�������������㷨
if d >= warmup
    numCustomer = numCustomer + 1;
     ttlTime = ttlTime + et;
    if (numCustomer>= sizeSample)
         countSample = countSample + 1;
         outSample = ttlTime / numCustomer;
         ttlTime = 0;
        numCustomer = 0;
    end
end
