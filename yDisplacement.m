function [] = yDisplacement(app,event)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

        ThermalModel = evalin('base', 'ThermalModel'); 
        ThermalStressResult = evalin('base', 'ThermalStressResult'); 
        fig_y = figure('visible','off');
        pdeplot(ThermalModel, 'XYData',ThermalStressResult.Displacement.uy,'ColorMap','jet')
      
        
        axes_to_be_copied_y = findobj(fig_y,'type','axes'); 
        chilred_to_be_copied_y = get(axes_to_be_copied_y,'children'); 
%         [az,el] = view; 
        copyobj(chilred_to_be_copied_y,app.YAxes); 
        set(app.YAxes,'Xlim',get(axes_to_be_copied_y,'XLim')); 
        set(app.YAxes,'Ylim',get(axes_to_be_copied_y,'YLim'));
        app.YAxes.Title.String = 'y-displacement';
        colorbar(app.YAxes)
        colormap(app.YAxes, jet)
end

