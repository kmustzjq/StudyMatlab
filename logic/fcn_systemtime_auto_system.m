function SystemTime = fcn_systemtime_auto_system(t,jobIn,jobOut,warmup,sizeSample,numSample)
persistent  T0;
SystemTime=-1;
if isempty(T0)%这个是永远成立的,会运行的
    T0=0;
end
if jobIn==warmup+1
    T0=t;
end
 
if jobOut==warmup+sizeSample*numSample
 SystemTime=t-T0;
end
