clear all
syms x
fun = x^4 - 3*x^3 + 9*x^2 - 7*x -2;
fun2= diff(fun);
fun3 = x - (fun/fun2);
iter = 6;
initialValue = 3;
root = Newtonr(fun3,iter,initialValue);


function jaw = Newtonr(f,iter,xo)
jaw = zeros(iter,5);
f = matlabFunction(f);
i = 1;
xprev = xo;
xi = 0;
while i<=iter
jaw(i,1) = i;
jaw(i,2) = xprev;
xi = f(xprev);
jaw(i,3) = xi;
jaw(i,4) = abs((xi-xprev)/xi)*100;
if(i>1)
jaw(i,5) = jaw(i,4)/jaw(i-1,4);
end
xprev = xi;
i = i+1;
end
end



