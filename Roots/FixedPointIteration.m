clear all
syms x
fun = @(x) -x^2 + 8*x - 12
fun2 = (fun-8*x)/(-8) ;
y = checkconvergence(fun2);
initialvalue = 0; 
iter = 10;
root = fixedpoint(fun2,initialvalue,iter);
clearvars -except root;
root = array2table(y);
root.Properties.VariableNames = {'Iterasi' 'Xi-1' 'Xi' 'Error' 'Ei/Ei-1'};
%Hasil Tabel iterasi dilihat di variabel root
    
function  jaw = checkconvergence(f)
syms x
tmp = matlabFunction(diff(f,x));
i = 1;
jaw = 1;
    while i<25
        a = tmp(i);
        if(abs(a)>1)
            jaw = 0;
            fprintf("Fungsi tidak Konvergen");
            return
        end
        i = i+1;
    end
    fprintf("Fungsi Konvergen");
end

function jaw = fixedpoint(f2,xo,iter)
jaw = zeros(iter,5);
f2 = matlabFunction(f2);
i = 1;
xprev = xo;
xi = 0;
while i<=iter
jaw(i,1) = i;
jaw(i,2) = xprev;
xi = f2(xprev);
jaw(i,3) = xi;
jaw(i,4) = abs((xi-xprev)/xi)* 100;
if(i>1)
jaw(i,5) = jaw(i,4)/jaw(i-1,4);
end
xprev = xi;
i = i+1;
end
end



