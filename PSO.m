%Defining parameters
population=50;
c1=1.5;
c2=2;

%Defining initial position matrix and initial velocity matrix
x=zeros(population,1);
y=zeros(population,1);
vi=zeros(population,2);

for i=1:population
    %Giving random initial states to agents in bounded regions 
    %(-3,3)-->x
    %(-2,2)-->y
    x(i)=random(3);
    y(i)=random(2);
end
%Defining individual best points that will be updated 
p_best=[x,y];

for i=1:1000
    %Finding global best point
    g_best=gbest(x,y,population);
    for k=1:population
        
        %getting current objection function result
        z=obj_function(x(k),y(k));
        
        %getting velocity reult for each step
        vel=velocity(vi(1,:),c1,c2,p_best(1,:),[x(k) y(k)],g_best);
        
        %updated positions
        x_new=x(k)+vel(1);
        y_new=y(k)+vel(2);
        
        %testing new position is better or not
        z_current=obj_function(x_new,y_new);
        
        %if it is better position updating
        if (z_current<z) && (x_new<3) && (x_new>-3)&& (y_new<2) && (y_new>-2)
         vi(k,1)=vel(1);
         vi(k,2)=vel(2);
         x(k)=x(k)+vel(1);
         y(k)=y(k)+vel(2);
         p_best(k,1)=x(k);
         p_best(k,2)=y(k);
         
        %if  x and y bounds are exceeded velocity is reversed
        elseif (z_current<z)
            if (x_new>3)||(x_new<-3)
                vi(k,1)=-vel(1);
            end
            if (y_new>2)||(y_new<-2)
                vi(k,1)=-vel(2);   
            end
        end
    
    end
end
disp("Globally minimum point coordinates: ("+g_best(1)+","+g_best(2)+")")
result=obj_function(g_best(1),g_best(2));
disp("Globally minimum point's result:"+result)
disp("Swarm center:("+mean(x)+","+mean(y)+")")
