function [training_error, test_error ] = linear_regression( X_train, X_test, ytrain, ytest )
    [X_train_norm, X_test_norm] = normalizeAll(X_train, X_test);
    k=5;
    training_error = zeros(k);
    test_error = zeros(k);
    
    for i = 1:k
        X_train_poly = generate_poly_features(X_train_norm, i);
        [m,n] = size(X_train_poly);
        Z = ones(m,1) ;
        X_train_poly = [Z X_train_poly]
        X_test_poly = generate_poly_features(X_test_norm, i);
        [m,n] = size(X_test_poly);
        Z = ones(m,1) ;
        X_test_poly = [Z X_test_poly]
        [w, w_0] = train_ls(X_train_poly, ytrain, 1);
        w = [w_0; w];
        training_error(i) =  mean((ytrain - X_train_poly*w).^2);
        test_error(i) = mean((ytest - X_test_poly*w).^2);
    end
    figure;
    xAxis = [1 2 3 4 5];
    plot(xAxis , training_error,'--gx',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5]);
    hold on;
    plot(xAxis , test_error,'--rx',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5]);

 
legend('Training','Test')
end


