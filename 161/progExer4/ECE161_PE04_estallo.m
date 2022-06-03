%% Windowing Method Part 1 
w_c = 0.2;

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

%% Windowing Method Part 2 
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

%% Frequency Sampling Method

Hr = [zeros(1,12), 0.7, ones(1,3)]';
M = 31; 
alpha = (M-1)/2; 
a_kn = zeros(16,alpha); 
x = 0:30;

for k = 0:15
    for n = 0:alpha
        a_kn(k+1,n+1) = 2*cos(((2*pi*k)/M)*(alpha-n));
    end 
end  

h = inv(a_kn)*Hr; 

h(16) = 2*h(16); 
h(17:31) = flip(h(1:15));

figure 
stem(x,h)
grid on 
title('Emmanuel Jesus Estallo')
xlabel('samples')
ylabel('amplitude')

fvtool(h); 

%% IIR Filter 

