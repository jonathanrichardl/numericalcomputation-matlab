clc;
clear all;
f=@(x) 0.2 + 25*x - 200*x*x +675 *x*x*x - 900*x*x*x*x + 500*x*x*x*x*x ; %fungsi dari abdul muis
 a=0; %titik awal diketahui di soal
 b= 0.9; % titik akhir diketahui di soal
 n= 3; %jumlah segment, kalau gadikasihtau biarin aja 3
 answer = SimpThreeEight(f,a,b,n);
 fprintf('Jawaban :  %f',answer)
 
 
 
 
 
 
function I = SimpThreeEight(f, a, b, n)
h = (b-a)/n;
S =feval(f,a);
for i = 1:3:n-2
  x(i) = a + h*i;
  S = S + 3*feval(f, x(i));
end
for i = 2:3:n-1
  x(i) = a + h*i;
  S = S + 3*feval(f, x(i));
end
for i = 3 : 3: n-3
x(i) = a + h*i;
S = S + 2*feval(f, x(i));
end
S = S + feval(f, b);
I = 3*h*S/8;
end