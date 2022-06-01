T = 1/220000; 
ti = 1/1000; 

k = 0.1; 

num = [0 T/ti]; 
denum = [1 -1*k];

freqz(num,denum)