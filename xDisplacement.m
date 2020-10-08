function [] = xDisplacement(app,event)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
        Thermalexpansion = evalin('base', 'Thermalexpansion'); 
        ThermalModel = evalin('base', 'ThermalModel'); 
        fig_x = figure('visible','off'); 
          % default time_in = end
        disp(app.time_in)
        model = createpde('structural','static-planestress');
        pdeplot(ThermalModel, 'XYData',Thermalexpansion(:,app.time_in),'ColorMap','jet')
        
        
        axes_to_be_copied_x = findobj(fig_x,'type','axes'); 
        chilred_to_be_copied_x = get(axes_to_be_copied_x,'children'); 
%         [az,el] = view; 
        copyobj(chilred_to_be_copied_x,app.XAxes); 
        set(app.XAxes,'Xlim',get(axes_to_be_copied_x,'XLim')); 
        set(app.XAxes,'Ylim',get(axes_to_be_copied_x,'YLim'));
        set(app.XAxes,'Zlim',get(axes_to_be_copied_x,'ZLim')); 
        app.XAxes.Title.String = 'x-displacement';
        colorbar(app.XAxes)
        colormap(app.XAxes, jet)
end

