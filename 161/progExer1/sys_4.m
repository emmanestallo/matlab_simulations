function y = sys_4(x,L)
    if L == 0 
        b = [1];
        a = [0.5 -0.5];     
    elseif L == 1
        b = [1];
        a = [1 -0.5 -0.5]; 
    else 
        k = L - 1; 
        b = [1]; 
        a = [1 zeros(1,k) -0.5 -0.5]; 
    end
    h = impz(b,a)'; 
    y = conv(h,x); 
    y = y(1:length(x)); 
end 