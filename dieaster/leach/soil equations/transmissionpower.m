function [bitrate,Energy_transit_b,Energy_transit_cm,L_path_cm,L_path_b] = transmissionpower(basedistance, aboveground,mean_CMS_distance,moisture,frequency,temperature)

%   Input:
%       prob      cluster size prob
%       spreadfactor       spreading factor of the lora
%       bandwidth       bandwidth setting
%       coderate       code rate 
%       initEnergy  Initial energy of each node
%       transEnergy Enery for transferring of each bit (ETX)
%       recEnergy   Enery for receiving of each bit (ETX)

    [L_ag] = pathloss(aboveground,moisture,frequency,temperature);
    L_path_cm = L_ag;

    [L_ag] = pathloss(mean_CMS_distance,moisture,frequency,temperature);
    L_path_cm_cm = L_ag;
    
    [L_ag] = pathloss(basedistance,moisture,frequency,temperature);
    L_path_b = L_ag;

    antennagain = 2.15;%antenna gain
    cableloss = 10;%calbe loss
    Noisefactor = 6;%noise factor

    sf = 7;
    bw = 125.*1e3;
    cr = 4./5;
    snr = -2.5.*(sf-6)-5;

    bitrate = (bw ./ (2.^sf)) .* (4 ./ (4 + cr));
    Energy_transit_b = 10.* log10(bw) + Noisefactor + snr- 174 - antennagain+ cableloss+ L_path_b;
    Energy_transit_cm = 10.* log10(bw) + Noisefactor + snr- 174 - antennagain+ cableloss+ L_path_cm;
    Energy_transit_cm_cm = 10.* log10(bw) + Noisefactor + snr- 174 - antennagain+ cableloss+ L_path_cm_cm;

end