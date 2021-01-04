% function accuratepath = interplotation(path)
% %��path���в�ֵ��������˳��Ϊ����㵽�յ�
% 
% %����˳��Ϊ��㵽�յ�
% sizeofpath=size(path);
% n=sizeofpath(1);
% pathfromstartpoint=[];
% for i=n:-1:1
%     pathfromstartpoint=[pathfromstartpoint;path(i,:)];
% end
% 
% 
% %��ֵ
% accu=7; %����������դ�����ļ����accu���㣨��ֵ���ȣ�
% accuratepath=pathfromstartpoint(1,:); %��ֵ���·��,�ȷ������
% iaccu=1; %��ʾaccuratepath��ǰ�к�
% 
% for i=1:n-1;
%     
%     if pathfromstartpoint(i,1)==pathfromstartpoint(i+1,1) %������
%         
%         deltay=(pathfromstartpoint(i+1,2)-pathfromstartpoint(i,2))/(accu+1);
%         while accuratepath(iaccu,2)~=pathfromstartpoint(i+1,2)
%             accuratepath=[accuratepath;accuratepath(iaccu,1),accuratepath(iaccu,2)+deltay];
%             iaccu=iaccu+1;
%         end
%         
%     else %������
%         
%         deltax=(pathfromstartpoint(i+1,1)-pathfromstartpoint(i,1))/(accu+1);
%         while accuratepath(iaccu,1)~=pathfromstartpoint(i+1,1)
%             accuratepath=[accuratepath;accuratepath(iaccu,1)+deltax,accuratepath(iaccu,2)];
%             iaccu=iaccu+1;
%         end
%         
%     end
%     
% end
% 
% 
% end


function accuratepath = interplotation(path)
%����˳��Ϊ����㵽�յ㲢���в�ֵ

%����˳��Ϊ��㵽�յ�
sizeofpath=size(path);
n=sizeofpath(1);
pathfromstartpoint=[];
for i=n:-1:1
    pathfromstartpoint=[pathfromstartpoint;path(i,:)];
end

%��ֵ
insertnum=30; %����������դ�����ļ����insertnum����,������ֵ����
accuratepath=[]; %��ֵ���·��
iaccu=1; %��ʾaccuratepath��ǰ�к�

for i=1:n-1;
    
    if pathfromstartpoint(i,1)==pathfromstartpoint(i+1,1) %������
   
         for j=1:insertnum+2
             accuratepath=[accuratepath;pathfromstartpoint(i,1),interp1([1,insertnum+2],[pathfromstartpoint(i,2),pathfromstartpoint(i+1,2)],j,'linear')];
             iaccu=iaccu+1;
         end
          
        
    else %������
        
        for j=1:insertnum+2
             accuratepath=[accuratepath;interp1([1,insertnum+2],[pathfromstartpoint(i,1),pathfromstartpoint(i+1,1)],j,'linear'),pathfromstartpoint(i,2)];
             iaccu=iaccu+1;
         end
    end
    
end


end


