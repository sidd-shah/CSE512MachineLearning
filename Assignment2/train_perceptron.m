function [ w, w_0 ] = train_perceptron(X, y)
    [m, n] = size(X);
    X = [X ones(m,1)];
    w = zeros(n+1,1);
    for i = 1:m
        if y(i)*(X(i,:)* w) <= 0
            w = w + y(i)*X(i,:)';
        end
    end
    w_0 = w(n+1);
    w = w(1:n);
end

