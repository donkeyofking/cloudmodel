t = 1:1:100

y1 = 47.516* power(t,-0.132)

c=1.25
k=1.84

y2 = 100*k./(power(log(t),c)+k)

y3 = power(1-power(2./t,0.099),0.51)

% power function
u=1.4
a=0.13
y4 = power(1 + u*t, -a)

% MCM exponential function
u1 = 0.704
a1 = 0.000319

u2 = 0.000145
a2 = 1.79e-07

y5 = u1*exp(-a1*t) + u1*u2*(exp(-a2*t)-exp(-a1*t))/(a1-a2)


plot(t,y1)
hold on
plot(t,y2)
hold on
plot(t,y3)
hold on
plot(t,y4)
hold on
plot(t, y5)

