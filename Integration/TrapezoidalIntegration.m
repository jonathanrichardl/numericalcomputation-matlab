clc
clear all
v=@(x) 0.2 + 25*x - 200*x*x +675 *x*x*x - 900*x*x*x*x + 400*x*x*x*x*x ; %masukin FUNGSI kesini
a = 0; %titik awal, diketahui di soal
b = 0.8; %titik akhir diketahui di soal
segment = 1; %jumlah segmen, kalo gadikasihtau disoal biarin aja 1
a = trap(v,a,b,segment);
fprintf('Jawaban :  %f',a)







function I = trap(func,a,b,n,varargin)
% trap: composite trapezoidal rule quadrature
% I = trap(func,a,b,n,pl,p2,...):
% composite trapezoidal rule
% input:
% func = name of function to be integrated
% a, b = integration limits
% n = number of segments (default = 2)
% pl,p2,... = additional parameters used by func
% output:
% I = integral estimate
if nargin<3,error('at least 3 input arguments required'),end
if ~(b>a),error('upper bound must be greater than lower'),end
if nargin<4|isempty(n),n=2;end
x = a; h = (b - a)/n;
s=func(a,varargin{:});
for i = 1 : n-1
x = x + h;
s = s + 2*func(x,varargin{:});
end
s = s + func(b,varargin{:});
I = (b - a) * s/(2*n);
end
