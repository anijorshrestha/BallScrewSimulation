function [] = PlotMesh(app,event)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        Parameters = evalin('base', 'Parameters');  
        Initial = evalin('base', 'Initial');  
        ThermalModel = evalin('base', 'ThermalModel'); 
%         ThermalGradian = evalin('base', 'ThermalGradian'); 
%         ThermalStressResult = evalin('base', 'ThermalStressResult'); 
%         Thermalexpansion = evalin('base', 'Thermalexpansion'); 
%         Tempreture = evalin('base', 'Tempreture'); 
%         F_preload = evalin('base', 'F_preload'); 
        
        fig_mesh = figure('visible','off');
        Basic = createpde;
        Basic.geometryFromMesh(Parameters.Point2D.Points', Parameters.Point2D.ConnectivityList');
        for k = 1:Initial.revolutions
        N_ID(k,1) = findNodes(Basic.Mesh,'nearest',[Parameters.EndPointRadius(1,k);Parameters.EndPointRadius(2,k)]);
        En(k,:) = findElements(Basic.Mesh,'radius',[Parameters.EndPointRadius(1,k) Parameters.EndPointRadius(2,k)],Initial.meshSize);
        end
        pdegplot(ThermalModel,'EdgeLabels','on')
        pdemesh(ThermalModel) 
        hold on
        plot(Basic.Mesh.Nodes(1,N_ID),Basic.Mesh.Nodes(2,N_ID),'ok','MarkerFaceColor','g')
        pdemesh(Basic.Mesh.Nodes,Basic.Mesh.Elements(:,En),'EdgeColor','blue')
        
        
        axes_to_be_copied = findobj(fig_mesh,'type','axes'); 
        chilred_to_be_copied = get(axes_to_be_copied,'children'); 
%         [az,el] = view; 
        copyobj(chilred_to_be_copied,app.MeshInteractionAxes); 
        set(app.MeshInteractionAxes,'Xlim',get(axes_to_be_copied,'XLim')); 
        set(app.MeshInteractionAxes,'Ylim',get(axes_to_be_copied,'YLim'));
        set(app.MeshInteractionAxes,'Zlim',get(axes_to_be_copied,'ZLim')); 
        app.MeshInteractionAxes.Title.String = 'Mesh with Triangular Elements';
end

