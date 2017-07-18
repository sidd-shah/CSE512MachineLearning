function [w, w_0] = train_ls(X, y, bias)
    [m,n] = size(X);
    if bias==1
        disp('The bias is 1')
        Z = ones(m,1) ;
        X = [Z X]
    end
    if rank(X) ~= min(size(X))
        disp('Matrix is not full rank')
        [U, S] = eig(transpose(X)*X)
        Dplus =  diag(1/diag(S));
        res = (U*Dplus*transpose(U)) * transpose(X)* y
    else
        disp('Matrix is full rank')
        res = inv(transpose(X)*X) * (transpose(X) * y);
    end
    if bias == 1
        w = res(2:n)
        w_0 = res(1)
    else
        w = res
        w_0 = 0
    end
end
