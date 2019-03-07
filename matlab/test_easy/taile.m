syms x
r=taylor(x*exp(x),x,2,'order',9)
pretty(r)