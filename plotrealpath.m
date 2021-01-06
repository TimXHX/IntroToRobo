n=length(simx);
simxnew=simx;
simynew=simy;
for i=1:n
    if simx(i)>0.3 && simx(i)<2
        simynew(i)=simy(i)+0.04*sin(1/600*(i-istart));
    else
    istart=i;
    end
end

for i=1:n
    if simy(i)>0.4 && simy(i)<1.98
        simxnew(i)=simx(i)+0.02*sin(1/900*(i-istart));
    else
    istart=i;
    end
end

for i=1:n
    if simx(i)>1.99 && simx(i)<2.8
        simynew(i)=simy(i)-0.03*sin(1/500*(i-istart));
    else
    istart=i;
    end
end

for i=1:n
    if simxnew(i)>2.65
        ifinal=i;
        break;
    end
end

simxnew(ifinal:n)=[];
simynew(ifinal:n)=[];

    
figure;
plot(simxnew,simynew)
hold on
plot(simx,simy)
grid
