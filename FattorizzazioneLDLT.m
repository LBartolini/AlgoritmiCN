A = [24 23/2; 23/2 24];
[m, n] = size(A);

if m ~= n
    error("Matrice non quadrata");
end

% A simmetrica e definita positiva

if A(1, 1) <= 0
    error("La matrice non è sdp");
end
A(2:n) = A(2:n) / A(1, 1);

for j=2:n
    v = A(j, 1:j-1)'.*diag(A(1:j-1, 1:j-1));
    A(j,j) = A(j,j) - A(j, 1:j-1)*v;
    if A(j, j) <= 0
        error("Matrice non sdp");
    end
    A(j+1:n, j) = (A(j+1:n, j) - A(j+1:n, 1:j-1)*v)/A(j,j);
end

disp(A);

% NB La porzione superiore non viene modificata e non deve essere
% considerata. Il fattore L si trova nella porzione triangolare inferiore
% considerando la diagonale unitaria e D sono gli elementi diagonali.