N = 1000; 

L = 100; 
M = 10; 

n = 0:N-1; 
x = cos((1394/4000)*pi*n + pi/4) + sin((2418/4000)*pi*n + pi/18); 
y = reshape(x,L,M);  
