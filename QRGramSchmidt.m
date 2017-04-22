% Name    : P.N. Vamshi
% Roll No : 13EC10044
% QR Decomposition Using House Holder Equations

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
[m,n] = size(A);
Q = zeros(m,n);
R = zeros(n,n);

% compute QR using Gram-Schmidt
for j = 1:n
   v = A(:,j);
   for i=1:j-1
        R(i,j) = Q(:,i)'*A(:,j);
        v = v - R(i,j)*Q(:,i);
   end
   R(j,j) = norm(v);
   Q(:,j) = v/R(j,j);
end

fprintf('\n');
disp('Q = ');
disp(Q);
disp('R = ');
disp(R);
fprintf('\n');

% prompt = '\nEnter b Matrix \n';
% b = input(prompt);
% GaussElimination(R,(Q')*b);