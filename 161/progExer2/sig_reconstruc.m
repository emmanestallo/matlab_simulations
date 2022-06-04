fs = 1/8000; 
N = 8000;
t = 0:fs:1-fs;  
w_0 = pi/4000; 
evenSqWave = [zeros(1,3000), ones(1,2000), zeros(1,3000)]; %1 x 8000 array

k = 2000; %fourier coefficients 

exp_matrix_analysis = zeros(k,N);
exp_matrix_synthesis = zeros(k,N); 

for m = 0:k-1 
    for n = 0:N-1
        exp_matrix_analysis(m+1,n+1) = exp(-1i*m*w_0*n); % 10 x 8000 matrix
    end
end

for m = 0:k-1
    for n = 0:N-1
        exp_matrix_synthesis(m+1,n+1) = exp(1i*m*w_0*n); % 10 x 8000 matrix
    end
end

c = exp_matrix_analysis*evenSqWave'*(1/N); %10 x 1 matrix
x = exp_matrix_synthesis'*c;

subplot(2,1,1)
stem(evenSqWave)
title('Original Signal')


subplot(2,1,2)
stem(abs(x))
title(['Reconstructed Signal using ',num2str(k),' Fourier Coefficients']) 

