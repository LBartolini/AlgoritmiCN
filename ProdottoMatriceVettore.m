sizeInCommon = 10;
nOfSamples = 10;

A = randi(10, 10, sizeInCommon, nOfSamples);
b = randi(10, sizeInCommon, 1, nOfSamples);

for k=1:nOfSamples
    righe = matvecRighe(A(:,:,k), b(:,:,k));
    colonne = matvecColonne(A(:,:,k), b(:,:,k));
    fprintf("\nTry %d: %d\n", k, isequal(righe, colonne));
    %disp(righe);
    %disp(colonne);
end

function result = matvecRighe(A, b)
    result = zeros(size(A, 1), size(b, 2));
    for i=1:size(result, 1)
        result(i, :) = result(i, :) + A(i, 1:size(result, 2))*b(1:size(result, 2));
    end

end

function result = matvecColonne(A, b)
    result = zeros(size(A, 1), size(b, 2));
    for j=1:size(result, 2)
        result(1:size(result, 1), :) = result(1:size(result, 1), :) + A(1:size(result, 1), j)*b(j);
    end
end
