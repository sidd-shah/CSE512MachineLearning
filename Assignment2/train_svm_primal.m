function [ w, w_0,fval] = train_svm_primal(X, y, C)
    [m,d] = size(X)
    
    semi_identity = eye(d+1);
    semi_identity(d+1,d+1) = 0;

    Z = [X ones(m,1)];
    A = -diag(y)*Z;
    c = -C*ones(m,1);

    H = semi_identity;
    f = zeros(d+1,1);

    [w, fval] = quadprog(H,f,A,c);
    w_0 = w(d+1);
    w = w(1:d);
end

