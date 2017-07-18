function [w] =  incremental_ls(X, y)
%     This is the incremental X matrix
    global A;
    global Y
    global Ainv;
    global is_first;

    if is_first == 1
        A = X;
        Y = y;
        X = transpose(X)*X;
        Ainv = pinv(X);
        is_first = 0;
    else
        A = [A; X];
        Y = [Y; y];
        Ainv = woodburg_inverse(X, Ainv);
    end
    w = Ainv * (transpose(A)*Y)
end

function [A_inv] = woodburg_inverse(X,Ainv)
    A_inv = Ainv - ((Ainv * (X * transpose(X))* Ainv)/(1+(X*Ainv*transpose(X))));
end