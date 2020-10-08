function [] = Animate(app)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
Thermalexpansion = evalin('base', 'Thermalexpansion'); 
ThermalModel = evalin('base', 'ThermalModel'); 

fig_animate = figure('visible','off');
for t = 1:50:size(Thermalexpansion,2)    
    
   pdeplot(ThermalModel, 'XYData',Thermalexpansion(:,t),'ColorMap','jet')
    pause(0.0001)
    axes_to_be_copied = findobj(fig_animate,'type','axes'); 
    chilred_to_be_copied = get(axes_to_be_copied,'children'); 
%         [az,el] = view; 
    copyobj(chilred_to_be_copied,app.Animate); 
    set(app.Animate,'Xlim',get(axes_to_be_copied,'XLim')); 
    set(app.Animate,'Ylim',get(axes_to_be_copied,'YLim'));
    set(app.Animate,'Zlim',get(axes_to_be_copied,'ZLim')); 
    grad = colorbar(app.Animate);
    colormap(app.Animate, jet);
    
end
  
end

