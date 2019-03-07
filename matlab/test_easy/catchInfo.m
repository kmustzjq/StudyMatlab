function catchInfo
errStr=lasterr;
dimStr=findstr(errStr,'dimensions must agree');
if ~isempty(dimStr)
    if ~isempty(findstr(errStr,'Inner'))
        disp('Error! A*B requires A:m*n,B:n*p.');
    else
        disp('Error! Addition requires A:m*n,B:m*n.');
    end
end
end

