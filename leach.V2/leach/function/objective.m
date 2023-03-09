
x=2:1:50;
z=2:1:50;
lamuda1 = 0.08;
lamuda2 = 0.09;

step_size = 0.07;
delta = 1e-3;



%     theta_old = theta(index);
xmin=0.05;  %minimum moisture lv
xmax=0.25;   %max moisture lv
n=20;
x=xmin+rand(1,n)*(xmax-xmin);

theta = x(randi([1,n]));

%     fprintf('theta is: %d\n',theta(index));

max_clustersize = 50;
interference = 1;
density1=4.5;

syms x z

underground_cluster = sqrt(x./4./(density1)).*0.05;
aboveground_cluster = sqrt(x./4./(density1)).*0.95;
basedistance =  sqrt(x./4./(density1))+sqrt(x./4./(density1)) ;

addpath 'soil equations'
[bitrate,Energy_transit_b,Energy_transit_cm] = transmissionpower(basedistance,underground_cluster, aboveground_cluster,theta,868);

Energy_transfer_ch= (10.^(Energy_transit_b./10).*1e-3)*0.0000001;
Energy_transfer_cm = (10.^(Energy_transit_cm./10).*1e-3)*0.0000001;
Energy_receive = 50*0.000000001;
energy_system = 50*0.0000001;

brmax = bitrate;
ctrPacketLength = 32.*8; %12-256 bytes
packetLength = 32.*8;

Energy_init = 50;
    


% PL(x) = (((0.5.*1e3./x)./(1.024)-8-4.25)./(4 + 4./5).*(7-2).*4+20-16-28+4.*7);
% PL_diff(x) = diff(PL(x));
% br = (125.*1e3 ./ (2.^7)) .* (4 ./ (4 + 4./5));

L_expect(x) = Energy_init ./ ( ( (x-1) ) .*(Energy_receive+Energy_transfer_cm).* packetLength ./ brmax+...
        ctrPacketLength.*Energy_transfer_ch./ ( brmax));
L_expectdiff(x) = diff(L_expect(x));

x=4:1:100;

plot(x,L_expect(x));

xlabel('Cluster size','FontWeight','bold','FontSize',11,'FontName','Cambria');
        
% Create ylabel
ylabel('Expect lifetime','FontWeight','bold','FontSize',11,...
    'FontName','Cambria');

% Create title
title('Expect lifetime vs. Number of cluster members','FontWeight','bold','FontSize',12,...
    'FontName','Cambria');