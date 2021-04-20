clc;
clear all;
f=@(x) 0.2 + 25*x - 200*x*x +675 *x*x*x - 900*x*x*x*x + 400*x*x*x*x*x ;
 a=0; %titik awal dari soal
 b= 0.32; %titik akhir dari soal
 n=2; %jumlah segmen, kalau gadikasih tau biarin aja 2
 
 
 
 h=(b-a)/n;
for k=1:1:n
  x(k)=a+k*h;
  y(k)=f(x(k));
end
 so=0;se=0;
for k=1:1:n-1
    if rem(k,2)==1
       so=so+y(k);
     else
       se=se+y(k); 
    end
end

answer=h/3*(f(a)+f(b)+4*so+2*se); %nilaiintegrasinya
 fprintf('Jawaban :  %f',answer)
