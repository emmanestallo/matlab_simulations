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

stem(deg,phase)