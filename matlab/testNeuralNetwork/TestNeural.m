%��������Ҫ����������
%������1��2�еľ�����Ϊʾ��
input=[0.05,0.10];
output=[0.01,0.99];
%���ó�ʼȨ��
first_neural=[0.15,0.25;0.2,0.3];
second_neural=[0.4,0.5;0.45,0.55];
b1=0.35;b2=0.6;
%%ǰ�򴫲�
outh1h2=SolveNeuralOutput(input,first_neural,b1)
outo1o2=SolveNeuralOutput(outh1h2,second_neural,b2)
%%���򴫲�
%1���������
ETOTAL= SolveEtotal(output,outo1o2)
learnrate=0.5;
[weight2]=Weight_update_second(second_neural,output,outo1o2,outh1h2,learnrate)
[weight1]=Weight_update_first(first_neural,input,second_neural,output,outo1o2,outh1h2,learnrate)