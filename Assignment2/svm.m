function [ ] = svm(Xtrain, ytrain, Xtest, ytest, C)
    [w,w_0, fval] = train_svm_primal(Xtrain, ytrain, C);
    a = accuracy(Xtest, ytest, w, w_0);
    disp(a);
    X_Pos = Xtrain(ytrain == 1, :);
    X_Neg = Xtrain(ytrain == -1, :);
    
    hold on
    plot(X_Pos(:,1),X_Pos(:,2),'+r')
    plot(X_Neg(:,1),X_Neg(:,2),'.m')
    plot_hyperplane(w, w_0);
    plot(Xtest(:,1),Xtest(:,2),'gp') 

    % Adding titles
    title('SVM')
    xlabel('X ')
    ylabel('Y ')
    legend('Positive Samples [Y = 1]','Negative Samples [Y = -1]','SVM Hyperplane', 'Test Samples'); 

end

