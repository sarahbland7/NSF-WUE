% Student Name: Sarah Bland 
% Program Name: SWAS_Q_WY.m // PROGRAM #1
% Description: Opens and analyzes discharge (Q) data for 4 SWAS sites in the 
% Shenandoah National Park by WATER YEAR.
%
% NOTE: Water year is defined for all SWAS sites as being from the final
% 1/4 of calendar year A through 3/4 of calendar year B (i.e. October - September).
% NOTE: Growing season is defined for all SWAS sites as being from April - September.



%Make a subplot of all figures
figure(1)
clf(1)
set(figure(1),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(1),'name','Discharge - Water Year','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN  
%Open up Paine Run data
[PAIN_NUM_Q,PAIN_TXT_Q,PAIN_RAW_Q] = xlsread('daily_Q.xlsx','PAIN','A1:H8493');
%PAIN_NUM_Q is a 8492 x 7 (no text headers) double-precision array (numeric data)
%PAIN_TXT_Q is a 8493 x 8 cell array (textual data)
%PAIN_RAW_Q is a 8493 x 8 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_cfs = PAIN_NUM_Q(:,1);           %Paine Run discharge, cubic feet per second
PAIN_dateStage = PAIN_NUM_Q(:,3);     %Date Stage (all rows, 3rd column)
PAIN_year = PAIN_NUM_Q(:,4);          %Year (", 4th column)
PAIN_quart = PAIN_NUM_Q(:,5);         %Quarter (", 5th column)
PAIN_month = PAIN_NUM_Q(:,6);         %Month (", 6th column)
PAIN_day = PAIN_NUM_Q(:,7);           %Day (", 7th column)

%Make a plot of discharge 
subplot(2,4,1)
plot(PAIN_dateStage,PAIN_cfs);      %plots dates on x-axis by cfs data on y-axis
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Paine Run, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQpa = zeros(1, 23);
for i = 1:23
    ii = find((PAIN_year == (wy(i) - 1) & PAIN_quart == 4) | (PAIN_year == wy(i) & PAIN_quart < 4));
    %returns indices of a given water year (both 4th 1/4 of calendar year A & 1st 3/4 of calendar year B)
    %using '|' and '&' for comparison of non-logical scalar values 
    ave_wyQpa(i) = conversion(mean(PAIN_cfs(ii)))/12400000;
    %(1) access cfs values for year's time (ft^3/second) (2) take mean of year's values
    %(3) make conversion (m^3/wy) (4) divide by catchment area of (m^2), resulting in (m/wy)
    %(5) store resulting values in array
    %Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
end

%Make a bar graph of output 
subplot(2,4,5)
bar(wy, ave_wyQpa)                  %plots years on x-axis by m/wy
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Paine Run, SHEN');



%STAUNTON RIVER 
%Open up Staunton River data
[STAN_NUM_Q,STAN_TXT_Q,STAN_RAW_Q] = xlsread('daily_Q.xlsx','STAN','A1:H8493');

%Read in numeric data
STAN_cfs = STAN_NUM_Q(:,1);           
STAN_dateStage = STAN_NUM_Q(:,3);    
STAN_year = STAN_NUM_Q(:,4);         
STAN_quart = STAN_NUM_Q(:,5);         
STAN_month = STAN_NUM_Q(:,6);        
STAN_day = STAN_NUM_Q(:,7);           

%Make a plot of discharge 
subplot(2,4,2)
plot(STAN_dateStage,STAN_cfs);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Staunton River, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQst = zeros(1, 23);
for i = 1:23
    ii = find((STAN_year == (wy(i) - 1) & STAN_quart == 4) | (STAN_year == wy(i) & STAN_quart < 4));
    ave_wyQst(i) = conversion(mean(STAN_cfs(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end

%Make a bar graph of output 
subplot(2,4,6)
bar(wy, ave_wyQst)
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUM_Q,PINE_TXT_Q,PINE_RAW_Q] = xlsread('daily_Q.xlsx','PINE','A1:H8493');

%Read in numeric data
PINE_cfs = PINE_NUM_Q(:,1);         
PINE_dateStage = PINE_NUM_Q(:,3);    
PINE_year = PINE_NUM_Q(:,4);        
PINE_quart = PINE_NUM_Q(:,5);         
PINE_month = PINE_NUM_Q(:,6);      
PINE_day = PINE_NUM_Q(:,7);          

%Make a plot of discharge 
subplot(2,4,3)
plot(PINE_dateStage,PINE_cfs);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('Piney River, SHEN');

%Calculate annual discharge in meters per water year
wy = 1993:2015;
ave_wyQpi = zeros(1, 23);
for i = 1:23
    ii = find((PINE_year == (wy(i) - 1) & PINE_quart == 4) | (PINE_year == wy(i) & PINE_quart < 4));
    ave_wyQpi(i) = conversion(mean(PINE_cfs(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end

%Make a bar graph of output 
subplot(2,4,7)
bar(wy, ave_wyQpi)
xlabel('Year');
ylabel('Average Stream Discharge (m/wy)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE  
%Open up White Oak Run data
[WOR_NUM_Q,WOR_TXT_Q,WOR_RAW_Q] = xlsread('daily_Q.xlsx','WOR','A1:H13211');

%Read in numeric data
WOR_cfs = WOR_NUM_Q(:,1);         
WOR_dateStage= WOR_NUM_Q(:,3);    
WOR_year = WOR_NUM_Q(:,4);        
WOR_quart = WOR_NUM_Q(:,5);         
WOR_month= WOR_NUM_Q(:,6);      
WOR_day = WOR_NUM_Q(:,7);          

%Make a plot of discharge 
subplot(2,4,4)
plot(WOR_dateStage,WOR_cfs);      
datetick('x',10);                         
xlabel('Year');
ylabel('Stream Discharge (cfs)')
title('White Oak Run, SHEN');

%Calculate annual discharge in meters per water year
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
ave_wyQwh = zeros(1, 36);
for i = 1:36
    ii = find((WOR_year == (wy1(i) - 1) & WOR_quart == 4) | (WOR_year == wy1(i) & WOR_quart < 4));
    ave_wyQwh(i) = conversion(mean(WOR_cfs(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end

%Make a bar graph of output 
subplot(2,4,8)
bar(wy1, ave_wyQwh)
xlabel('Year (1980 - 2015)');
ylabel('Average Stream Discharge (m/wy)')
title('White Oak Run, SHEN');



%FUNCTION which converts cfs to m^3/wy
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1) * (365.25/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)* (day/wy)
end