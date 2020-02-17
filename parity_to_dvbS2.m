%construct from DVB-S2 type parity check matrix text file as table that
%define a matix in the standard.
[M,N] = size(Parity);
K = N-M;
rate=K/N;
info_parity = Parity(:, 1:K);
staircase = Parity(:,K+1:N);
P = 512;
info_parity_trunc = info_parity(:,1:P:K);


%check dv regularity
dv_check = info_parity_trunc;
dv_check( dv_check>0 )=1;
dv_check_sum =sum(dv_check,1);
dv_max = max(dv_check_sum);
dv_min = min(dv_check_sum);

[std_parity,std_line] = find(info_parity_trunc);
std_parity = std_parity - 1;
[IM_info,~]   =size(std_line);
max_line = std_line(end);

std_table = zeros(max_line,dv_max);
CG_table = zeros(max_line,dv_max);
shift_table =  zeros(max_line,dv_max);
q = M/P;
std_table(1,1) = std_parity(1);
shift_table(1,1) = P-uint8(std_parity(1)/ q ); 
CG_table(1,1) = mod(std_parity(1),q ); 

index=1;
for i=2:IM_info
    if std_line(i-1) == std_line(i)
        index=index+1;
    else    
        index=1;
        
    end
   std_table(std_line(i),index) = std_parity(i); 
   
   shift_table(std_line(i),index) = mod( P - (floor((std_parity(i))/ q )), P); 
   CG_table(std_line(i),index) = mod(std_parity(i), q ); 
end

% write matrix

fid = fopen('airbus_matrix.txt','wt');
fprintf(fid,'%g\t\n',N);
fprintf(fid,'%g\t\n',M);
fprintf(fid,'%g\t\n',q);
fprintf(fid,'%g\t%g\t\n',IM_info,dv_max);
for i = 1:size(std_table,1)
    fprintf(fid,'%g\t',std_table(i,:));
    fprintf(fid,'\n');
end
fclose(fid);


%check dc regularity



