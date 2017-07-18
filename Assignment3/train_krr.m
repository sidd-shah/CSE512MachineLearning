function [ alpha ] = train_krr(X, y, lambda, kernel, gamma)
   K = [];
   [d,m] = size(X);
   if strcmp(kernel, 'linear')
       K = X'*X;
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
%
    I = eye(m);
    inverse_term =K*m*lambda*I;
    inverse = inv(inverse_term);
    alpha = inverse*y'*m*lambda;
end

