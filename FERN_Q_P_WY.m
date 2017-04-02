% Student Name: Sarah Bland 
% Program Name: FERN_Q_WY.m
% Description: Opens and analyzes discharge (Q) data and precipitation (P) data 
% for 3 sites in the Fernow Experimental Forest by WATER YEAR.


%Make a subplot of all figures
figure(1)
clf
set(figure(1),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(1),'name','Discharge & Precipitation - Water Year','numbertitle','off')
%set name & turn off typical number title 



%WATERSHED THREE  
[WS3_NUM,WS3_TXT,WS3_RAW] = xlsread('daily_Q_P.xlsx','WS3','A1:F22892');
%WS3_NUM is a 20880 x 4 (no text headers) double-precision array (numeric data)
%WS3_TXT is a 20881 x 5 cell array (textual data)
%WS3_RAW is a 20881 x 5 cell array (combination of numeric and textual data)

%Read in numeric data
WS3_month = WS3_NUM(:,1);          %Month
WS3_day = WS3_NUM(:,2);            %Day
WS3_year = WS3_NUM(:,3);           %Year
WS3_discharge = WS3_NUM(:,4);      %WS3 discharge, mm per day
WS3_precipitation = WS3_NUM(:,5);  %WS3 precipitation, mm per day

%Make a plot of discharge 
subplot(3,3,1)
plot(WS3_year, WS3_discharge);       %dates on x-axis by Q data on y-axis
xlabel('Year');
ylabel('Stream Discharge (mm)')
title('Watershed 3');

%Calculate water year discharge & precipitation in meters 
wy3 = 1957:2013;
ave_wyQ3 = zeros(1, 57);
sum_wyP3 = zeros(1, 57);
for i = 1:57
    ii = find((WS3_year == (wy3(i) - 1) & WS3_month >= 10) | (WS3_year == wy3(i) & WS3_month <= 9));
    ave_wyQ3(i) = sum(WS3_discharge(ii)) * 0.001;    %convert from mm to m
    sum_wyP3(i) = sum(WS3_precipitation(ii)) * 0.001;    %convert from mm to m
end

%Make a bar graph of discharge output 
subplot(3,3,4)
bar(wy3, ave_wyQ3)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Watershed 3');

%Make a bar graph of precipitation output 
subplot(3,3,7)
bar(wy3, sum_wyP3)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Total Precipitation (m/wy)')
title('Watershed 3');



%WATERSHED FOUR  
[WS4_NUM,WS4_TXT,WS4_RAW] = xlsread('daily_Q_P.xlsx','WS4','A1:F22892');
%WS4_NUM is a 22891 x 4 (no text headers) double-precision array (numeric data)
%WS4_TXT is a 22892 x 5 cell array (textual data)
%WS4_RAW is a 22892 x 5 cell array (combination of numeric and textual data)

%Read in numeric data
WS4_month = WS4_NUM(:,1);          %Month
WS4_day = WS4_NUM(:,2);            %Day
WS4_year = WS4_NUM(:,3);           %Year
WS4_discharge = WS4_NUM(:,4);      %WS4 discharge, mm per day
WS4_precipitation = WS4_NUM(:,5);  %WS3 precipitation, mm per day

%Make a plot of discharge 
subplot(3,3,2)
plot(WS4_year, WS4_discharge);       %dates on x-axis by Q data on y-axis
xlabel('Year');
ylabel('Stream Discharge (mm)')
title('Watershed 4');

%Calculate water year discharge & precipitation in meters 
wy4 = 1957:2013;
ave_wyQ4 = zeros(1, 57);
sum_wyP4 = zeros(1, 57);
for i = 1:57
    ii = find((WS4_year == (wy4(i) - 1) & WS4_month >= 10) | (WS4_year == wy4(i) & WS4_month <= 9));
    ave_wyQ4(i) = sum(WS4_discharge(ii)) * 0.001;    %convert from mm to m
    sum_wyP4(i) = sum(WS4_precipitation(ii)) * 0.001;    %convert from mm to m
end

%Make a bar graph of discharge output 
subplot(3,3,5)
bar(wy4, ave_wyQ4)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Watershed 4');

%Make a bar graph of precipitation output 
subplot(3,3,8)
bar(wy4, sum_wyP4)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('T Precipitation (m/wy)')
title('Watershed 4');



%WATERSHED SEVEN  
[WS7_NUM,WS7_TXT,WS7_RAW] = xlsread('daily_Q_P.xlsx','WS7','A1:F20881');
%WS7_NUM is a 20880 x 4 (no text headers) double-precision array (numeric data)
%WS7_TXT is a 20881 x 5 cell array (textual data)
%WS7_RAW is a 20881 x 5 cell array (combination of numeric and textual data)

%Read in numeric data
WS7_month = WS7_NUM(:,1);          %Month
WS7_day = WS7_NUM(:,2);            %Day
WS7_year = WS7_NUM(:,3);           %Year
WS7_discharge = WS7_NUM(:,4);      %WS4 discharge, mm per day
WS7_precipitation = WS7_NUM(:,5);  %WS3 precipitation, mm per day

%Make a plot of discharge 
subplot(3,3,3)
plot(WS7_year, WS7_discharge);       %dates on x-axis by Q data on y-axis
xlabel('Year');
ylabel('Stream Discharge (mm)')
title('Watershed 7');

%Calculate water year discharge & precipitation in meters 
wy7 = 1957:2013;
ave_wyQ7 = zeros(1, 57);
sum_wyP7 = zeros(1, 57);
for i = 1:57
    ii = find((WS7_year == (wy7(i) - 1) & WS7_month >= 10) | (WS7_year == wy7(i) & WS7_month <= 9));
    ave_wyQ7(i) = sum(WS7_discharge(ii)) * 0.001;    %convert from mm to m
    sum_wyP7(i) = sum(WS7_precipitation(ii)) * 0.001;    %convert from mm to m
end

%Make a bar graph of discharge output 
subplot(3,3,6)
bar(wy7, ave_wyQ7)                   %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Watershed 7');

%Make a bar graph of precipitation output 
subplot(3,3,9)
bar(wy7, sum_wyP7)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Precipitation (m/wy)')
title('Watershed 7');