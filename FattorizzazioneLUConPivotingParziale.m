A = [24 -2 0; 9 24 -2; 0 9 24];
tol = 1e-9;
[m, n] = size(A);

if m ~= n
    error("Matrice non quadrata");
end

p = (1:n)';

for i=1:n-1
    [mi, ki] = max(abs(A(i:n, i)));
    if mi <= tol
        error("Matrice singolare");
    end
    ki = ki+i-1;
    if ki > i
        A([i, ki], :) = A([ki, i], :);
        p([i, ki]) = p([ki, i]);
    end
    A(i+1:n, i) = A(i+1:n, i)  / A(i, i);
    A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i)*A(i, i+1:n);
end
disp(A);

