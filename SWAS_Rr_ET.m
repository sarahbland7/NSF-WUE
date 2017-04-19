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
figure(3)
set(figure(3),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(3),'name','Runoff Ratios & Evapotranspiration','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN
wy = 1993:2015;  
wyRr1 = zeros(1, 23);
wyET1 = zeros(1, 23);
for i = 1:23
    wyRr1(i) = ave_wyQ1(i) / sum_wyP1(i);    %access each stream discharge/ precipitation
    wyET1(i) = sum_wyP1(i) - ave_wyQ1(i);   %access each precipitation - stream discharge
end

%Make a bar graph of Rr output
subplot(2,4,1)
bar(wy, wyRr1)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Paine Run, SHEN');

%Make a bar graph of ET output
subplot(2,4,5)
bar(wy, wyET1)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Paine Run, SHEN');



%STAUNTON RIVER
wy = 1993:2015; 
wyRr2 = zeros(1, 23);
wyET2 = zeros(1, 23);
for i = 1:23
    wyRr2(i) = ave_wyQ2(i) / sum_wyP2(i);    %access each stream discharge/ precipitation
    wyET2(i) = sum_wyP2(i) - ave_wyQ2(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,2)
bar(wy, wyRr2)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Staunton River, SHEN');

%Make a bar graph of ET output
subplot(2,4,6)
bar(wy, wyET2)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Staunton River, SHEN');



%PINEY RIVER
wy = 1993:2015; 
wyRr3 = zeros(1, 23);
wyET3 = zeros(1, 23);
for i = 1:23
    wyRr3(i) = ave_wyQ3(i) / sum_wyP3(i);    %access each stream discharge/ precipitation
    wyET3(i) = sum_wyP3(i) - ave_wyQ3(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,3)
bar(wy, wyRr3)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('Piney River, SHEN');

%Make a bar graph of ET output
subplot(2,4,7)
bar(wy, wyET3)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE 
wy1 = 1980:2015; 
wyRr4 = zeros(1, 36);
wyET4 = zeros(1, 36);
for i = 1:36
    %using wyQ5 because wyQ4 is the smaller (1992:2015) date range for WOR
    wyRr4(i) = ave_wyQ5(i) / sum_wyP4(i);    %access each stream discharge/ precipitation
    wyET4(i) = sum_wyP4(i) - ave_wyQ5(i);    %access each precipitation - stream discharge
end

%Make a bar graph of Rr output 
subplot(2,4,4)
bar(wy1, wyRr4)
xlabel('Year');
ylabel('Yearly Runoff Ratio')
title('White Oak Run, SHEN');

%Make a bar graph of ET output
subplot(2,4,8)
bar(wy1, wyET4)
xlabel('Year');
ylabel('Yearly ET Values (m/wy)')
title('White Oak Run, SHEN');