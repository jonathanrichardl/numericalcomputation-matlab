clear all
x = [300 400 500]  %nilai input
y = [0.616 0.525 0.457 ] %nilai output
p = polyfit(x,y,2); %nilai koefisien interpolasi
d = polyval(p,350); %nilai output