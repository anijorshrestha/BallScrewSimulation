function  mouseClick(~,~)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
cp=get(app.GradientTemperatureAxes,'CurrentPoint');
xline(app.GradientTemperatureAxes,cp(1,1));

end

