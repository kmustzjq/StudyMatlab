function outSample = fcn_queue2_logic3(d,warmup,sizeSample, et)
% This file is designed to control the sample and stop logic of
% the simulation,it also calculate and output sample mean vector
% 该文件旨在控制样本并停止模拟的逻辑，它还计算并输出样本均值向量
% eml.extrinsic('cal_CI'); 
% Declare global variables used in the programme
%声明程序中使用的全局变量
persistent ttlTime numCustomer countSample ;
 
% Initializing global variables and output
%初始化全局变量和输出
outSample = -1;
if isempty(ttlTime)%这个是永远成立的,会运行的
   ttlTime = 0;
   numCustomer = 0;
   countSample = 0;
end
% Simulation sample control algorithm
%仿真样本控制算法
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
