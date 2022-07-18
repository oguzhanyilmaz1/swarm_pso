function [best_p] = gbest(x,y,population)

best=200;
best_p=[x(1),y(1)];
for i=1:population
    current=obj_function(x(i),y(i));
    %compare current result and best point
    if current<best
        best=current;
        best_p=[x(i),y(i)];
        
    end
end
end