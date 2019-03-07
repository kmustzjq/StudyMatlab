figure;
x=-pi:.1:pi;
y=sin(x);
z=cos(x);
RGB=[1 0 0];
plot(y,'color',RGB,'LineWidth',2,'linestyle','--');
hold on;
RGB=[0 0.5 0.5];
plot(z,'color',RGB,'linewidth',4)
legend('sinx','cosx')