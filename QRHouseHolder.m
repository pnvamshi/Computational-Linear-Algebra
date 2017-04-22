% Name    : P.N. Vamshi
% Roll No : 13EC10044
% QR Decomposition Using House Holder Equations

prompt = 'Enter Co-eff Matrix \n';
A = input(prompt);
[m,n]=size(A);
R=A;
Q=eye(m);
for k = 1:m-1
    x = zeros(m,1);
    x(k:m,1) = R(k:m,k);
    g = norm(x);
    v = x;
    v(k) = x(k)+g;
    s = norm(v);
    if s~=0, 
        w=v/s; 
        u=2*R'*w;
        R=R-w*u';
        Q=Q-2*Q*(w)*(w');
    end
end

Qnew = Q(1:m,1:n);
Rnew = R(1:m-1,1:n)

fprintf('\n');
disp('Full QR Decomposition :');
disp('Q = ');
disp(Q);
disp('R = ');
disp(R);
fprintf('\n');

fprintf('\n');
disp('Reduced QR Decomposition :');
disp('Q~ = ');
disp(Qnew);
disp('R~ = ');
disp(Rnew);
fprintf('\n');

% prompt = '\nEnter b Matrix \n';
% b = input(prompt);
% GaussElimination(R,(Q')*b);