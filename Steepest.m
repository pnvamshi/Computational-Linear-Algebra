% Name    : P.N. Vamshi
% Roll No : 13EC10044
% Steepest Descent Method

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
prompt = '\nEnter b Matrix \n';
b = input(prompt);
prompt = '\nEnter initial Guess \n';
x = input(prompt);
[n,c] = size(A);

xprev = x;
cnt = 0;

while(1)
    rprev = b - A*xprev;
    alp = (rprev'*rprev)/(rprev'*A*rprev);
    xnew = xprev + alp*rprev;
    error = abs(xnew-xprev);
    cnt = cnt+1;
    if cnt > 100
        fprintf('\n');
        disp('Does not Converge');
        return
    end
    if(error<0.00001)
        break;
    end
    xprev = xnew;
end

fprintf('\n');
fprintf('Number of Iterations : %d',cnt);
fprintf('\n');
disp('Solution is :');
disp(xnew);
