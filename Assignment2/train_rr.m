function [w, w_0] = train_rr(X, y, lambda)
    [m,n] = size(X);
    Z = ones(m,1);
    X = [X Z];
    C = transpose(X)*X + lambda*eye(n+1);
    d = transpose(X)*y;
    res = inv(C) * d;
    w_0 = res(n+1);
    w= res(1:n);
end
