clear all; clc

data_MI = xlsread('project_data_set_MI.xlsx');
data_CA = xlsread('project_data_set_CA.xlsx');

leng1 = length(data_MI);
leng2 = length(data_CA);
i = 1;

%% each county corona daily increase from 20200310 to 20200430
while i < leng1
    wayne_corona_dayily_increase(i) = data_MI(i+1,1) - data_MI(i,1);
    oak_corona_dayily_increase(i) = data_MI(i+1,2) - data_MI(i,2);
    mac_corona_dayily_increase(i) = data_MI(i+1,3) - data_MI(i,3);
    gene_corona_dayily_increase(i) = data_MI(i+1,4) - data_MI(i,4);
    wash_corona_dayily_increase(i) = data_MI(i+1,5) - data_MI(i,5);
 
    sc_corona_dayily_increase(i) = data_CA(i+1,2) - data_CA(i,2);
    sb_corona_dayily_increase(i) = data_CA(i+1,1) - data_CA(i,1);

    i = i + 1;
end

%% Tmax from 20200226 to 20200416 (2weeks earier that corona data)
wayne_Tmax = data_MI(:,8);
oak_Tmax = data_MI(:,12);
mac_Tmax = data_MI(:,15);
gene_Tmax = data_MI(:,19);
wash_Tmax = data_MI(:,23);

sb_Tmax = data_CA(:,5);
sc_Tmax = data_CA(:,9);

i = 1;
while i < leng1
    wayne_tmax_vari(i) = wayne_Tmax(i+1) - wayne_Tmax(i);
    gene_tmax_vari(i) = gene_Tmax(i+1) - gene_Tmax(i);
    oak_tmax_vari(i) = oak_Tmax(i+1) - oak_Tmax(i);
    mac_tmax_vari(i) = mac_Tmax(i+1) - mac_Tmax(i);
    wash_tmax_vari(i) = wash_Tmax(i+1) - wash_Tmax(i);
    
    sb_tmax_vari(i) = sb_Tmax(i+1) - sb_Tmax(i);
    sc_tmax_vari(i) = sc_Tmax(i+1) - sc_Tmax(i);
    i = i + 1;
end
% corona - Tmax
corrcoef(wayne_corona_dayily_increase,wayne_tmax_vari)
corrcoef(gene_corona_dayily_increase,gene_tmax_vari)
corrcoef(sc_corona_dayily_increase,sc_tmax_vari)
corrcoef(sb_corona_dayily_increase,sb_tmax_vari)

%% Tmin from 20200226 to 20200416 (2weeks earier that corona data)
wayne_Tmin = data_MI(:,9);
oak_Tmin = data_MI(:,13);
mac_Tmin = data_MI(:,16);
gene_Tmin = data_MI(:,20);
wash_Tmin = data_MI(:,24);

sb_Tmin = data_CA(:,6);
sc_Tmin = data_CA(:,10);

i = 1;
while i < leng1
    wayne_tmin_vari(i) = wayne_Tmin(i+1) - wayne_Tmin(i);
    gene_tmin_vari(i) = gene_Tmin(i+1) - gene_Tmin(i);
    sb_tmin_vari(i) = sb_Tmin(i+1) - sb_Tmin(i);
    sc_tmin_vari(i) = sc_Tmin(i+1) - sc_Tmin(i);
    i = i + 1;
end

% corona - Tmin
corrcoef(wayne_corona_dayily_increase,wayne_tmin_vari)
corrcoef(gene_corona_dayily_increase,gene_tmin_vari)
corrcoef(sc_corona_dayily_increase,sc_tmin_vari)
corrcoef(sb_corona_dayily_increase,sb_tmin_vari)

%% Precipitation from 20200226 to 20200416 (2weeks earier that corona data)
wayne_preci = data_MI(:,7);
oak_preci = data_MI(:,11);
mac_preci = data_MI(:,14);
gene_preci = data_MI(:,18);
wash_preci = data_MI(:,22);

sb_preci = data_CA(:,4);
sc_preci = data_CA(:,8);

i = 1;
while i < leng1
    wayne_preci_vari(i) = wayne_preci(i+1) - wayne_preci(i);
    gene_preci_vari(i) = gene_preci(i+1) - gene_preci(i);
    sb_preci_vari(i) = sb_preci(i+1) - sb_preci(i);
    sc_preci_vari(i) = sc_preci(i+1) - sc_preci(i);
    i = i + 1;
end

% corona - precipitation
corrcoef(wayne_corona_dayily_increase,wayne_preci_vari)
corrcoef(gene_corona_dayily_increase,gene_preci_vari)
corrcoef(sc_corona_dayily_increase,sc_preci_vari)
corrcoef(sb_corona_dayily_increase,sb_preci_vari)

%% Wind avg from 20200226 to 20200416 (2weeks earier that corona data)
wayne_wind = data_MI(:,6);
oak_wind = data_MI(:,10);
mac_wind = data_MI(:,13);
gene_wind = data_MI(:,17);
wash_wind = data_MI(:,21);

sb_wind = data_CA(:,3);
sc_wind = data_CA(:,7);

i = 1;
while i < leng1
    wayne_wind_vari(i) = wayne_wind(i+1) - wayne_wind(i);
    gene_wind_vari(i) = gene_wind(i+1) - gene_wind(i);
    sb_wind_vari(i) = sb_wind(i+1) - sb_wind(i);
    sc_wind_vari(i) = sc_wind(i+1) - sc_wind(i);
    i = i + 1;
end

% corona - wind
corrcoef(wayne_corona_dayily_increase,wayne_wind_vari)
corrcoef(gene_corona_dayily_increase,gene_wind_vari)
corrcoef(sc_corona_dayily_increase,sc_wind_vari)
corrcoef(sb_corona_dayily_increase,sb_wind_vari)

%% Correlation analysis of Temp max for 5 counties
a = wayne_corona_dayily_increase./wayne_tmax_vari;
b = oak_corona_dayily_increase./oak_tmax_vari;
c = mac_corona_dayily_increase./mac_tmax_vari;
d = gene_corona_dayily_increase./gene_tmax_vari;
e = wash_corona_dayily_increase./wash_tmax_vari;

corrcoef(wayne_corona_dayily_increase,oak_corona_dayily_increase)
corrcoef(wayne_corona_dayily_increase,mac_corona_dayily_increase)
corrcoef(wayne_corona_dayily_increase,gene_corona_dayily_increase)
corrcoef(wayne_corona_dayily_increase,wash_corona_dayily_increase)
corrcoef(gene_corona_dayily_increase,wash_corona_dayily_increase)

corrcoef(wayne_corona_dayily_increase,sc_corona_dayily_increase)
corrcoef(wayne_corona_dayily_increase,sb_corona_dayily_increase)
