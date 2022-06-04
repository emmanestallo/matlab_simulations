%% Fourier Transform 

fs = 1/8000; 
N = 8000;
t = 0:fs:1-fs;  
w_0 = pi/4000; 
evenSqWave = [zeros(1,3000), ones(1,2000), zeros(1,3000)]; %1 x 8000 array

k = 10; %fourier coefficients 

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


mag = abs(c)'; 
phase = angle(c)'; 

err_ = evenSqWave - abs(x)'; 
mse = mean(err_.^2);

figure
subplot(2,1,1)
stem(0:k-1,mag)
title('First 10 values of c') 
xlabel('c_k')
ylabel('magnitude')

subplot(2,1,2)
stem(0:k-1,phase)
title('Angle (c)')
xlabel('c_k')
ylabel('phase')

figure
subplot(2,1,1)
stem(abs(x))
title(['Reconstructed Signal using ',num2str(k),' Fourier Coefficients']) 

subplot(2,1,2)
stem(evenSqWave)
title('Original Signal')

%% Impulse response

N = 20; 

vect = 0:19;

num_1 = [0 0 1]; 
den_1 = [9 -3]; 

num_2 = 1;
den_2 = [0.9^3 -0.9^4]; 

[h1, x1] = impz(num_1, den_1, N); 
[h2, x2] = impz(num_2, den_2, N); 

h = h1 + h2; 

stem(vect,h) 

%% Residue 

num = [1 -1 -4 4]; 
denum = [1 -11/4 13/8 -1/4];
z,p,k = residuez(num,denum);


