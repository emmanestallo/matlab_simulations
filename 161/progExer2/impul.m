N = 20; 

vect = 0:19

num_1 = [0 0 1]; 
den_1 = [9 -3]; 

num_2 = 1;
den_2 = [0.9^3 -0.9^4]; 

[h1, x1] = impz(num_1, den_1, N); 
[h2, x2] = impz(num_2, den_2, N); 

h = h1 + h2; 

stem(vect,h) 