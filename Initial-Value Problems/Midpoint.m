clear all
f=@(t,y) y*t*t*t - 1.5*y ;
[y,t] = midpoint(f,0,2,1,4);
function [y t] = midpoint(f,a,b,ya,n) % f itu fungsi, abatas bawah, b batasatas ,ya = initial condition, n = jumlah segmen
h = (b - a) / n;
halfh = h / 2;
y(1,:) = ya;
t(1) = a;
for i = 1 : n
    t(i+1) = t(i) + h;
    z = y(i,:) + halfh * f(t(i),y(i,:));
    y(i+1,:) = y(i,:) + h * f(t(i)+halfh,z);
end;
end