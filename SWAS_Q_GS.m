%GROWING SEASON 

%Student Name: Sarah Bland 
%Program Name: SWAS_Q.m
%Description: Opens and analyzes discharge (Q) data for four SWAS sites.
%Resources: http://onlinelibrary.wiley.com/doi/10.1029/2011WR010977/full - CATCHMENT SIZES 



%Make a subplot of all figures
figure(6)
set(figure(6),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(6),'name','Yearly Discharge Values // Growing Season','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN  
%Open up Paine Run data
[PAIN_NUMa,PAIN_TXTa,PAIN_RAWa] = xlsread('daily_discharge.xlsx','PAIN','A1:H8493');
%PAIN_NUMa is a 8492 x 7 (no text headers) double-precision array (numeric data)
%PAIN_TXTa is a 8493 x 8 cell array (textual data)
%PAIN_RAWa is a 8493 x 8 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_cfs = PAIN_NUMa(:,1);           %Paine Run discharge, cubic feet per second
PAIN_dateStage = PAIN_NUMa(:,3);     %Date Stage (all rows, 3rd column)
PAIN_year = PAIN_NUMa(:,4);          %Year (", 4th column)
PAIN_quart = PAIN_NUMa(:,5);         %Quarter (", 5th column)
PAIN_month = PAIN_NUMa(:,6);         %Month (", 6th column)
PAIN_day = PAIN_NUMa(:,7);           %Day (", 7th column)

%Make a plot of discharge 
subplot(2,5,1)
plot(PAIN_dateStage,PAIN_cfs);      %plots dates on x-axis by cfs data on y-axis
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Paine Run, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQ1_GS = zeros(1, 23);
for i = 1:23
    ii = find(PAIN_year == wy(i) & (4 <= PAIN_month & PAIN_month <= 9));
    %returns indices of a given year (both 1st 1/4 of water year & 2nd 3/4 of water year)
    %using '|' and '&' for comparison of non-logical scalar values 
    ave_wyQ1_GS(i) = conversion(mean(PAIN_cfs(ii)))/12400000;
    %(1) access cfs values for year's time (ft^3/second) (2) take mean of year's values
    %(3) make conversion (m^3/wy) (4) divide by catchment area of (m^2), resulting in (m/wy)
    %(5) store resulting values in arrray
    %Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
end

%Make a bar graph of output 
subplot(2,5,6)
bar(wy, ave_wyQ1_GS)                  %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Paine Run, SHEN');



%STAUNTON RIVER 
%Open up Staunton River data
[STAN_NUMa,STAN_TXTa,STAN_RAWa] = xlsread('daily_discharge.xlsx','STAN','A1:H8493');

%Read in numeric data
STAN_cfs = STAN_NUMa(:,1);           
STAN_dateStage = STAN_NUMa(:,3);    
STAN_year = STAN_NUMa(:,4);         
STAN_quart = STAN_NUMa(:,5);         
STAN_month = STAN_NUMa(:,6);        
STAN_day = STAN_NUMa(:,7);           

%Make a plot of discharge 
subplot(2,5,2)
plot(STAN_dateStage,STAN_cfs);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Staunton River, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQ2_GS = zeros(1, 23);
for i = 1:23
    ii = find(STAN_year == wy(i) & (4 <= STAN_month & STAN_month <= 9));
    ave_wyQ2_GS(i) = conversion(mean(STAN_cfs(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end

%Make a bar graph of output 
subplot(2,5,7)
bar(wy, ave_wyQ2_GS)
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUMa,PINE_TXTa,PINE_RAWa] = xlsread('daily_discharge.xlsx','PINE','A1:H8493');

%Read in numeric data
PINE_cfs = PINE_NUMa(:,1);         
PINE_dateStage = PINE_NUMa(:,3);    
PINE_year = PINE_NUMa(:,4);        
PINE_quart = PINE_NUMa(:,5);         
PINE_month = PINE_NUMa(:,6);      
PINE_day = PINE_NUMa(:,7);          

%Make a plot of discharge 
subplot(2,5,3)
plot(PINE_dateStage,PINE_cfs);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Piney River, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQ3_GS = zeros(1, 23);
for i = 1:23
    ii = find(PINE_year == wy(i) & (4 <= PINE_month & PINE_month <= 9));
    ave_wyQ3_GS(i) = conversion(mean(PINE_cfs(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end

%Make a bar graph of output 
subplot(2,5,8)
bar(wy, ave_wyQ3_GS)
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Piney River, SHEN');



%WHITE OAK RUN // SAME DATE RANGE AS OTHER TRANSECTS 
%Open up White Oak Run data
[WOR_NUM1a,WOR_TXT1a,WOR_RAW1a] = xlsread('daily_discharge.xlsx','WOR','A4720:H13211');

%Read in numeric data
WOR_cfs1 = WOR_NUM1a(:,1);         
WOR_dateStage1= WOR_NUM1a(:,3);    
WOR_year1 = WOR_NUM1a(:,4);        
WOR_quart1 = WOR_NUM1a(:,5);         
WOR_month1= WOR_NUM1a(:,6);      
WOR_day1= WOR_NUM1a(:,7);          

%Make a plot of discharge 
subplot(2,5,4)
plot(WOR_dateStage1,WOR_cfs1);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('White Oak Run, SHEN');

%Calculate annual discharge in meters per water year
%FROM 1993 - 2015 
wy = 1993:2015;
ave_wyQ4_GS = zeros(1, 23);
for i = 1:23
    ii = find(WOR_year1 == wy(i) & (4 <= WOR_month1 & WOR_month1 <= 9));
    ave_wyQ4_GS(i) = conversion(mean(WOR_cfs1(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end

%Make a bar graph of output 
subplot(2,5,9)
bar(wy, ave_wyQ4_GS)
xlabel('Year (1992 - 2015)');
ylabel('Average Stream Discharge (m/wy)')
title('White Oak Run, SHEN');



%WHITE OAK RUN // FULL DATE RANGE  
%Open up White Oak Run data
[WOR_NUM2a,WOR_TXT2a,WOR_RAW2a] = xlsread('daily_discharge.xlsx','WOR','A1:H13211');

%Read in numeric data
WOR_cfs2 = WOR_NUM2a(:,1);         
WOR_dateStage2= WOR_NUM2a(:,3);    
WOR_year2 = WOR_NUM2a(:,4);        
WOR_quart2 = WOR_NUM2a(:,5);         
WOR_month2= WOR_NUM2a(:,6);      
WOR_day2 = WOR_NUM2a(:,7);          

%Make a plot of discharge 
subplot(2,5,5)
plot(WOR_dateStage2,WOR_cfs2);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('White Oak Run, SHEN');

%Calculate annual discharge in meters per water year
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
ave_wyQ5_GS = zeros(1, 36);
for i = 1:36
    ii = find(WOR_year2 == wy1(i) & (4 <= WOR_month2 & WOR_month2 <= 9));
    ave_wyQ5_GS(i) = conversion(mean(WOR_cfs2(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end

%Make a bar graph of output 
subplot(2,5,10)
bar(wy1, ave_wyQ5_GS)
xlabel('Year (1980 - 2015)');
ylabel('Average Stream Discharge (m/wy)')
title('White Oak Run, SHEN');



%FUNCTION which converts cfs to m^3/growing season 
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1) * (182/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)* (days/growing season)
end