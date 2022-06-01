t = readtable('demod_out_A_Normal_1.txt', 'ReadVariableNames', false);
t.Properties.VariableNames = {'Time', 'Value'};

time = t.Time; 
val = t.Value; 

val = val/5; 