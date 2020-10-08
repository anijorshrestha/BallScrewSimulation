function [] = importFile(app,event)
%IMPORT Summary of this function goes here
%   Detailed explanation goes here
    [filename, pathname] = uigetfile('*.mat');
    completename = (fullfile(pathname, filename));
%     str = "'";
%     test = str + completename + str;
        
%    Data = uigetfile();    assignin('base','Data',completename);
 
   Data = sprintf('load(''%s'')', completename);
   Data = evalin('base', Data);
   Initial = Data.Data.Initial;
   assignin('base','Initial',Initial)
   Parameters =  Data.Data.Parameters;
   assignin('base','Parameters',Parameters)
   ThermalGradian =  Data.Data.ThermalGradian;
   assignin('base','ThermalGradian',ThermalGradian)
   ThermalModel =  Data.Data.ThermalModel;
   assignin('base','ThermalModel',ThermalModel)
   ThermalStressResult =  Data.Data.ThermalStressResult;
   assignin('base','ThermalStressResult',ThermalStressResult)
   Thermalexpansion =  Data.Data.Thermalexpansion;
   assignin('base','Thermalexpansion',Thermalexpansion)
   Tempreture =  Data.Data.Tempreture;
   assignin('base','Tempreture',Tempreture)
   F_preload =  Data.Data.F_preload;
   assignin('base','F_preload',F_preload);
   
   app.SelectButton.Visible = 'off';
   app.FileName.Visible = 'on';
   set(app.FileName, 'Text',filename);

end

