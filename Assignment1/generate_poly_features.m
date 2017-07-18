function [ X_poly ] = generate_poly_features( X, k )
% This function will return a matrix that has features raised to power k
% for all i from 1 -> k
    X_poly = X
    for i = 2:k
        X_poly =[X_poly X.^k];
    end
end