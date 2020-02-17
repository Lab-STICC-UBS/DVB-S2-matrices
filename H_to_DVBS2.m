[CG,VG] = find(H);
[IM,~]   =size(VG);
shift = zeros (IM,1);
for i = 1:IM
    shift(i)=H(CG(i),VG(i));
end
VG_max=max(VG);
dv_max=4;
shift_array = zeros(VG_max,dv_max);
CG_array = zeros(VG_max,dv_max);
index = 1;
for i=1:IM-1
    if VG(i) == VG(i+1)
        shift_array(index, VG(i) )=shift(i);
        CG_array(index, VG(i) )=CG(i);
        index = index+1;
    else
       shift_array(index, VG(i) )=shift(i); 
       CG_array(index, VG(i) )=CG(i);
       index=1;
        
    end
   
   
end
