% Name    : P.N. Vamshi
% Roll No : 13EC10044
% Gauss Elimination Using Partial Pivoting

% function GaussElimination (A,b)

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
prompt = '\nEnter b Matrix \n';
b = input(prompt);

[n,c] = size(A);
A = [A,b];
if n < c
    disp('Infinitely many Solutions');
    return;
end

%Partial Pivoting
for i = 1:n-1
    p = i;
    for j = i+1:n
        if abs(A(j,i)) > abs(A(i,i))
            U = A(i,:);
            A(i,:) = A(j,:);
            A(j,:) = U;        
        end
    end
   
    while p <= n && A(p,i)== 0
        p = p+1;
    end
    if p == n+1
        break
    else
        if p ~= i
            T = A(i,:);
            A(i,:) = A(p,:);
            A(p,:) = T;
        end
    end
    %Reducing to Row Echelon Form
    for j = i+1:n
        m = A(j,i)/A(i,i);
        for k = i:c+1 
            A(j,k) = A(j,k) - m*A(i,k);
        end
    end
end

if A(c,c) == 0 && A(c,c+1)==0
    disp('Infinitely many Solution');
    return
else
    if A(c,c) == 0 && A(c,c+1)~=0
        disp('No Solution');
        return
    end
end

%Backward Substitution
x(c) = A(c,c+1)/A(c,c);
for i = c - 1:-1:1
    sumax = 0;
    for j = i+1:c
        sumax = sumax + A(i,j)*x(j);
    end
    x(i) = (A(i,c+1) - sumax)/A(i,i);
end
fprintf('\n');
disp('Solution is :');
disp(x);