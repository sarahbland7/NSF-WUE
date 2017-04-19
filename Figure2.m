%Student Name: Sarah Bland 
%Program Name: Figure2.m
%Description:
% (1) Uses baseflow, quickflow, and PET values to plot seasonal & annual humidity
% indices (precip/ PET) vs. Horton Index.
% (2) Uses #1 info to determine if a statistically significant relationship exists 
% via regression. Residuals then plotted relative to time. 
%{
NOTES: A p-value is the calculated probability of finding the observed, or
more extreme, results when the null hypothesis of a study question is true.
%}


%Make a subplot of 4 figures 
figure(9)
clf
set(figure(9),'position',[0, 0, 1250, 750]);
set(figure(9),'name','Inter-Annual Variability of Horton Index','numbertitle','off')



% GROWING SEASON %
%Gather PET & Horton Index Values 
[Results_NUMa,Results_TXTa,Results_RAWa] = xlsread('Results.xlsx','Paine_GS','A1:K24');
Precip_Paine = Results_NUMa(:,2);
PET_Paine = Results_NUMa(:,10);
HumidityIndex_Paine = zeros(1,23);
for i = 1:23 
    HumidityIndex_Paine(i) = Precip_Paine(i)./PET_Paine(i);
end
Horton_Paine = Results_NUMa(:,11);    

[Results_NUMb,Results_TXTb,Results_RAWb] = xlsread('Results.xlsx','Staunton_GS','A1:K24');
Precip_Staunton = Results_NUMb(:,2);
PET_Staunton = Results_NUMb(:,10);
HumidityIndex_Staunton = zeros(1,23);
for i = 1:23 
    HumidityIndex_Staunton(i) = Precip_Staunton(i)./PET_Staunton(i);
end
Horton_Staunton = Results_NUMb(:,11);

[Results_NUMc,Results_TXTc,Results_RAWc] = xlsread('Results.xlsx','Piney_GS','A1:K24');
Precip_Piney = Results_NUMc(:,2);
PET_Piney = Results_NUMc(:,10);
HumidityIndex_Piney = zeros(1,23);
for i = 1:23 
    HumidityIndex_Piney(i) = Precip_Piney(i)./PET_Piney(i);
end
Horton_Piney = Results_NUMc(:,11);

[Results_NUMd,Results_TXTd,Results_RAWd] = xlsread('Results.xlsx','WhiteOak_GS','A1:K37');
Precip_WhiteOak = Results_NUMd(:,2);
PET_WhiteOak = Results_NUMd(:,10);
HumidityIndex_WhiteOak = zeros(1,36);
for i = 1:36
    HumidityIndex_WhiteOak(i) = Precip_WhiteOak(i)./PET_WhiteOak(i);
end
Horton_WhiteOak = Results_NUMd(:,11);

%PLOT "Function of Seasonal Humidity Index"
subplot(2,3,1)
hold on
plot(HumidityIndex_Paine, Horton_Paine, '*')
plot(HumidityIndex_Staunton, Horton_Staunton, '+')
plot(HumidityIndex_Piney, Horton_Piney, 'o')
plot(HumidityIndex_WhiteOak, Horton_WhiteOak, 'x')
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off

xlabel('Seasonal Humidity Index (Precipitation/ PET)'); 
ylabel('Horton Index')
title('Function of Seasonal Humidity Index');

%Transpose 1x23 & 1x36 doubles into 23x1 & 36x1 doubles for use with regress()
trans_HumidityIndex_Paine = HumidityIndex_Paine.';  
trans_HumidityIndex_Staunton = HumidityIndex_Staunton.';  
trans_HumidityIndex_Piney = HumidityIndex_Piney.';  
trans_HumidityIndex_WhiteOak = HumidityIndex_WhiteOak.';  

%Find residuals between GS Humidity Index (X) & GS Horton Index (Y)
%B is a vector of regression coefficients in the linear model Y = X * B
%BINT is a matrix of 95% confidence intervals for B 
%R is a vector of residuals 
[B_PAIN_GS,BINT_PAIN_GS,R_PAIN_GS] = regress(Horton_Paine, [trans_HumidityIndex_Paine ones(23,1)]);
[B_STAN_GS,BINT_STAN_GS,R_STAN_GS] = regress(Horton_Staunton, [trans_HumidityIndex_Staunton ones(23,1)]);
[B_PINE_GS,BINT_PINE_GS,R_PINE_GS] = regress(Horton_Staunton, [trans_HumidityIndex_Piney ones(23,1)]);
[B_WOR_GS,BINT_WOR_GS,R_WOR_GS] = regress(Horton_WhiteOak, [trans_HumidityIndex_WhiteOak ones(36,1)]);

%PLOT time vs. residuals
subplot(2,3,2)
wy = 1993:2015;
wy1 = 1980:2015;
hold on
plot(wy,R_PAIN_GS, '*'); 
plot(wy,R_STAN_GS, '+'); 
plot(wy,R_PINE_GS, 'o');
plot(wy1,R_WOR_GS, 'x');
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off
xlabel('Year');
ylabel('Residual Values of Humidity Index vs. Horton Index')
title('Residuals for Growing Season');

%Find residuals between Time (X) & Residuals (Y)
%B is a vector of regression coefficients in the linear model Y = X * B
%BINT is a matrix of 95% confidence intervals for B 
%R is a vector of residuals 
[B1_PAIN_GS,BINT1_PAIN_GS,R1_PAIN_GS, PAIN_DUMMY, PAIN_STATS] = regress(R_PAIN_GS, [wy.' ones(23,1)]);
[B1_STAN_GS,BINT1_STAN_GS,R1_STAN_GS, STAN_DUMMY, STAN_STATS] = regress(R_STAN_GS, [wy.' ones(23,1)]);
[B1_PINE_GS,BINT1_PINE_GS,R1_PINE_GS, PINE_DUMMY, PINE_STATS] = regress(R_PINE_GS, [wy.' ones(23,1)]);
[B1_WOR_GS,BINT1_WOR_GS,R1_WOR_GS, WOR_DUMMY, WOR_STATS] = regress(R_WOR_GS, [wy1.' ones(36,1)]);

%
%R-squared and p-value 
output_PAIN = [B1_PAIN_GS(1), B1_PAIN_GS(2), PAIN_STATS(1), PAIN_STATS(3)];
output_STAN = [B1_STAN_GS(1), B1_STAN_GS(2), STAN_STATS(1), STAN_STATS(3)];
output_PINE = [B1_PINE_GS(1), B1_PINE_GS(2), PINE_STATS(1), PINE_STATS(3)];
output_WOR = [B1_WOR_GS(1), B1_WOR_GS(2), WOR_STATS(1), WOR_STATS(3)];

%PLOT time vs. residuals of residuals 
subplot(2,3,3)
wy = 1993:2015;
wy1 = 1980:2015;
hold on
plot(wy,R1_PAIN_GS, '*'); 
plot(wy,R1_STAN_GS, '+'); 
plot(wy,R1_PINE_GS, 'o');
plot(wy1,R1_WOR_GS, 'x');
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off
xlabel('Year');
ylabel('Residual Values of Time vs. Residuals')
title('Residuals of Residuals - GS');



% WATER YEAR %

%Gather PET & Horton Index Values 
[Results_NUMa1,Results_TXTa1,Results_RAWa1] = xlsread('Results.xlsx','Paine_WY','A1:K24');
Precip_Paine1 = Results_NUMa1(:,2);
PET_Paine1 = Results_NUMa1(:,10);
HumidityIndex_Paine1 = zeros(1,23);
for i = 1:23 
    HumidityIndex_Paine1(i) = Precip_Paine1(i)./PET_Paine1(i);
end
Horton_Paine1 = Results_NUMa1(:,11);    

[Results_NUMb1,Results_TXTb1,Results_RAWb1] = xlsread('Results.xlsx','Staunton_WY','A1:K24');
Precip_Staunton1 = Results_NUMb1(:,2);
PET_Staunton1 = Results_NUMb1(:,10);
HumidityIndex_Staunton1 = zeros(1,23);
for i = 1:23 
    HumidityIndex_Staunton1(i) = Precip_Staunton1(i)./PET_Staunton1(i);
end
Horton_Staunton1 = Results_NUMb1(:,11);

[Results_NUMc1,Results_TXTc1,Results_RAWc1] = xlsread('Results.xlsx','Piney_WY','A1:K24');
Precip_Piney1 = Results_NUMc1(:,2);
PET_Piney1 = Results_NUMc1(:,10);
HumidityIndex_Piney1 = zeros(1,23);
for i = 1:23 
    HumidityIndex_Piney1(i) = Precip_Piney1(i)./PET_Piney1(i);
end
Horton_Piney1 = Results_NUMc1(:,11);

[Results_NUMd1,Results_TXTd1,Results_RAWd1] = xlsread('Results.xlsx','WhiteOak_WY','A1:K37');
Precip_WhiteOak1 = Results_NUMd1(:,2);
PET_WhiteOak1 = Results_NUMd1(:,10);
HumidityIndex_WhiteOak1 = zeros(1,36);
for i = 1:36
    HumidityIndex_WhiteOak1(i) = Precip_WhiteOak1(i)./PET_WhiteOak1(i);
end
Horton_WhiteOak1 = Results_NUMd1(:,11);

%PLOT "Function of Annual Humidity Index"
subplot(2,3,4)
hold on
plot(HumidityIndex_Paine1, Horton_Paine1, '*')
plot(HumidityIndex_Staunton1, Horton_Staunton1, '+')
plot(HumidityIndex_Piney1, Horton_Piney1, 'o')
plot(HumidityIndex_WhiteOak1, Horton_WhiteOak1, 'x')
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off

xlabel('Annual Humidity Index (Precipitation/ PET)'); 
ylabel('Horton Index')
title('Function of Annual Humidity Index');

%Transpose 1x23 & 1x36 doubles into 23x1 & 36x1 doubles for use with regress()
trans_HumidityIndex_Paine1 = HumidityIndex_Paine1.';  
trans_HumidityIndex_Staunton1 = HumidityIndex_Staunton1.';  
trans_HumidityIndex_Piney1 = HumidityIndex_Piney1.';  
trans_HumidityIndex_WhiteOak1 = HumidityIndex_WhiteOak1.';  

%Find residuals between GS Humidity Index (X) & GS Horton Index (Y)
%B is a vector of regression coefficients in the linear model Y = X * B
%BINT is a matrix of 95% confidence intervals for B 
%R is a vector of residuals 
[B_PAIN_WY,BINT_PAIN_WY,R_PAIN_WY] = regress(Horton_Paine1, [trans_HumidityIndex_Paine1 ones(23,1)]);
[B_STAN_WY,BINT_STAN_WY,R_STAN_WY] = regress(Horton_Staunton1, [trans_HumidityIndex_Staunton1 ones(23,1)]);
[B_PINE_WY,BINT_PINE_WY,R_PINE_WY] = regress(Horton_Piney1, [trans_HumidityIndex_Piney1 ones(23,1)]);
[B_WOR_WY,BINT_WOR_WY,R_WOR_WY] = regress(Horton_WhiteOak1, [trans_HumidityIndex_WhiteOak1 ones(36,1)]);

%PLOT time vs. residuals
subplot(2,3,5)
wy = 1993:2015;
wy1 = 1980:2015;
hold on
plot(wy,R_PAIN_WY, '*'); 
plot(wy,R_STAN_WY, '+'); 
plot(wy,R_PINE_WY, 'o');
plot(wy1,R_WOR_WY, 'x');
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off
xlabel('Year');
ylabel('Residual Values of Humidity Index vs. Horton Index')
title('Residuals for Water Year');

%Find residuals between Time (X) & Residuals (Y)
%B is a vector of regression coefficients in the linear model Y = X * B
%BINT is a matrix of 95% confidence intervals for B 
%R is a vector of residuals 
[B1_PAIN_WY,BINT1_PAIN_WY,R1_PAIN_WY] = regress(R_PAIN_WY, [wy.' ones(23,1)]);
[B1_STAN_WY,BINT1_STAN_WY,R1_STAN_WY] = regress(R_STAN_WY, [wy.' ones(23,1)]);
[B1_PINE_WY,BINT1_PINE_WY,R1_PINE_WY] = regress(R_PINE_WY, [wy.' ones(23,1)]);
[B1_WOR_WY,BINT1_WOR_WY,R1_WOR_WY] = regress(R_WOR_WY, [wy1.' ones(36,1)]);

%PLOT time vs. residuals of residuals 
subplot(2,3,6)
wy = 1993:2015;
wy1 = 1980:2015;
hold on
plot(wy,R1_PAIN_WY, '*'); 
plot(wy,R1_STAN_WY, '+'); 
plot(wy,R1_PINE_WY, 'o');
plot(wy1,R1_WOR_WY, 'x');
legend('Paine', 'Staunton', 'Piney', 'White Oak')
hold off
xlabel('Year');
ylabel('Residual Values of Time vs. Residuals')
title('Residuals of Residuals - WY');