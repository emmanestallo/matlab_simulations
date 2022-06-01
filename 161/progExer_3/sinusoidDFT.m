N = 200;
n = 0:N-1; 

x = cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18);

fft_x = abs(fft(x,N)); 
deg = linspace(0,2*pi,N);  

phase = angle(fft(x,N)); 

figure 
stem(deg,fft_x)
title('200-point DFT of x')
xlabel('radians per sample') 
ylabel('magnitude')

figure
stem(deg,phase)
title('phase response of the DFT of x')
xlabel('radians per sample') 