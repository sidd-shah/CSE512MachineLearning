function [ alpha, objective_value, support_vectors ] = train_ksvm_dual(X, y, C, kernel, gamma)
   K = [];
   [d,m] = size(X);
   if strcmp(kernel, 'linear')
       K = X'*X;
   else
       if strcmp(kernel,'gaussian')
           K = exp(gamma.*((X-X')*(X-X')));
       end
   end
%    The hessian H_ij is y_i * y_j * K_ij
   H = (y'*y).*K;
   f = -ones(m,1);
   lb = zeros(m,1);
   ub = C*ones(1,m);
   A = zeros(m,m);
   b = zeros(m,1);
   Aeq = zeros(m,m);
   beq = zeros(m,1);
   alpha = quadprog(H,f,A,b,Aeq,beq, lb, ub);
   disp(size(alpha))
   Z = ((alpha'*alpha).*(y'*y).*(X'*X))./2 
   objective_value = sum(Z(:)) - sum(alpha)
   support_vectors = numel(alpha(alpha>0.001))
end

