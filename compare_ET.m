%Student Name: Sarah Bland 
%Program Name: ET_comparisons.m
%Description: Plots ET values generated via two different methods (both values 
%and relative to one another) in order to determine if a statistically 
%significant relationship exists via regression. 
%{
NOTES: No comparison as of yet for WOR as Chlorine ET values have not yet been obtained. 
%}



%Make a subplot of all figures
figure(5)
set(figure(5),'position',[0, 0, 1250, 750]);
set(figure(5),'name','ET Value Plots and Regressions','numbertitle','off')



%PAINE RUN 
[PAIN_NUMc,PAIN_TXTc,PAIN_RAWc] = xlsread('Shenandoah_ET_Coughlin.xlsx','Evapotranspiration','E1:E24');

%Plot both versions of ET values 
subplot(3,3,1)
wy = 1993:2015;  
plot(wy, wyET1, '*', wy, PAIN_NUMc, '+')    %mine are plotted in '*' & hers are in '+'
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Paine Run, SHEN');

%Plot both versions of ET values relative to each other 
subplot(3,3,4)
plot(wyET1, PAIN_NUMc, 'o')
xlabel('Discharge ET')
ylabel('Chlorine ET')
title('Paine Run, SHEN')

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_wyET1 = wyET1.';            %my ET values
trans_PAIN_NUMc = PAIN_NUMc;      %her ET values (already done)

%Find residuals between two ET value calculations 
[PAIN_B3,PAIN_BINT3,PAIN_R3] = regress(trans_PAIN_NUMc, trans_wyET1);

%Make a plot of residuals
subplot(3,3,7)
wy = 1993:2015;
plot(wy,PAIN_R3);      
xlabel('Year');
ylabel('Residual Values of ET vs. ET')
title('Paine Run, SHEN');



%STAUNTON RIVER 
[STAN_NUMc,STAN_TXTc,STAN_RAWc] = xlsread('Shenandoah_ET_Coughlin.xlsx','Evapotranspiration','D1:D24');

%Plot both versions of ET values 
subplot(3,3,2)
wy = 1993:2015;  
plot(wy, wyET2, '*', wy, STAN_NUMc, '+')
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Staunton River, SHEN');

%Plot both versions of ET values relative to each other 
subplot(3,3,5)
plot(wyET2, STAN_NUMc, 'o')
xlabel('Discharge ET')
ylabel('Chlorine ET')
title('Staunton River, SHEN')

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_wyET2 = wyET2.';            %my ET values
trans_STAN_NUMc = STAN_NUMc;      %her ET values (already done)

%Find residuals between two ET value calculations 
[STAN_B3,STAN_BINT3,STAN_R3] = regress(trans_STAN_NUMc, trans_wyET1);

%Make a plot of residuals
subplot(3,3,8)
wy = 1993:2015;
plot(wy,STAN_R3);    
%plot(wy,STAN_R3, '*');      
xlabel('Year');
ylabel('Residual Values of ET vs. ET')
title('Staunton River, SHEN');



%PINEY RIVER 
[PINE_NUMc,PINE_TXTc,PINE_RAWc] = xlsread('Shenandoah_ET_Coughlin.xlsx','Evapotranspiration','C1:C24');

%Plot both versions of ET values 
subplot(3,3,3)
wy = 1993:2015;  
plot(wy, wyET3, '*', wy, PINE_NUMc, '+')
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Piney River, SHEN');

%Plot both versions of ET values relative to each other 
subplot(3,3,6)
plot(wyET3, PINE_NUMc, 'o')
xlabel('Discharge ET')
ylabel('Chlorine ET')
title('Piney River, SHEN')

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_wyET3 = wyET3.';            %my ET values
trans_PINE_NUMc = PINE_NUMc;      %her ET values (already done)

%Find residuals between two ET value calculations 
[PINE_B3,PINE_BINT3,PINE_R3] = regress(trans_STAN_NUMc, trans_wyET1);

%Make a plot of residuals
subplot(3,3,9)
wy = 1993:2015;
plot(wy,PINE_R3);    
%plot(wy,PINE_R3, '*');      
xlabel('Year');
ylabel('Residual Values of ET vs. ET')
title('Piney River, SHEN');



%DON'T YET HAVE CHLORINE ET VALUES FOR WOR 