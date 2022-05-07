function y = sys_2(x)
    i = length(x);
    y = ones(1,i); 
    for n = 1:i 
       if n > 2 
           y(n) = x(n) - 2*y(n-1) - 2*y(n-2);
       elseif n == 2 
           y(n) = x(n) - 2*y(n-1);
       else 
           y(n) = x(n);
       end 
    end
end