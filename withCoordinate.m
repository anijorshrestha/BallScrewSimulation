function [] = withCoordinate(app,event)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
        cla(app.GradientCutAxes)
        ThermalModel = evalin('base', 'ThermalModel');
        Tempreture = evalin('base', 'Tempreture');
        Cut_X = app.Cut_X;
        Cut_Y = app.Cut_Y;
        disp(Cut_X);
        disp(Cut_Y);
        node_Cut = findNodes(ThermalModel.Mesh,'nearest',[Cut_X;Cut_Y]);
        fig_withCoordinate = figure('visible','off'); 
        tlist = 1:1:size(Tempreture,2);
        plot(tlist(1:size(Tempreture,2)), Tempreture(node_Cut,:))
        
        axes_to_be_copied_coordinate= findobj(fig_withCoordinate,'type','axes'); 
        chilred_to_be_copied_coordinate = get(axes_to_be_copied_coordinate,'children'); 
        copyobj(chilred_to_be_copied_coordinate,app.GradientCutAxes); 
        set(app.GradientCutAxes,'Xlim',get(axes_to_be_copied_coordinate,'XLim')); 
        set(app.GradientCutAxes,'Ylim',get(axes_to_be_copied_coordinate,'YLim'));
        set(app.GradientCutAxes,'Zlim',get(axes_to_be_copied_coordinate,'ZLim')); 
        app.GradientTemperatureAxes.Title.String = 'Gradient cut with coordinates';
end

