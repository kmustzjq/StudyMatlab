function SystemTime = fcn_systemtime_auto_system(t,jobIn,jobOut,warmup,sizeSample,numSample)
persistent  T0;
SystemTime=-1;
if isempty(T0)%�������Զ������,�����е�
    T0=0;
end
if jobIn==warmup+1
    T0=t;
end
 
if jobOut==warmup+sizeSample*numSample
 SystemTime=t-T0;
end
