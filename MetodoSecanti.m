x0=-5;
x1=14;
tolx = 0.001;
rtolx = 0.001;

fx0 = f(x0);
fx1 = f(x1);
for i=1:10000
    x = x1 - ((x0-x1)*fx1)/(fx0-fx1);
    %x = (x0*fx1 -x1*fx0)/(fx1 - fx0); equivalente alla precedente
    err = x-x1;
    if abs(err)<= (tolx + rtolx*abs(x))
        break
    end
    x0=x1;
    fx0=fx1;
    x1=x;
    fx1=f(x1);
end

disp(x)

function y=f(x)
y=x^4 + 3*x -10;
end