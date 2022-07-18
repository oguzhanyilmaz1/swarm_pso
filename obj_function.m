function [obj_fnc] = obj_function(x,y)
%defining objective function
obj_fnc=(4-2.1*x^2+x^4/3)*x^2+x*y+(4*y^2-4)*y^2;
end