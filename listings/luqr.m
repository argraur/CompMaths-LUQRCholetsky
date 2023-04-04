clear all;

dim = 10;
A = rand(dim);
A = A + A';
A = A + dim * eye(dim);
X = rand(dim, 1);

for i = 1:15
    [S,J] = eig(A);
    J(1,1) = J(1, 1) * 10^i;
    AA = S * J * inv(S);
    B = AA * X;
    [L, U] = lu(AA);
    [Q, R] = qr(AA);
    C = chol(AA);
    X1 = inv(U) * inv(L) * B;
    X2 = inv(R) * inv(Q) * B;
    X3 = inv(C) * inv(C') * B;
    err(i) = norm(X - X1) / norm(X);
    err2(i) = norm(X - X2) / norm(X);
    err3(i) = norm(X - X3) / norm(X);
end

hold on
plot(log10(err),'k');
plot(log10(err2),'g');
plot(log10(err3),'r');
hold off
pause
hold on
plot(err,'k');
plot(err2,'g');
plot(err3,'r');
hold off