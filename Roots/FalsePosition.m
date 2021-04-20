fun = @(x) log(x^2) - 0.7;
x1 = 0.5;
x2 = 2;
iter = 3;
y = falsep(fun,x1,x2,iter)
clearvars -except y;
y = array2table(y);
y.Properties.VariableNames = {'Iterasi' 'Xi' 'Xu' 'Xr' 'F(x1) * F(xr)' 'Error'};
%Hasil Tabel iterasi dilihat di variabel y

function  jaw = falsep(f, x1,xu,iter)
i = 1;
jaw = zeros(iter,5);
xr =0;
while i<=iter
jaw(i,1) = i;
jaw(i,2) = x1;
jaw(i,3) = xu;
xr = xu - (f(xu)*(x1-xu))/(f(x1)-f(xu))
jaw(i,4) = xr;
    if f(x1)*f(xr) > 0
    x1 = xr;
    jaw(i,5) = 1;
    
    else 
    xu = xr;
    jaw(i,5) = -1;
end
    
    if(i>1)
    jaw(i,6) = abs((xr-tmp)/xr)*100
    tmp = xr;
    else
    tmp = xr;
    end
i = i+1
end
end

