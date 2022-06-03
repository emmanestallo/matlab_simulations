w_c = 0.2*pi; 

M = 61; 
n = 0:1:M-1; 
k = (M-1)/2; 

h_d = (w_c/pi)*sinc(w_c*(n-k));

rect_x = h_d.*rectwin(M)'; 
bartt_x = h_d.*bartlett(M)';
hann_x = h_d.*hanning(M)'; 
hamm_x = h_d.*hamming(M)';
black_x = h_d.*blackman(M)';

out = fvtool(rect_x); 
addfilter(out,bartt_x); 
addfilter(out,hann_x); 
addfilter(out,hamm_x);
addfilter(out,black_x);

legend(out,'Rectangular Window', 'Bartlett Window', 'Hanning Window', 'Hamming Window', 'Blackman Window')