%%Create dummy figures for demonstration and save them in current folder 
% The first figure does not contain a legend
% f = figure; 
% surf(peaks) 
% hgsave(f,'test.fig') 
% close(f) 
% % The second figure contains a legeng and requires slightly different
% % treatment
% f = figure; 
% t = 0:pi/50:10*pi; 
% plot(t, sin(t));
% legend(gca, 'sinx')
% hgsave(f,'two.fig') 
% close(f) 
%%New figure 
f = figure; 
a1 = subplot(2,1,1); 
% a2 = subplot(2,1,2); 
%%Copy first existing figure on first subplot 
% Open exiting figure 
f_c = openfig('test.fig'); 
% Identify axes to be copied 
axes_to_be_copied = findobj(f_c,'type','axes'); 
% Identify the children of this axes 
chilred_to_be_copied = get(axes_to_be_copied,'children'); 
% Identify orientation of the axes 
[az,el] = view; 
% Copy the children of the axes 
copyobj(chilred_to_be_copied,a1); 
% Set the limits and orientation of the subplot as the original figure 
set(a1,'Xlim',get(axes_to_be_copied,'XLim')) 
set(a1,'Ylim',get(axes_to_be_copied,'YLim')) 
set(a1,'Zlim',get(axes_to_be_copied,'ZLim')) 
view(a1,[az,el]) 
% One may set other properties such as labels, ticks etc. using the same 
% idea 
% Close the figure 
close(f_c); 
