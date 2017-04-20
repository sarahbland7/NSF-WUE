% Student Name: Sarah Bland 
% Program Name: SWAS_P_WY.m // PROGRAM #3
% Description: Opens and analyzes precipitation (P) data for 4 SWAS sites in the 
% Shenandoah National Park by WATER YEAR.
%
% NOTE: Water year is defined for all SWAS sites as being from the final
% 1/4 of calendar year A through 3/4 of calendar year B (i.e. October - September).
% NOTE: Information obtained from the following sites:
% - https://pubs.usgs.gov/of/2013/1178/pdf/ofr2013-1178.pdf  - COORDINATES
% - https://my.usgs.gov/nnrw/site/show/47115 - COORDINATES
% - http://www.prism.oregonstate.edu/explorer/ - DATA SET 
% NOTE: Using monthly precipitation values (as opposed to sums of daily 
% precipitation values) to help mitigate any innacurracy from examining data  
% generated from the standard 4km PRISM grid cell.



%Make a subplot of all figures
figure(3)
clf(3)
set(figure(3),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(3),'name','Precipitation - Water Year','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN 
%Open up Paine Run data
[PAIN_NUM_P,PAIN_TXT_P,PAIN_RAW_P] = xlsread('monthly_P.xlsx','PAIN','A11:D287');
%PAIN_NUM_P is a 276 x 3 (no text headers) double-precision array (numeric data)
%PAIN_TXT_P is a 277 x 4 cell array (textual data)
%PAIN_RAW_P is a 277 x 4 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_ppt = PAIN_NUM_P(:,3);                 %Paine Run precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyPpa = sum(reshape(PAIN_ppt,12,23));	%sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyPpa(i) = sum_wyPpa(i) * .001;     %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,1)
bar(wy, sum_wyPpa)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Paine Run, SHEN');



%STAUNTON RIVER  
%Open up Staunton River data
[STAN_NUM_P,STAN_TXT_P,STAN_RAW_P] = xlsread('monthly_P.xlsx','STAN','A11:D287');

%Read in numeric data
STAN_ppt = STAN_NUM_P(:,3);                 %Staunton River precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyPst = sum(reshape(STAN_ppt,12,23));	%sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyPst(i) = sum_wyPst(i) * .001;     %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,2)
bar(wy, sum_wyPst)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUM_P,PINE_TXT_P,PINE_RAW_P] = xlsread('monthly_P.xlsx','PINE','A11:D287');

%Read in numeric data
PINE_ppt = PINE_NUM_P(:,3);                 %Piney River precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyPpi = sum(reshape(PINE_ppt,12,23));   %sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyPpi(i) = sum_wyPpi(i) * .001;     %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,3)
bar(wy, sum_wyPpi)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE
%Open up White Oak Run data
[WOR_NUM_P,WOR_TXT_P,WOR_RAW_P] = xlsread('monthly_P.xlsx','WOR','A11:D443');

%Read in numeric data
WOR_ppt = WOR_NUM_P(:,3);                   %White Oak Run precipitation (in mm)

%Calculate annual precipitation in meters 
wy1 = 1980:2015;
sum_wyPwh = sum(reshape(WOR_ppt,12,36));    %sum by incremements of 12 for 36 total
for i = 1:36
    sum_wyPwh(i) = sum_wyPwh(i) * .001;     %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,4)
bar(wy1, sum_wyPwh)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('White Oak Run, SHEN');