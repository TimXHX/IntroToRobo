clear;
clc;
disp('A Star Path Planing start!!')
map.XYMAX=10; %%��������Ҫ��һ����ͼ�ĳ��Ϳ�
map.start=[1,1];  %��ʼ�� ע������ڵ�ͼ��Χ��
map.goal=[7,8];  %Ŀ��� ע������ڵ�ͼ��Χ��

obstacle=GetBoundary(map);%�õ��߽�����
nObstacle=0;%�ڵ�ͼ���������XX���ϰ���
obstacle=GetObstacle(nObstacle,obstacle,map);%�ϰ���ͱ߽�����
obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%ȫ�������������û��·��
obstacle = [obstacle;5,5;4,6;3,7;5,8;5,9];
%obstacle = [obstacle;1,2;2,1;2,2];%��ҲΪȫ�����������Ҳû��·��
%obstacle = [obstacle;1,3;2,3;3,3;3,2;3,1];%��ҲΪȫ���������Ҳû��·��


%load('obstacle1.mat');
%����������
PlotGrid(map);
hold on;

%�����ϰ���
FillPlot(obstacle,'k');

path=AStar(obstacle,map);%A*�㷨

%����·��
%
if length(path)>=1
    plot(path(:,1),path(:,2),'-c','LineWidth',5);hold on;
end
%}
accuratepath = interplotation(path);