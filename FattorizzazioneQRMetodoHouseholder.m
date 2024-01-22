A = [2 3; 4 3; 4 0];
[m, n] = size(A);

for i=1:n
    alfa = norm(A(i:m, i));
    if alfa == 0
        error("A non ha rango massimo");
    end
    if A(i, i) >= 0
        alfa = -alfa;
    end

    v1 = A(i,i)-alfa;
    A(i+1:m, i) = A(i+1:m, i) / v1;
    beta = -v1/alfa;
    A(i+1:m, i+1:n) = A(i+1:m, i+1:n) - (beta*[1; A(i+1:m, i)])*([1; A(i+1:m, i)]'.*A(i+1:m, i+1:n));
end

disp(A);

% NB: La matrice A finale contine le informazioni relative al fattore R
% cappuccio  e i valori significativi dei vettori di Householder Vi
% cappuccio con prima componente normalizzata ad 1