Hr = [zeros(1,4), 0.6, ones(1,3)]';
M = 15; 
alpha = (M-1)/2; 
a_kn = zeros(8,alpha); 

x = 0:14;

for k = 0:7
    for n = 0:alpha
        a_kn(k+1,n+1) = 2*cos(((2*pi*k)/M)*(alpha-n));
    end 
end  

h = inv(a_kn)*Hr; 

h(8) = 2*h(8); 
h(9:15) = flip(h(1:7));

figure 
stem(x,h)
grid on 
title('Emmanuel Jesus Estallo')
xlabel('samples')
ylabel('amplitude')

fvtool(h);







