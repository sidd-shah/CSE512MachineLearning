function [ ypredicted ] = test_krr(alpha, Xtr, ytr, Xte, lambda, kernel, gamma)

[xfeatures, xtrainingsamples] = size(Xtrain);
%[d,m] = size(X); 

disp (size(alpha_krr));
disp (size(Xtrain'));

wlamda = (alpha_krr') * Xtrain' ;
mlamda = xtrainingsamples * lambda;
w = (1/mlamda) * wlamda;
ypredicted_krr= w * Xtest;

end

