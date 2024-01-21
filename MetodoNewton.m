x0=5;
tolx = 0.0001;
rtolx = 0.0001;

for i=1:10000
    fx0 = f(x0);
    deriv = (f(x0+tolx)-fx0)/(tolx);
    x = x0 - fx0/deriv;
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