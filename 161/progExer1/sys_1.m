function y = sys_1(x)
   i = length(x);
   y = ones(1,i);
   for n = 1:i 
       if n > 1
           y(n) = 0.5*x(n) + 0.5*x(n-1); 
       else 
           y(n) = 0.5*x(n);
       end    
   end
end