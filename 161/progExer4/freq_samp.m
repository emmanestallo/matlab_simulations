Hr = [zeros(1,12), 0.7, ones(1,3)]';


M = 31; 

alpha = (M-1)/2; 


a_kn = zeros(16,alpha); 

x = 0:30 

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







