clear all
syms x
fun =  @(x) x^2/10 - 2* sin(x);
xi = 0;
xu = 4;
iter = 5;
min = goldensection(fun,xi,xu,iter);

function jaw=goldensection(f,xi,xu,iter)
i = 1;
while(i<=iter)
d = 0.6183 * (xu-xi);
x1 = xi+d;
x2 = xu-d;
temp1 = f(x1);
temp2 = f(x2);
jaw(i,1) = i;
jaw(i,2) = xi;
jaw(i,3) = f(xi);
jaw(i,4) = x2;
jaw(i,5) = temp2;
jaw(i,6) = x1;
jaw(i,7) = temp1;
jaw(i,8) = xu;
jaw(i,9) = f(xu);
jaw(i,10) = d;
if(temp1<temp2)
    xi = x2;
else 
    xu =x1;
end
i = i+1;
end
end

