function [ ypredicted ] = test_ksvm_dual(alpha, Xtr, ytr, Xte, kernel, gamma)
%     How to find phi for a gaussian kernel
%  No need to find phi, we can simply calculate the inner product and use
%  it
    K = [];
    [d,n] = size(Xte);
    [d,m] = size(Xtr);
    ypredicted = zeros(n,1);
    for i = 1:n
        summation = 0;
        for j = 1:m
            if kernel == 'linear'
                K = Xtr(:,j)' *Xte(:,i);
            else
                if strcmp(kernel,'gaussian')
                   K = zeros(m,m);
                   for k = 1:m
                       for l = 1:m
                           K(k,l) = exp(gamma*(norm(X(:,k)-X(:,l))^2));
                       end
                   end
                end
            end
            summation = summation + alpha(j)* ytr(j) * K;    
        end
        ypredicted(i) = sign(summation);    
    end
end

