
result=real_trajory.signals.values;
size_result=size(result);

 figure(1);
for i = 1:size_result(1)
   
    clf;
    
    plot_x=result(i,1);
    plot_y=result(i,2);
    
    for L=0:0.1:0.5
        plot_x=[plot_x;result(i,1)+L*cos( result(i,3) ) ];
        plot_y=[plot_y;result(i,2)+L*sin( result(i,3) ) ];
        
    end
    
    plot(plot_x,plot_y);
    axis([-10,10,-10,10]);
    pause(0.5);
    
end
