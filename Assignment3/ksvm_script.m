
[alpha, objective_value, support_vectors] = train_ksvm_dual(Xtr, ytr, 10, 'gaussian', 0.001)
ypredicted = test_ksvm_dual(alpha, Xtr, ytr, Xte, 'linear', 0)
Z = yte'.*ypredicted
size(Z(Z<1))