x0=5;
tolx = 0.0001;
rtolx = 0.0001;

for i=1:10000
    % primo step Newton
    fx0 = f(x0);
    deriv0 = (f(x0+tolx)-fx0)/(tolx);
    x1 = x0 - fx0/deriv0;
    
    % secondo step newton
    fx1 = f(x1);
    deriv1 = (f(x1+tolx)-fx1)/(tolx);
    x2 = x1 - fx1/deriv1;
    
    % calcolo la nuova approssimazione
    x = (x1^2 -x0*x2)/(2*x1 -x0 -x2);
    err = x-x0;
    if abs(err)/(tolx + rtolx*abs(x)) <= 1
        break
    end
    x0 = x;
end

disp(x)

function y=f(x)
y=(x+2)^4;
end