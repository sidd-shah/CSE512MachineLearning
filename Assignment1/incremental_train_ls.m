function [ w ] = incremental_train_ls( Xtrain, ytrain )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    global is_first;
    is_first = 1;
    m = size(Xtrain);
    w = zeros(1);
    for i = 1:m(1)
%          disp(Xtrain(i:i+1))
%          disp(ytrain(i:i+1))
        w = incremental_ls(Xtrain(i,:), ytrain(i,:));
    end

end

