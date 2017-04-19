%Student Name: Sarah Bland 
%Program Name: SWAS_PvsRr_Pval.m
%Description: Uses SWAS_P.m & SWAS_Rr_ET.m output to plot precipitation (P) vs. runoff ratio (Rr)
%in order to determine if a statistically significant relationship exists via regression. Residuals then 
%plotted relative to time. Also calculates p-values for residuals. 
%{
NOTES: A p-value is the calculated probability of finding the observed, or
more extreme, results when the null hypothesis of a study question is true.
%}



%Make a subplot of all figures
figure(4)
set(figure(4),'position',[0, 0, 1250, 750]);
set(figure(4),'name','Precipitation vs. Runoff Ratio & Residuals','numbertitle','off')



%PAINE RUN
%Plot precipitation vs. yearly runoff ratio 
subplot(2,4,1)
plot(sum_wyP1, wyRr1, '*')
xlabel('Yearly Precipitation (m)'); 
ylabel('Yearly Runoff Ratio')
title('Paine Run, SHEN');

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_sum_wyP1 = sum_wyP1.';    %yearly P
trans_wyRr1 = wyRr1.';          %yearly Rr

%Find residuals between yearly P (X) & yearly Rr (Y)
[PAIN_B1,PAIN_BINT1,PAIN_R1] = regress(trans_wyRr1, trans_sum_wyP1);
%PAIN_B1 is a vector B of regression coefficients in the linear model Y = X * B
%PAIN_BINT1 is a matrix BINT of 95% confidence intervals for B 
%PAIN_R1 is a vector R of residuals 

%Make a plot of residuals
subplot(2,4,5)
wy = 1993:2015;
plot(wy,PAIN_R1);   
xlabel('Year');
ylabel('Residual Values of P vs. Rr')
title('Paine Run, SHEN');

%Find p-values for residuals for Paine Run 
[PAIN_B2,PAIN_BINT2,PAIN_R2,PAIN_RINT2,PAIN_STATS2] = regress(PAIN_R1, [wy' ones(23,1)]);
%PAIN_RINT2 is a matrix of intervals that can be used to diagnose outliers 
%PAIN_STATS2 is a vector containing (1) R-square statistic (2) F statistic
%(3) p value (4) estimate of error variance 

%Find number of positive residuals and number of negative residuals
PAIN_pos = 0;
PAIN_neg = 0;
for i = 1:23    
    if(PAIN_R1(i) >= 0)
        PAIN_pos = PAIN_pos + 1;
    else 
        PAIN_neg = PAIN_neg + 1;
    end
end



%STAUNTON RIVER
%Plot precipitation vs. yearly runoff ratio 
subplot(2,4,2)
plot(sum_wyP2, wyRr2, '*')
xlabel('Yearly Precipitation (m)'); 
ylabel('Yearly Runoff Ratio')
title('Staunton River, SHEN');

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_sum_wyP2 = sum_wyP2.';    %yearly P
trans_wyRr2 = wyRr2.';          %yearly Rr

%Find residuals between yearly P (X) & yearly Rr (Y)
[STAN_B1,STAN_BINT1,STAN_R1] = regress(trans_wyRr2, trans_sum_wyP2);

%Make a plot of residuals
subplot(2,4,6)
wy = 1993:2015;
plot(wy,STAN_R1);      
xlabel('Year');
ylabel('Residual Values of P vs. Rr')
title('Staunton River, SHEN');

%Find p-values for residuals for Staunton River 
[STAN_B2,STAN_BINT2,STAN_R2,STAN_RINT2,STAN_STATS2] = regress(STAN_R1, [wy' ones(23,1)]);
%STAN_STATS2 is a vector containing (3) p value 

%Find number of positive residuals and number of negative residuals
STAN_pos = 0;
STAN_neg = 0;
for i = 1:23    
    if(STAN_R1(i) >= 0)
        STAN_pos = STAN_pos + 1;
    else 
        STAN_neg = STAN_neg + 1;
    end
end



%PINEY RIVER 
%Plot precipitation vs. yearly runoff ratio 
subplot(2,4,3)
plot(sum_wyP3, wyRr3, '*')
xlabel('Yearly Precipitation (m)'); 
ylabel('Yearly Runoff Ratio')
title('Piney River, SHEN');

%Transpose 1x23 doubles into 23x1 doubles for use with regress()
trans_sum_wyP3 = sum_wyP3.';    %yearly P
trans_wyRr3 = wyRr3.';          %yearly Rr

%Find residuals between yearly P (X) & yearly Rr (Y)
[PINE_B1,PINE_BINT1,PINE_R1] = regress(trans_wyRr3, trans_sum_wyP3);

%Make a plot of residuals
subplot(2,4,7)
wy = 1993:2015;
plot(wy,PINE_R1);   
xlabel('Year');
ylabel('Residual Values of P vs. Rr')
title('Piney River, SHEN');

%Find p-values for residuals for Piney River 
[PINE_B2,PINE_BINT2,PINE_R2,PINE_RINT2,PINE_STATS2] = regress(PINE_R1, [wy' ones(23,1)]);
%PINE_STATS2 is a vector containing (3) p value 

%Find number of positive residuals and number of negative residuals
PINE_pos = 0;
PINE_neg = 0;
for i = 1:23    
    if(PINE_R1(i) >= 0)
        PINE_pos = PINE_pos + 1;
    else 
        PINE_neg = PINE_neg + 1;
    end
end



%WHITE OAK RUN // FULL DATE RANGE 
%Plot precipitation vs. yearly runoff ratio 
subplot(2,4,4)
plot(sum_wyP4, wyRr4, '*')
xlabel('Yearly Precipitation (m)'); 
ylabel('Yearly Runoff Ratio')
title('White Oak Run, SHEN');

%Transpose 1x36 doubles into 36x1 doubles for use with regress()
trans_sum_wyP4 = sum_wyP4.';    %yearly P
trans_wyRr4 = wyRr4.';          %yearly Rr

%Find residuals between yearly P (X) & yearly Rr (Y)
[WOR_B1,WOR_BINT1,WOR_R1] = regress(trans_wyRr4, trans_sum_wyP4);

%Make a plot of residuals
subplot(2,4,8)
wy1 = 1980:2015;
plot(wy1,WOR_R1);   
xlabel('Year');
ylabel('Residual Values of P vs. Rr')
title('White Oak Run, SHEN');

%Find p-values for residuals for White Oak Run
[WOR_B2,WOR_BINT2,WOR_R2,WOR_RINT2,WOR_STATS2] = regress(WOR_R1, [wy1' ones(36,1)]);
%WOR_STATS2 is a vector containing (3) p value 

%Find number of positive residuals and number of negative residuals
WOR_pos = 0;
WOR_neg = 0;
for i = 1:36    
    if(WOR_R1(i) >= 0)
        WOR_pos = WOR_pos + 1;
    else 
        WOR_neg = WOR_neg + 1;
    end
end