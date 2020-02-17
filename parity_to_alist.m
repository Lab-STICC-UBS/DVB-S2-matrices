[M,N] = size(Parity);
K = N-M;
rate=K/N;

dc = sum(Parity,2);
dv = sum(Parity,1);
dcmax = max(dc);
dvmax = max(dv);

[nlist,~] = find(Parity);
[mlist,~] = find(Parity');

%write in a file named alist.txt
     fileID =fopen('alist.txt','wt');    
      fprintf(fileID,'%d %d \n %d %d \n ',N,M,dvmax,dcmax);
    for i=1:N
        fprintf(fileID,'%d ',dv(i));
    end
    fprintf(fileID,' \n ');
    for i=1:M
        fprintf(fileID,'%d ',dc(i));
    end
    fprintf(fileID,' \n ');
    
    
    k=0;
    for i=1:N
        for j=1:dv(i)
            fprintf(fileID,'%d ',nlist(k + j ));
        end
        k=k+dv(i);
        fprintf(fileID,' \n ');
    end
    
        k=0;
    for i=1:M
        for j=1:dc(i)
            fprintf(fileID,'%d ',mlist(k + j ));
        end
        k=k+dc(i);
        fprintf(fileID,' \n ');
    end

    
      fclose(fileID);  
    