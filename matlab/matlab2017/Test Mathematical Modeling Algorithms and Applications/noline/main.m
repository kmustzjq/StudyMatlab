%求解非线性规划
options=optimset('largescale','off');
[x,y]=fmincon('minf',rand(3,1),[],[],[],[],zeros(3,1),[],...
'constraint',options)