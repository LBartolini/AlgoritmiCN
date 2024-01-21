a=-21.0;
b=19.0;
tolx = 0.0001;

if f(a)*f(b) > 0
    error("Gli estremi devono essere di segno opposto")
end

n_max = ceil(log2(b-a)-log2(tolx));

for i=1:n_max
    x = (a+b)/2;
    fx = f(x);
    fa = f(a);
    fb = f(b);
    if (abs(fx)*abs(b-a))/abs(fb-fa) <= tolx
        break
    end
    
    if fa*fx<0
        b=x;
    else 
        if fx*fb<0
        a=x;
        else
            break;
        end
    end
end

disp(x);

function y=f(x)
y=x^3 + x^2 - 23*x;
end
