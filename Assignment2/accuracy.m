function [ accuracy ] = accuracy( X, y, w, w_0 )
    [m,n] = size(X);
     w = [w_0;w];
     X = [ones(m,1) X];
     errors = 0;
     for i = 1: m
         if y(i)*(X(i,:)*w)<=0
             errors = errors+1;
         end
     end
     accuracy = (m-errors) / m * 100;    
end

