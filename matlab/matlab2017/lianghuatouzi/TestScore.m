x=[1 1 2 3 5 8 11];
Z=zscore(x);
std(x);
var(x);
sqrt(sum((x-mean(x)).^2)/(length(x)-1));
ztem=(x-mean(x))./std(x);

syms x
int(sin(x))