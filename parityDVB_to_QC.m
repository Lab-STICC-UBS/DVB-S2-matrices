% build parity from DVBS2_to_parity program
% clearvars -except parity

H =parity;
[M,N] = size(H);
K = N-M;
P=360;
Q = M/P;

Hpl = zeros(M,N); % H with permuted lines;
Hplc = zeros(M,N); % Hpl with permuted columns;

% lines permutation
for p = 0: P-1
    for q= 0:Q-1
      Hpl( p+q*P +1, : ) = H( p*Q+q +1 , : );   
    end    
end

% columns permutation
Hplc(:, 1:K) = Hpl(:, 1:K); 
for p = 0: P-1
    for q= 0:Q-1
      Hplc(:, K + p+q*P +1 ) = Hpl(:, K + p*Q+q +1 );   
    end    
end

%%

figure(1);
spy(H);

set(gca,'XTick', 1:P:K+1);
set(gca,'XTickLabel', [] );

grid on;
set(gca,'GridLineStyle', ':')


%%
figure(2);
spy(Hpl);
set(gca,'XTick', 1:P:K+1);
set(gca,'XTickLabel', [] );
set(gca,'YTick', 1:P:M+1);
ylabels = 0:P:M;
set(gca,'YTickLabel', ylabels );

grid on;
set(gca,'GridLineStyle', ':')



%%


figure(3);
spy(Hplc);

set(gca,'XTick', 1:P:N+1);
%xlabels = 0:P:K;
set(gca,'XTickLabel', [] );
set(gca,'YTick', 1:P:M+1);
ylabels = 0:P:M;
set(gca,'YTickLabel', ylabels );

grid on;
set(gca,'GridLineStyle', ':')




