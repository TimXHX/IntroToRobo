function accuratepath = interplotation(path)
%对path进行插值，并交换顺序为从起点到终点

%交换顺序为起点到终点
sizeofpath=size(path);
n=sizeofpath(1);
pathfromstartpoint=[];
for i=n:-1:1
    pathfromstartpoint=[pathfromstartpoint;path(i,:)];
end


%插值
accu=1; %在相邻两个栅格中心间插入accu个点（插值精度）
accuratepath=pathfromstartpoint(1,:); %插值后的路径,先放入起点
iaccu=1; %表示accuratepath当前行号

for i=1:n-1;
    
    if pathfromstartpoint(i,1)==pathfromstartpoint(i+1,1) %竖着走
        
        deltay=(pathfromstartpoint(i+1,2)-pathfromstartpoint(i,2))/(accu+1);
        while accuratepath(iaccu,2)~=pathfromstartpoint(i+1,2)
            accuratepath=[accuratepath;accuratepath(iaccu,1),accuratepath(iaccu,2)+deltay];
            iaccu=iaccu+1;
        end
        
    else %横着走
        
        deltax=(pathfromstartpoint(i+1,1)-pathfromstartpoint(i,1))/(accu+1);
        while accuratepath(iaccu,1)~=pathfromstartpoint(i+1,1)
            accuratepath=[accuratepath;accuratepath(iaccu,1)+deltax,accuratepath(iaccu,2)];
            iaccu=iaccu+1;
        end
        
    end
    
end


end


% function accuratepath = interplotation(path)
% %对path进行插值，并交换顺序为从起点到终点
% 
% %交换顺序为起点到终点
% sizeofpath=size(path);
% n=sizeofpath(1);
% pathfromstartpoint=[];
% for i=n:-1:1
%     pathfromstartpoint=[pathfromstartpoint;path(i,:)];
% end
% 
% %插值
% accu=1; %在相邻两个栅格中心间插入accu个点（插值精度）
% accuratepath=[]; %插值后的路径
% iaccu=1; %表示accuratepath当前行号
% 
% for i=1:n-1;
%     
%     if pathfromstartpoint(i,1)==pathfromstartpoint(i+1,1) %竖着走
%         
% %         deltay=(pathfromstartpoint(i+1,2)-pathfromstartpoint(i,2))/(accu+1);
% %         while accuratepath(iaccu,2)~=pathfromstartpoint(i+1,2)
% %             accuratepath=[accuratepath;accuratepath(iaccu,1),accuratepath(iaccu,2)+deltay];
% %             iaccu=iaccu+1;
% %         end
%          for j=1:accu+2
%              a=interp1([1,accu+2],[pathfromstartpoint(i,2),pathfromstartpoint(i+1,2)],j,'linear');
%              accuratepath=[accuratepath;path(i,1),interp1([1,accu+2],[pathfromstartpoint(i,2),pathfromstartpoint(i+1,2)],j,'linear')];
%              iaccu=iaccu+1;
%          end
%           
%         
%     else %横着走
%         
% %         deltax=(pathfromstartpoint(i+1,1)-pathfromstartpoint(i,1))/(accu+1);
% %         while accuratepath(iaccu,1)~=pathfromstartpoint(i+1,1)
% %             accuratepath=[accuratepath;accuratepath(iaccu,1)+deltax,accuratepath(iaccu,2)];
% %             iaccu=iaccu+1;
% %         end
%         for j=1:accu+2
%              accuratepath=[accuratepath;interp1([1,accu+2],[pathfromstartpoint(i,1),pathfromstartpoint(i+1,1)],j,'linear');path(i,2)];
%              iaccu=iaccu+1;
%          end
%     end
%     
% end
% 
% 
% end
% 
% 
