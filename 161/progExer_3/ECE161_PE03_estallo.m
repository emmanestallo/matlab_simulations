%%Computing the DFT of a Sinusoid Part 1 

N = 50;
zero_pad = 50; 
n = 0:N-1; 

x = [cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18), zeros(1,zero_pad)];

fft_x = abs(fft(x,N+zero_pad)); 
deg = linspace(0,2*pi,N+zero_pad);  

phase = angle(fft(x,N+zero_pad)); 

figure 
stem(deg,fft_x)
title('N-point DFT of x with zero-padding')
xlabel('radians per sample') 
ylabel('magnitude')

figure
stem(deg,phase)
title('phase response of the DFT of x')
xlabel('radians per sample')


%% Computing the DFT of a Sinusoid Part 2
N = 200;
n = 0:N-1; 

x = cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18);

fft_x = abs(fft(x,N)); 
deg = linspace(0,2*pi,N);  

phase = angle(fft(x,N)); 

figure 
stem(deg,fft_x)
title('N-point DFT of x')
xlabel('radians per sample') 
ylabel('magnitude')

figure
stem(deg,phase)
title('phase response of the DFT of x')
xlabel('radians per sample')

%% Direct Approach 
rootsOfUnity = [zeros(1000,1000)]; 


for a = 0:999 
    for b = 0:999
        rootsOfUnity(a+1,b+1) = exp(-1i*2*pi*(a*b)/1000); 
    end 
end   


n = 0:999; 
x = (cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18))';

tic()
X = abs(rootsOfUnity*x);  
phase = angle(rootsOfUnity*x);
toc()  

deg = linspace(0,2*pi,1000);  

figure 
stem(deg,X) 
title('1000-point DFT via Direct Approach') 
xlabel('radians per sample') 
ylabel('magnitude') 

figure 
stem(deg,phase)
title('phase response of X')
xlabel('radians per sample')
ylabel('phase')

%% Divide-and-Conquer 

N = 1000; 

L = 50; 
M = 20; 

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

phase = reshape(angle(DFT)',N,1); 

figure 
stem(deg,abs(final_DFT))
title('1000-point DFT via Divide-and-Conquer')
xlabel('radians per sample') 
ylabel('magnitude')

figure
stem(deg,phase)
title('phase response of X')
xlabel('radians per sample')








