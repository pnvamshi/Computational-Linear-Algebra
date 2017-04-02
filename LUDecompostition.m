% Name    : P.N. Vamshi
% Roll No : 13EC10044
% Jacobi Iteration Method

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
prompt = '\nEnter b Matrix \n';
b = input(prompt);
[n,c] = size(A);

L=eye(n); 
P=L; 
U=A;
for k=1:n
    [pivot, m]=max(abs(U(k:n,k)));
    m=m+k-1;
    if m~=k
        temp=U(k,:);
        U(k,:)=U(m,:);
        U(m,:)=temp;
        temp=P(k,:);
        P(k,:)=P(m,:);
        P(m,:)=temp;
        if k >= 2
            temp=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=temp;
        end
    end
    for j=k+1:n
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end

b = P*b;
y(1) = b(1,1)/L(1,1);
for i = 2:n
    sumay = 0;
    for j = 1:i-1
        sumay = sumay + L(i,j)*y(j);
    end
    y(i) = (b(i,1) - sumay)/L(i,i);
end

%Backward Substitution
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