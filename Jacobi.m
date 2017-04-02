% Name    : P.N. Vamshi
% Roll No : 13EC10044
% Jacobi Iteration Method

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
prompt = '\nEnter b Matrix \n';
b = input(prompt);
prompt = '\nEnter initial Guess \n';
x = input(prompt);
[n,c] = size(A);

D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

I  = eye(n);
Xprev = x';
E = 1;
cnt  = 0;
Dinv = eye(n);
while (1)
    for i= 1:n
        if A(i,i)==0
            disp('Cannot apply Jacobi');
            return;
        end
        temp1 = 0;
        temp2 = 0;
        for j= 1:i-1
            temp1 = temp1+(A(i,j)*Xprev(j));
        end
        for j = i+1:n
            temp2 = temp2+(A(i,j)*Xprev(j));
        end;
        Xnew(i) = (b(i,1)-temp1-temp2)/A(i,i);
    end
   % Xnew = Xnew';
    E = abs(Xnew-Xprev);
    Xprev = round(Xnew,4);
    cnt = cnt+1;
    if cnt > 100
        fprintf('\n');
        disp('Does not Converge');
        return
    end
    if E < 0.0001
        break
    end
    %Xnew
end
fprintf('\n');
fprintf('Number of Iterations : %d',cnt);
fprintf('\n');
disp('Solution is :');
disp(Xnew);