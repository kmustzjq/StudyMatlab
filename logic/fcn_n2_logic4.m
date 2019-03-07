function sumQ2 = fcn_n2_logic4(warmup,sizeSample,numSample,jobN,q2)
persistent TotalQ2;
% Initializing global variables and output
%初始化全局变量和输出
sumQ2 = -1;
if isempty(TotalQ2)%这个是永远成立的,会运行的
   TotalQ2=0;
end
% Simulation sample control algorithm
%仿真样本控制算法
if jobN > warmup 
      TotalQ2=TotalQ2+q2; 
end    
if jobN==warmup+sizeSample*numSample
        sumQ2=TotalQ2;
end
