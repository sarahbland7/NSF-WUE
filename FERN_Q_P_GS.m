% Student Name: Sarah Bland 
% Program Name: FERN_Q_P_GS.m
% Description: Opens and analyzes discharge (Q) data and precipitation (P) data 
% for 3 sites in the Fernow Experimental Forest by GROWING SEASON.
% NOTE: Growing season is defined for all Fernow sites as being from May 1 through October 31.



%Make a subplot of all figures
figure(2)
clf
set(figure(2),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(2),'name','Discharge & Precipitation - Growing Season','numbertitle','off')
%set name & turn off typical number title 



%WATERSHED THREE  
[WS3_NUM,WS3_TXT,WS3_RAW] = xlsread('daily_Q_P.xlsx','WS3','A1:F23622');
%WS3_NUM is a 23621 x 5 (no text headers) double-precision array (numeric data)
%WS3_TXT is a 23621 x 6 cell array (textual data)
%WS3_RAW is a 23622 x 6 cell array (combination of numeric and textual data)

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

%Calculate growing season discharge & precipitation in meters 
gs3 = 1957:2014;
ave_gsQ3 = zeros(1, 58);
sum_gsP3 = zeros(1, 58);
for i = 1:58
    ii = find(WS3_year == (gs3(i)) & (5 <= WS3_month & WS3_month <= 10));
    ave_gsQ3(i) = sum(WS3_discharge(ii)) * 0.001;       %convert from mm to m
    sum_gsP3(i) = sum(WS3_precipitation(ii)) * 0.001;   %convert from mm to m
end

%Make a bar graph of discharge output 
subplot(3,3,4)
bar(gs3, ave_gsQ3)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/gs)')
title('Watershed 3');

%Make a bar graph of precipitation output 
subplot(3,3,7)
bar(gs3, sum_gsP3)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Total Precipitation (m/gs)')
title('Watershed 3');



%WATERSHED FOUR  
[WS4_NUM,WS4_TXT,WS4_RAW] = xlsread('daily_Q_P.xlsx','WS4','A1:F23622');
%WS4_NUM is a 23621 x 5 (no text headers) double-precision array (numeric data)
%WS4_TXT is a 22892 x 6 cell array (textual data)
%WS4_RAW is a 22892 x 6 cell array (combination of numeric and textual data)

%Read in numeric data
WS4_month = WS4_NUM(:,1);          %Month
WS4_day = WS4_NUM(:,2);            %Day
WS4_year = WS4_NUM(:,3);           %Year
WS4_discharge = WS4_NUM(:,4);      %WS4 discharge, mm per day
WS4_precipitation = WS4_NUM(:,5);  %WS4 precipitation, mm per day

%Make a plot of discharge 
subplot(3,3,2)
plot(WS4_year, WS4_discharge);       %dates on x-axis by Q data on y-axis
xlabel('Year');
ylabel('Stream Discharge (mm)')
title('Watershed 4');

%Calculate growing season discharge & precipitation in meters 
gs4 = 1957:2014;
ave_gsQ4 = zeros(1, 58);
sum_gsP4 = zeros(1, 58);
for i = 1:58
    ii = find(WS4_year == (gs4(i)) & (5 <= WS4_month & WS4_month <= 10));
    ave_gsQ4(i) = sum(WS4_discharge(ii)) * 0.001;       %convert from mm to m
    sum_gsP4(i) = sum(WS4_precipitation(ii)) * 0.001;   %convert from mm to m
end

%Make a bar graph of discharge output
subplot(3,3,5)
bar(gs4, ave_gsQ4)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/gs)')
title('Watershed 4');

%Make a bar graph of precipitation output 
subplot(3,3,8)
bar(gs4, sum_gsP4)                     %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Total Precipitation (m/gs)')
title('Watershed 4');



%WATERSHED SEVEN  
[WS7_NUM,WS7_TXT,WS7_RAW] = xlsread('daily_Q_P.xlsx','WS7','A1:F21611');
%WS7_NUM is a 21610 x 5 (no text headers) double-precision array (numeric data)
%WS7_TXT is a 21611 x 6 cell array (textual data)
%WS7_RAW is a 21611 x 6 cell array (combination of numeric and textual data)

%Read in numeric data
WS7_month = WS7_NUM(:,1);          %Month
WS7_day = WS7_NUM(:,2);            %Day
WS7_year = WS7_NUM(:,3);           %Year
WS7_discharge = WS7_NUM(:,4);      %WS7 discharge, mm per day
WS7_precipitation = WS7_NUM(:,5);  %WS7 precipitation, mm per day

%Make a plot of discharge 
subplot(3,3,3)
plot(WS7_year, WS7_discharge);       %dates on x-axis by Q data on y-axis
xlabel('Year');
ylabel('Stream Discharge (mm)')
title('Watershed 7');

%Calculate growing season discharge & precipitation in meters 
gs7 = 1957:2014;
ave_gsQ7 = zeros(1, 58);
sum_gsP7 = zeros(1, 58);
for i = 1:58
    ii = find(WS7_year == (gs7(i)) & (5 <= WS7_month & WS7_month <= 10));
    ave_gsQ7(i) = sum(WS7_discharge(ii)) * 0.001;       %convert from mm to m
    sum_gsP7(i) = sum(WS7_precipitation(ii)) * 0.001;   %convert from mm to m
end

%Make a bar graph of discharge output 
subplot(3,3,6)
bar(gs7, ave_gsQ7)                   %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/gs)')
title('Watershed 7');

%Make a bar graph of precipitation output 
subplot(3,3,9)
bar(gs7, ave_gsQ7)                   %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Total Precipitation (m/gs)')
title('Watershed 7');