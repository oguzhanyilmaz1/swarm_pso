function [vel] = velocity(vi,c1,c2,p_best,p,g_best)
%defining velocity function
vel_x=vi(1)+rand(1)*c1*(p_best(1)-p(1))+rand(1)*c2*(g_best(1)-p(1));
vel_y=vi(2)+rand(1)*c1*(p_best(2)-p(2))+rand(1)*c2*(g_best(2)-p(2));
vel=[vel_x vel_y];
end