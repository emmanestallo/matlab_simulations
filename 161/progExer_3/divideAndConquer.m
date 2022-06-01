N = 100; 

L = 10; 
M = 10; 

n = 0:N-1; 
x = cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18); 
y = reshape(x,L,M);  

deg = linspace(0,2*pi,N); 

W_mq = zeros(M,M);
for a = 0:M-1
    for b = 0:M-1
        W_mq(a+1,b+1) = exp(-1i*2*pi*(a*b)/M);
    end
end 

W_lq = zeros(L,M);
for a = 0:L-1
    for b = 0:M-1
        W_lq(a+1,b+1) = exp(-1i*2*pi*(a*b)/(L*M));
    end
end

W_lp = zeros(L,L);
for a = 0:L-1
    for b = 0:L-1
        W_lp(a+1,b+1) = exp(-1i*2*pi*(a*b)/L);
    end
end

tic()
DFT = W_lp*((y*W_mq).*W_lq);  
final_DFT = reshape(DFT',N,1); 
toc() 

tic()
f = fft(x); 
toc()

phase = reshape(angle(DFT)',N,1); 

figure 
stem(deg,abs(final_DFT))
title('1000-point DFT of x')
xlabel('radians per sample') 
ylabel('magnitude')

figure
stem(deg,phase)
title('phase response of the DFT of x')
xlabel('radians per sample')




