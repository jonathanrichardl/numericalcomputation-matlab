dydt=@(t,y) 4*exp(0.9*t) - 0.3*y ; %fungsi yang diminta di soal
rentangwaktu = [0 4]; %masukkin waktu yang disuruh di soal, misal disuruh 7detik, maka masukin [0 7] 
initial = 4%nilai y(0), kalo gadiketahui biarin aja 1
stepsize = 2 %nilai stepsize/h, ganti sesuai soal
[t,y] = eulode(dydt,rentangwaktu,initial,stepsize);
disp([t,y]);
function [t,y] = eulode(dydt,tspan,y0,h,varargin)
% eulode: Euler ODE solver
% [t,y] = eulode(dydt,tspan,y0,h,p1,p2,...):
% uses Euler's method to integrate an ODE
% input:
% dydt = name of the M-file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size
% p1,p2,... = additional parameters used by dydt
% output:
% t = vector of independent variable
% y = vector of solution for dependent variable
if nargin<4,error('at least 4 input arguments required'),end
ti = tspan(1);tf = tspan(2);
if ~(tf>ti),error('upper limit must be greater than lower'),end
t = (ti:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf
t(n+1) = tf;
n = n+1;
end
y = y0*ones(n,1); %preallocate y to improve efficiency
for i = 1:n-1 %implement Euler's method
y(i+1) = y(i) + dydt(t(i),y(i),varargin{:})*(t(i+1)-t(i));
end
end