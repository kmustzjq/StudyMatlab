function S2Busy = fcn_s2busy_automic_subsystem(job,S2,warmup,sizeSample,numSample)
S2Busy=-1;%先输出一个值，万一if循环不成立，程序就无法输出值
persistent S2Time;
if isempty(S2Time)%这个一定会运行
     S2Time=0;
end 
if job>warmup && job<=warmup+sizeSample*numSample
   S2Time=S2Time+S2;
end
if job==warmup+sizeSample*numSample
     S2Busy=S2Time;
end
end
