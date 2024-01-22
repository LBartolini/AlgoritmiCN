A = [24 -2 0; 9 24 -2; 0 9 24];
[m, n] = size(A);

if m ~= n
    error("Matrice non quadrata");
end

for i=1:n-1
    if A(i, i) == 0
        error("Matrice singolare");
    end
    A(i+1:n, i) = A(i+1:n, i)  / A(i, i);
    A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i)*A(i, i+1:n);
end

disp(A);