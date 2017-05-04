% Student Name: Sarah Bland 
% Program Name: MovingWindow.m
% Description: Examines the ratio of the 20th & 40th percentile streamflow (mm) to precipitation 
% (mm) using a moving window with a calendar year time frame between 1956 & 2015. 



%EXTRACT STREAMFLOW AND PRECIPITATION DATA FROM SPREADSHEET 
%NOTE: All date ranges begin at November 11, 1956

%WATERSHED THREE  
[WS3_NUM,WS3_TXT,WS3_RAW] = xlsread('daily_Q_P.xlsx','WS3','A2013:F23622');
%Read in numeric data
WS3_year = WS3_NUM(:,3);           %Year
WS3_discharge = WS3_NUM(:,4);      %WS3 discharge, mm per day
WS3_precipitation = WS3_NUM(:,5);  %WS3 precipitation, mm per day

%WATERSHED FOUR  
[WS4_NUM,WS4_TXT,WS4_RAW] = xlsread('daily_Q_P.xlsx','WS4','A2013:F23622');
%Read in numeric data
WS4_year = WS4_NUM(:,3);           %Year
WS4_discharge = WS4_NUM(:,4);      %WS4 discharge, mm per day
WS4_precipitation = WS4_NUM(:,5);  %WS4 precipitation, mm per day

%WATERSHED SEVEN  
[WS7_NUM,WS7_TXT,WS7_RAW] = xlsread('daily_Q_P.xlsx','WS7','A1:F21611');
%Read in numeric data
WS7_year = WS7_NUM(:,3);           %Year
WS7_discharge = WS7_NUM(:,4);      %WS7 discharge, mm per day
WS7_precipitation = WS7_NUM(:,5);  %WS7 precipitation, mm per day



%PERFORM FOR() LOOP TO OBTAIN YEAR-LONG ANALYSIS 
%NOTE: Edge effects are such that we cannot examine the first 182 & last 182 days 
%years = 1956:2015;
kernel = [ones(1,182), ones(1,182)];                %Look forwards (1) & backwards (2) 182 days 

%WATERSHED THREE 
WS3_YRS = conv(WS3_year, kernel, 'valid');
for i=1:21247
    WS3_YRS(i) = (WS3_YRS(i)./364);
end
%Sum streamflow 
WS3_Q_SUM = conv(WS3_discharge, kernel, 'valid');   %Get sliding sums (w/o 0-padded values)
%Calculate streamflow percentiles
WS3_Q_PER20 = prctile(WS3_Q_SUM,20);                %For 20% 
WS3_Q_PER40 = prctile(WS3_Q_SUM,40);                %For 40%
%Sum precipitation 
WS3_P_SUM = conv(WS3_precipitation, kernel, 'valid');   

%WATERSHED FOUR
WS4_YRS = conv(WS4_year, kernel, 'valid');
for i=1:21247
    WS4_YRS(i) = (WS4_YRS(i)./364);
end
%Sum streamflow 
WS4_Q_SUM = conv(WS4_discharge, kernel, 'valid');   
%Calculate streamflow percentiles 
WS4_Q_PER20 = prctile(WS4_Q_SUM,20);
WS4_Q_PER40 = prctile(WS4_Q_SUM,40);
%Sum precipitation 
WS4_P_SUM = conv(WS4_precipitation, kernel, 'valid');   

%WATERSHED SEVEN
WS7_YRS = conv(WS7_year, kernel, 'valid');
for i=1:21247
    WS7_YRS(i) = (WS7_YRS(i)./364);
end
%Sum streamflow 
WS7_Q_SUM = conv(WS7_discharge, kernel, 'valid');   
%Calculate streamflow percentiles 
WS7_Q_PER20 = prctile(WS7_Q_SUM,20);
WS7_Q_PER40 = prctile(WS7_Q_SUM,40);
%Sum precipitation 
WS7_P_SUM = conv(WS7_precipitation, kernel, 'valid');   %Get sliding sums (w/o 0-padded values)



%DISPLAY THE DATA FOR 3 SITES @ 20%
figure(3)
clf
set(figure(3),'position',[0, 0, 1300, 1000]);
%'position' // left, bottom, width, height
set(figure(3),'name','Moving Window Analysis - 20th Percentile','numbertitle','off')
%set name & turn off typical number title 

subplot(3,1,1)
plot(WS3_YRS, (WS3_Q_PER20./WS3_P_SUM));       
xlabel('Time (yrs)');
ylabel('(20% Q) / P')
title('Watershed 3');

subplot(3,1,2)
plot(WS4_YRS, (WS4_Q_PER20./WS4_P_SUM));
xlabel('Time (yrs)');
ylabel('(20% Q) / P')
title('Watershed 4');

subplot(3,1,3)
plot(WS7_YRS, (WS7_Q_PER20./WS7_P_SUM));
xlabel('Time (yrs)');
ylabel('(20% Q) / P')
title('Watershed 7');



%DISPLAY THE DATA FOR 3 SITES @ 40%
figure(4)
clf
set(figure(4),'position',[0, 0, 1300, 1000]);
%'position' // left, bottom, width, height
set(figure(4),'name','Moving Window Analysis - 40th Percentile','numbertitle','off')
%set name & turn off typical number title 

subplot(3,1,1)
plot(WS3_YRS, (WS3_Q_PER40./WS3_P_SUM));       
xlabel('Time (yrs)');
ylabel('(40% Q) / P')
title('Watershed 3');

subplot(3,1,2)
plot(WS4_YRS, (WS4_Q_PER40./WS4_P_SUM));
xlabel('Time (yrs)');
ylabel('(40% Q) / P')
title('Watershed 4');

subplot(3,1,3)
plot(WS7_YRS, (WS7_Q_PER40./WS7_P_SUM));
xlabel('Time (yrs)');
ylabel('(40% Q) / P')
title('Watershed 7');



%COMPARISON OF WS3 & WS4 - 20% & 40% 
figure(5)
clf
set(figure(5),'position',[0, 0, 1300, 1250]);
%'position' // left, bottom, width, height
set(figure(5),'name','Moving Window Comparison - WS3 vs. WS4','numbertitle','off')
%set name & turn off typical number title 

subplot(4,1,1)
scatter((WS3_Q_PER20./WS3_P_SUM), (WS4_Q_PER20./WS4_P_SUM));       
xlabel('WS3');
ylabel('WS4')
title('Watershed 3 vs. Watershed 4 - 20th Percentile');

subplot(4,1,2)
plot(WS3_YRS, ((WS3_Q_PER20./WS3_P_SUM)./(WS4_Q_PER20./WS4_P_SUM)));       
xlabel('Time');
ylabel('WS3/WS4')
title('Time vs. (Watershed 3/Watershed 4) - 20th Percentile');

subplot(4,1,3)
scatter((WS3_Q_PER40./WS3_P_SUM), (WS4_Q_PER40./WS4_P_SUM));
xlabel('WS3');
ylabel('WS4')
title('Watershed 3 vs. Watershed 4 - 40th Percentile');

subplot(4,1,4)
plot(WS3_YRS, ((WS3_Q_PER40./WS3_P_SUM)./(WS4_Q_PER40./WS4_P_SUM)));       
xlabel('Time');
ylabel('WS3/WS4')
title('Time vs. (Watershed 3/Watershed 4) - 40th Percentile');



%COMPARISON OF WS3 & WS7 - 20% & 40% 
figure(6)
clf
set(figure(6),'position',[0, 0, 1300, 1250]);
%'position' // left, bottom, width, height
set(figure(6),'name','Moving Window Comparison - WS3 vs. WS7','numbertitle','off')
%set name & turn off typical number title 

subplot(4,1,1)
scatter((WS3_Q_PER20./WS3_P_SUM), (WS7_Q_PER20./WS7_P_SUM));       
xlabel('WS3');
ylabel('WS7')
title('Watershed 3 vs. Watershed 7 - 20th Percentile');

subplot(4,1,2)
plot(WS3_YRS, ((WS3_Q_PER20./WS3_P_SUM)./(WS7_Q_PER20./WS7_P_SUM)));       
xlabel('Time');
ylabel('WS3/WS7')
title('Time vs. (Watershed 3/Watershed 7) - 20th Percentile');

subplot(4,1,3)
scatter((WS3_Q_PER40./WS3_P_SUM), (WS7_Q_PER40./WS7_P_SUM));
xlabel('WS3');
ylabel('WS7')
title('Watershed 3 vs. Watershed 7 - 40th Percentile');

subplot(4,1,4)
plot(WS3_YRS, ((WS3_Q_PER40./WS3_P_SUM)./(WS7_Q_PER40./WS7_P_SUM)));       
xlabel('Time');
ylabel('WS3/WS7')
title('Time vs. (Watershed 3/Watershed 7) - 40th Percentile');