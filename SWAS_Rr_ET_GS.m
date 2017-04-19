%GROWING SEASON 

%Student Name: Sarah Bland 
%Program Name: SWAS_Rr_ET.m
%Description: Uses SWAS_Q.m & SWAS_P.m output to calculate runoff ratio (Rr) & 
%evapotranspiration (ET) for four SWAS sites. 
%{
NOTES: Runoff ratio (Rr) for a water year (wy) is equal to average annual stream discharge / annual 
precipitation. It represents the fraction of rainfall which leaves a system
as streamflow. Should be about 1/3 for the systems in question.
Evapotranspiration (ET) is equal to annual precipitation - average annual stream discharge.
%}



%Make a subplot of all figures
figure(8)
set(figure(8),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(8),'name','Runoff Ratios & Evapotranspiration // Growing Season','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN
wy = 1993:2015;  
wyRr1_GS = zeros(1, 23);
wyET1_GS = zeros(1, 23);
for i = 1:23
    wyRr1_GS(i) = ave_wyQ1_GS(i) / sum_wyP1_GS(i);    %access each stream discharge/ precipitation
    wyET1_GS(i) = sum_wyP1_GS(i) - ave_wyQ1_GS(i);   %access each precipitation - stream discharge
end

%Make a bar graph of Rr output
subplot(2,4,1)
bar(wy, wyRr1_GS)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Paine Run, SHEN');

%Make a bar graph of ET output
subplot(2,4,5)
bar(wy, wyET1_GS)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Paine Run, SHEN');



%STAUNTON RIVER
wy = 1993:2015; 
wyRr2_GS = zeros(1, 23);
wyET2_GS = zeros(1, 23);
for i = 1:23
    wyRr2_GS(i) = ave_wyQ2_GS(i) / sum_wyP2_GS(i);    %access each stream discharge/ precipitation
    wyET2_GS(i) = sum_wyP2_GS(i) - ave_wyQ2_GS(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,2)
bar(wy, wyRr2_GS)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Staunton River, SHEN');

%Make a bar graph of ET output
subplot(2,4,6)
bar(wy, wyET2_GS)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Staunton River, SHEN');



%PINEY RIVER
wy = 1993:2015; 
wyRr3_GS = zeros(1, 23);
wyET3_GS = zeros(1, 23);
for i = 1:23
    wyRr3_GS(i) = ave_wyQ3_GS(i) / sum_wyP3_GS(i);    %access each stream discharge/ precipitation
    wyET3_GS(i) = sum_wyP3_GS(i) - ave_wyQ3_GS(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,3)
bar(wy, wyRr3_GS)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Piney River, SHEN');

%Make a bar graph of ET output
subplot(2,4,7)
bar(wy, wyET3_GS)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE 
wy1 = 1980:2015; 
wyRr4_GS = zeros(1, 36);
wyET4_GS = zeros(1, 36);
for i = 1:36
    %using wyQ5 because wyQ4 is the smaller (1992:2015) date range for WOR
    wyRr4_GS(i) = ave_wyQ5_GS(i) / sum_wyP4_GS(i);    %access each stream discharge/ precipitation
    wyET4_GS(i) = sum_wyP4_GS(i) - ave_wyQ5_GS(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,4)
bar(wy1, wyRr4_GS)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('White Oak Run, SHEN');

%Make a bar graph of ET output
subplot(2,4,8)
bar(wy1, wyET4_GS)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('White Oak Run, SHEN');