function RandDisplayJiong
axis off;
set(gcf,'menubar','none','toolbar','none');
for k=1:10
    h=text(rand,rand,...
        ['\fontsize{',num2str(unifrnd(20,50)),'}\frontname{Á¥Êé} ‡å'],...
        'color',rand(1,3),'Rotation',360*rand);
        
         %['\fontsize{',num2str(unifrnd(20,50)),'}\frontname{Á¥Êé} ‡å'],...'color',rand(1,3),'rotation',360*rand);
    pause(0.2)
end
end