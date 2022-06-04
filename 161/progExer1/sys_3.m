function y = sys_3(x)
    b = [1.5 0.5];
    a = [1 2 2]; 
    h = impz(b,a)'; 
    y = conv(h,x); 
    y = y(1:length(x)); 
end 