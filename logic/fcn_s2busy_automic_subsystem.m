function S2Busy = fcn_s2busy_automic_subsystem(job,S2,warmup,sizeSample,numSample)
S2Busy=-1;%�����һ��ֵ����һifѭ����������������޷����ֵ
persistent S2Time;
if isempty(S2Time)%���һ��������
     S2Time=0;
end 
if job>warmup && job<=warmup+sizeSample*numSample
   S2Time=S2Time+S2;
end
if job==warmup+sizeSample*numSample
     S2Busy=S2Time;
end
end
