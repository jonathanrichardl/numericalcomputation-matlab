clear all
x = [3 4.5 7 9];
y = [2.5 1 2.5 0.5];
x_spline = 3:0.1:9;
yy = spline(x,y,5); %not a knot
yc = [0 y 0]; %clamped
yyc = spline(x,yc,5);