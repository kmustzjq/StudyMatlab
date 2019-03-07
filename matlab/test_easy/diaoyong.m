disp('matrix analysis program.give two matrices:');
A=input('A=');
B=input('B=');
choice=input('choose one:1=A+B,2=A*B:');
switch choice
    case 1,eval('disp(''Addition:'');A+B','catchInfo');
    case 2,eval('disp(''multiplication:'');A*B','catchInfo');
end;

