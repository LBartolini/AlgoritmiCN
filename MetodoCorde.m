x0=5;
tolx = 0.00001;
rtolx = 0.00001;
deriv = (f(x0+tolx)-f(x0))/(tolx);
for i=1:10000
    x = x0 - f(x0)/deriv;
    err = x-x0;
    if abs(err)/(tolx + rtolx*abs(x)) <= 1
        break
    end
    x0 = x;
end

disp(x)

function y=f(x)
y=x^4 + 3*x -10;
end