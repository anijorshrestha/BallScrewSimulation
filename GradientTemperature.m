function [] = GradientTemperature(app,event)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%         Parameters = evalin('base', 'Parameters');  
%         Initial = evalin('base', 'Initial');  
        ThermalModel = evalin('base', 'ThermalModel'); 
        ThermalGradian = evalin('base', 'ThermalGradian'); 
%         ThermalStressResult = evalin('base', 'ThermalStressResult'); 
%         Thermalexpansion = evalin('base', 'Thermalexpansion'); 
        Tempreture = evalin('base', 'Tempreture'); 
%         F_preload = evalin('base', 'F_preload'); 
        
        fig_grad = figure('visible','off'); 
        Nf_right = findNodes(ThermalModel.Mesh,'region','Edge',1);
        Nf_up = findNodes(ThermalModel.Mesh,'region','Edge',8);
        Nf_left = findNodes(ThermalModel.Mesh,'region','Edge',20);
        [qx,qy] = evaluateHeatFlux(ThermalGradian);
        
        pdeplot(ThermalModel,'XYData',Tempreture(:,end), ...
                             'Contour','on',...
                             'FlowData',[qx(:,end),qy(:,end)], ...
                             'ColorMap','jet')
      
        
        axes_to_be_copied_grad = findobj(fig_grad,'type','axes'); 
        chilred_to_be_copied_grad = get(axes_to_be_copied_grad,'children'); 
%         [az,el] = view; 
        copyobj(chilred_to_be_copied_grad,app.GradientTemperatureAxes); 
        set(app.GradientTemperatureAxes,'Xlim',get(axes_to_be_copied_grad,'XLim')); 
        set(app.GradientTemperatureAxes,'Ylim',get(axes_to_be_copied_grad,'YLim'));
        set(app.GradientTemperatureAxes,'Zlim',get(axes_to_be_copied_grad,'ZLim')); 
        app.GradientTemperatureAxes.Title.String = 'Temperature Distribution and Heat Flux';
        grad = colorbar(app.GradientTemperatureAxes);
        colormap(app.GradientTemperatureAxes, jet);
        
       
       
    
end

