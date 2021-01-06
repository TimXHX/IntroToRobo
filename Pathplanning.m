
clc;
close all;
disp('A Star Path Planing start!!')
d=0.235; %两轮间距
map.XYMAX=6; %%代表我们要画一个地图的长和宽
map.start=[1,1];  %起始点 注意必须在地图范围内
map.goal=[6,5];  %目标点 注意必须在地图范围内

obstacle=GetBoundary(map);%得到边界数据
nObstacle=0;%在地图中随机加入XX个障碍物
obstacle=GetObstacle(nObstacle,obstacle,map);%障碍物和边界坐标
% obstacle = [obstacle;4,1; 4,2; 4,3; 4,4; 3,4 ;2,4;];%全封死的情况，是没有路的
obstacle=[obstacle;3,2;4,3;5,1;2,5;3,5];
% obstacle = [obstacle;5,5;4,6;3,7;5,8;5,9];
%obstacle = [obstacle;1,2;2,1;2,2];%此也为全封死的情况，也没有路的
%obstacle = [obstacle;1,3;2,3;3,3;3,2;3,1];%此也为全封死情况，也没有路的


%load('obstacle1.mat');
%画出网格线
PlotGrid(map);
hold on;

%画出障碍点
FillPlot(obstacle,'k');

path=AStar(obstacle,map);%A*算法

%画出路径
%
if length(path)>=1
    plot(path(:,1),path(:,2),'-c','LineWidth',5);hold on;
end
%}
%accuratepath = interplotation(path);
%size_acc= size(accuratepath);
accuratepath = 0.56*interplotation(path)-0.28;
% =[ accuratepath ;[2.52000000000000,2.52000000000000]; [2.52000000000000,2.52000000000000]];