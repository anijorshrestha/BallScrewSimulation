% % 
close all
load('P:\Desktop\Sim_Bosch_1800_1500S.mat')
Initial = Data.Initial;
Parameters = Data.Parameters;
ThermalGradian = Data.ThermalGradian;
ThermalModel = Data.ThermalModel;
ThermalStressResult = Data.ThermalStressResult;
Thermalexpansion = Data.Thermalexpansion;
Tempreture = Data.Tempreture;
F_preload = Data.F_preload;

% clear Data
% 
% plot Mesh and intersect point
% Basic = createpde;
% Basic.geometryFromMesh(Parameters.Point2D.Points', Parameters.Point2D.ConnectivityList');
% for k = 1:Initial.revolutions
% N_ID(k,1) = findNodes(Basic.Mesh,'nearest',[Parameters.EndPointRadius(1,k);Parameters.EndPointRadius(2,k)]);
% En(k,:) = findElements(Basic.Mesh,'radius',[Parameters.EndPointRadius(1,k) Parameters.EndPointRadius(2,k)],Initial.meshSize);
% end
% figure 
% pdegplot(ThermalModel,'EdgeLabels','on')
% % 
% pdemesh(ThermalModel) 
% hold on
% plot(Basic.Mesh.Nodes(1,N_ID),Basic.Mesh.Nodes(2,N_ID),'ok','MarkerFaceColor','g')
% pdemesh(Basic.Mesh.Nodes,Basic.Mesh.Elements(:,En),'EdgeColor','blue')
% title('Mesh with Triangular Elements')
% 
% 
% % Gradian Tempereture after loop
% figure 
% Nf_right = findNodes(ThermalModel.Mesh,'region','Edge',1);
% Nf_up = findNodes(ThermalModel.Mesh,'region','Edge',8);
% Nf_left = findNodes(ThermalModel.Mesh,'region','Edge',20);
% [qx,qy] = evaluateHeatFlux(ThermalGradian);
% 
% pdeplot(ThermalModel,'XYData',Tempreture(:,end), ...
%                      'Contour','on',...
%                      'FlowData',[qx(:,end),qy(:,end)], ...
%                      'ColorMap','jet')
% 
% title('Temperature Distribution and Heat Flux')
% % % with ginput
% [x,y] = ginput(1);
% node_Cut = findNodes(ThermalModel.Mesh,'nearest',[x;y]);
% figure
% tlist = 1:1:size(Tempreture,2);
% plot(tlist(1:size(Tempreture,2)), Tempreture(node_Cut,:))
%with coordinate
% Cut_X = 50;
% Cut_Y = 5;
% node_Cut = findNodes(ThermalModel.Mesh,'nearest',[Cut_X;Cut_Y]);
% figure
% tlist = 1:1:size(Tempreture,2);
% plot(tlist(1:size(Tempreture,2)), Tempreture(node_Cut,:))

% f=figure
% time_in = 5;  % default time_in = end
% model = createpde('structural','static-planestress');
% pdeplot(ThermalModel, 'XYData',Thermalexpansion(:,time_in),'ColorMap','jet')
% title('x-displacement')
% 
% b=figure
% pdeplot(ThermalModel, 'XYData',ThermalStressResult.Displacement.uy,'ColorMap','jet')
% title('y-displacement')

figure
for t = 1:50:size(Thermalexpansion,2)    
    
   pdeplot(ThermalModel, 'XYData',Thermalexpansion(:,t),'ColorMap','jet')
    pause(0.2)
end
% 
% figure 
% plot(F_preload)
% 
% 
