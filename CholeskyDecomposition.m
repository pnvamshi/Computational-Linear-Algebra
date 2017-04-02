% Name    : P.N. Vamshi
% Roll No : 13EC10044
% Cholesky Decomposition

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
prompt = '\nEnter b Matrix \n';
b = input(prompt);

[n,c] = size(A);
L = zeros(n,n);

%Checking if A is symmetric Matrix
if ~isequal(A,A')
    disp('Input Matrix is not Symmetric');
    return;
end

%Checking if A is +ve def 
for i=1:n
        subA=A(1:i,1:i);
        if(det(subA)<=0)
            disp('Input Matrix is not +ve def');
            return;
        end
end

%Decomposing to L, L'
for k=1:n
    A(k,k) = sqrt(A(k,k));
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for j = k+1:n
        A(j:n,j) = A(j:n,j)-A(j,k)*A(j:n,k);
    end
    L(k,1:k) = A(k,1:k);
end

%Forward Substitution
y(1) = b(1,1)/L(1,1);
for i = 2:n
    sumay = 0;
    for j = 1:i-1
        sumay = sumay + L(i,j)*y(j);
    end
    y(i) = (b(i,1) - sumay)/L(i,i);
end

%Backward Substitution
U = L';
x(c) = y(1,n)/U(n,n);
for i = n - 1:-1:1
    sumax = 0;
    for j = i+1:n
        sumax = sumax + U(i,j)*x(j);
    end
    x(i) = (y(1,i) - sumax)/U(i,i);
end
fprintf('\n');
disp('Solution is :');
disp(x);