function [InterruptionTime1,InterruptionTime0]= fcn_interruption(t,jobIn,ST1,n2,b2, jobOut,warmup,sizeSample,numSample,minS2)
persistent Interruption1  Interruption0 T0 count1 jobN breakN breakST count0;
InterruptionTime1=-1;%先输出一个值，万一if循环不成立，程序就无法输出值
InterruptionTime0=-1;%先输出一个值，万一if循环不成立，程序就无法输出值
if isempty(Interruption1)%一定会运行?
    Interruption1=0;
    T0=0;
    count1=0;
    jobN=0;
    breakN=0;
    breakST=0;
    count0=0;
    Interruption0=0;
end

if jobIn>warmup && jobOut<warmup+sizeSample*numSample %这是且?
    
    if jobIn>jobN
        jobN=jobIn;
        if n2+b2>0
            T0=t;
            breakST=ST1;
            breakN=jobIn;
        else
            count0=count0+1;
            Interruption0=Interruption0+max(ST1-minS2,0);
        end
    end
    if n2+b2==0&&(t-T0)<breakST && jobIn==breakN
        count1=count1+1;
        Interruption1=Interruption1+breakST-t+T0;
    end
    
end
if jobOut>=warmup+sizeSample*numSample
    InterruptionTime0=Interruption0;
    InterruptionTime1=Interruption1;
end
end
