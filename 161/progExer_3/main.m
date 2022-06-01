%% Computing the DFT of a Sinusoid Part 2
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

%% Direct Approach 
rootsOfUnity = [zeros(1000,1000)]; 

tic()
for a = 0:999 
    for b = 0:999
        rootsOfUnity(a+1,b+1) = exp(-1i*2*pi*(a*b)/1000); 
    end 
end   


n = 0:999; 
x = (cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18))';

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









