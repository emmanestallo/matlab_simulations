T = 1/220000;
t_i = 1*10^(-3);
b = [-T/(2*t_1) -T/(2*t_1)];
a = [1 -0.999];

freqz(b,a)
zplane(b,a)