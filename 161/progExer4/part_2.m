w_c = 0.2;

M_31 = 31; 
n_31 = 0:1:M_31-1; 
k_31 = (M_31-1)/2; 

h_d31 = (w_c/pi)*sinc(w_c*(n_31-k_31));
hamm31_x = h_d31.*hamming(M_31)';


M_61 = 61; 
n_61 = 0:1:M_61-1; 
k_61 = (M_61-1)/2; 

h_d61 = (w_c/pi)*sinc(w_c*(n_61-k_61));
hamm61_x = h_d61.*hamming(M_61)';


M_121 = 121; 
n_121 = 0:1:M_121-1; 
k_121 = (M_121-1)/2; 

h_d121 = (w_c/pi)*sinc(w_c*(n_121-k_121));
hamm121_x = h_d121.*hamming(M_121)';

out = fvtool(hamm31_x); 
addfilter(out,hamm61_x);
addfilter(out,hamm121_x);

legend(out, 'M = 31', 'M = 61', 'M = 121')