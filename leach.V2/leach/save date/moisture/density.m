% Get coefficients of a line fit through the data.
% coefficients = polyfit(x_ori, z_spare2_ori, 4);
% coefficients2 = polyfit(x2, double(z_spare2), 6);

% Create a new x axis with exactly 1000 points (or whatever you want).
% xFit = linspace(min(x_ori), max(x_ori), 2000);
% xFit2 = linspace(min(x2), max(x2), 2000);

% Get the estimated yFit value for each of those 1000 new x locations.
% yFit = polyval(coefficients , xFit);
% yFit2 = polyval(coefficients2 , xFit2);

% Plot everything.
% plot(x,z_spare2,'-o'); % Plot training data.
% hold on;

% hold on;
% plot(x2, double(z_spare2), 'y.', 'MarkerSize', 15); % Plot training data.
plot(x_ori, z_spare2_ori, 'k-', 'LineWidth', 2); % Plot fitted line.

hold on;
plot(x, z_spare2_15, 'b-', 'LineWidth', 2); % Plot fitted line.

hold on;
plot(x_ori, z_spare2_45new, 'r-', 'LineWidth', 2); % Plot fitted line.

hold on;
plot(x_ori, z_spare2_55, 'g-', 'LineWidth', 2); % Plot fitted line.

% hold on;
% plot(x_m3, z_spare3_m3, 'g-', 'LineWidth', 2); % Plot fitted line.
% % 
% hold on; % Set hold on so the next plot does not blow away the one we just drew.
% plot(x, z_spare2_25, 'b-', 'LineWidth', 2); % Plot fitted line.
grid on;

legend('Moisture range: 0.05-0.25','Moisture range: 0.15-0.35','Moisture range: 0.25-0.45','Moisture range: 0.35-0.55')
    
% Create xlabel
xlabel('Number of Iteration','FontWeight','bold','FontSize',11,'FontName','Cambria');
xlim([0 1000])

% Create ylabel
ylabel('Cluster size','FontWeight','bold','FontSize',11,...
    'FontName','Cambria');
ylim([10 50])