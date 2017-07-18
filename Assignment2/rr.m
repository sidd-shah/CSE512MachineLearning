function [ ] = rr(Xtrain, ytrain, Xtest, ytest)

    [w,w_0 ]= train_rr(Xtrain, ytrain,1);
    err =  test_rr(Xtest, ytest, w, w_0);
    X_Pos = Xtrain(ytrain == 1, :);
    X_Neg = Xtrain(ytrain == -1, :);
    
    hold on
    plot(X_Pos(:,1),X_Pos(:,2),'+r')
    plot(X_Neg(:,1),X_Neg(:,2),'.m')
    plot_hyperplane(w, w_0);
    plot(Xtest(:,1),Xtest(:,2),'gp') 

    % Adding titles
    title('Ridge Regression')
    xlabel('X ')
    ylabel('Y ')
    legend('Positive Samples [Y = 1]','Negative Samples [Y = -1]','Ridge Regression Hyperplance', 'Test Samples'); 

end

