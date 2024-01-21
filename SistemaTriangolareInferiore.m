A = [1 7 5; 0 1 2; 0 0 1];
b = [9 9 9]';
[n, m] = size(A);
if n ~= m || n ~= length(b)
    error("Dimensioni di A o b errate");
end

% Accesso per Righe
x = b(:);
for i=1:n
    if A(i,i)==0
        error("Matrice A singolare");
    end
    x(i) = x(i) - A(i, 1:i-1)*x(1:i-1);
    x(i) = x(i) / A(i, i);
end
disp(x);

% Accesso per Colonne
x = b(:);
for j=1:n
    if A(j,j)==0
        error("Matrice A singolare");
    end
    x(j+1:n) = x(j+1:n) - A(j+1:n, j)*x(j);
    x(j) = x(j) / A(j, j);
end
disp(x);