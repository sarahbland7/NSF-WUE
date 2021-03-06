% Student Name: Sarah Bland 
% Program Name: SWAS_P_GS.m // PROGRAM #4
% Description: Opens and analyzes precipitation (P) data for 4 SWAS sites in the 
% Shenandoah National Park by WATER YEAR.
%
% NOTE: Growing season is defined for all SWAS sites as being from April - September.
% NOTE: Information obtained from the following sites:
% - https://pubs.usgs.gov/of/2013/1178/pdf/ofr2013-1178.pdf  - COORDINATES
% - https://my.usgs.gov/nnrw/site/show/47115 - COORDINATES
% - http://www.prism.oregonstate.edu/explorer/ - DATA SET 
% NOTE: Using monthly precipitation values (as opposed to sums of daily 
% precipitation values) to help mitigate any innacurracy from examining data  
% generated from the standard 4km PRISM grid cell.



%Make a subplot of all figures
figure(4)
clf(4)
set(figure(4),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(4),'name','Precipitation - Growing Season','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN 
%Open up Paine Run data
[PAIN_NUM_P,PAIN_TXT_P,PAIN_RAW_P] = xlsread('monthly_P.xlsx','PAIN','A11:D287');
%PAIN_NUM_P is a 276 x 3 (no text headers) double-precision array (numeric data)
%PAIN_TXT_P is a 277 x 4 cell array (textual data)
%PAIN_RAW_P is a 277 x 4 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_ppt = PAIN_NUM_P(:,3);    
PAIN_year = PAIN_NUM_P(:,1);         
PAIN_month = PAIN_NUM_P(:,2);         

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_gsPpa = zeros(1, 23);
for i = 1:23
    ii = find(PAIN_year == wy(i) & (4 <= PAIN_month & PAIN_month <= 9));
    sum_gsPpa(i) = sum(PAIN_ppt(ii)).*0.001;        %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,1)
bar(wy, sum_gsPpa)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Paine Run, SHEN');



%STAUNTON RIVER  
%Open up Staunton River data
[STAN_NUM_P,STAN_TXT_P,STAN_RAW_P] = xlsread('monthly_P.xlsx','STAN','A11:D287');

%Read in numeric data
STAN_ppt = STAN_NUM_P(:,3);    
STAN_year = STAN_NUM_P(:,1);         
STAN_month = STAN_NUM_P(:,2);       

wy = 1993:2015;
sum_gsPst = zeros(1, 23);
for i = 1:23
    ii = find(STAN_year == wy(i) & (4 <= STAN_month & STAN_month <= 9));
    sum_gsPst(i) = sum(STAN_ppt(ii)).*0.001;   %convert from mm to m
end 


%Make a bar graph of output
subplot(2,2,2)
bar(wy, sum_gsPst)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUM_P,PINE_TXT_P,PINE_RAW_P] = xlsread('monthly_P.xlsx','PINE','A11:D287');

%Read in numeric data
PINE_ppt = PINE_NUM_P(:,3);    
PINE_year = PINE_NUM_P(:,1);         
PINE_month = PINE_NUM_P(:,2);       

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_gsPpi = zeros(1, 23);
for i = 1:23
    ii = find(PINE_year == wy(i) & (4 <= PINE_month & PINE_month <= 9));
    sum_gsPpi(i) = sum(PINE_ppt(ii)).*0.001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,3)
bar(wy, sum_gsPpi)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE
%Open up White Oak Run data
[WOR_NUM_P,WOR_TXT_P,WOR_RAW_P] = xlsread('monthly_P.xlsx','WOR','A11:D443');

%Read in numeric data
WOR_ppt = WOR_NUM_P(:,3);    
WOR_year = WOR_NUM_P(:,1);         
WOR_month = WOR_NUM_P(:,2);       

wy1 = 1980:2015;
sum_gsPwh = zeros(1, 36);
for i = 1:36
    ii = find(WOR_year == wy1(i) & (4 <= WOR_month & WOR_month <= 9));
    sum_gsPwh(i) = sum(WOR_ppt(ii)).*0.001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,4)
bar(wy1, sum_gsPwh)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('White Oak Run, SHEN');