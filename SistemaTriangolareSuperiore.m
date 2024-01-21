A = [1 7 5; 0 1 2; 0 0 1];
b = [9 9 9]';
[n, m] = size(A);
if n ~= m || n ~= length(b)
    error("Dimensioni di A o b errate");
end

% Accesso per Righe
x = b(:);
for i=n:-1:1
    if A(i,i)==0 
        error("A singolare"); 
    end
    x(i) = x(i) - A(i, i+1:n)*x(i+1:n);
    x(i) = x(i) / A(i,i);
end
disp(x)

% Accesso per Colonne
x = b(:);
for j=n:-1:1
    if A(j,j)==0 
        error("A singolare"); 
    end
    x(j) = x(j) / A(j,j);
    x(1:j-1) = x(1:j-1) - A(1:j-1, j)*x(j);
end
disp(x)