x = [1,1.25,1.5,1.75,2,2.25,2.5,2.75,3,4,5,0]; 

N = 12; 
L = 4; 
M = 3; 

n = 0:N-1; 
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