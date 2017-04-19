%Student Name: Sarah Bland 
%Program Name: SWAS_P.m
%Description: Opens and analyzes precipitation (P) data for four SWAS sites.
%Resources: https://pubs.usgs.gov/of/2013/1178/pdf/ofr2013-1178.pdf  - COORDINATES
%           https://my.usgs.gov/nnrw/site/show/47115 - COORDINATES
%           http://www.prism.oregonstate.edu/explorer/ - DATA SET 
%{ 
NOTES: Using monthly precipitation values (as opposed to sums of daily 
precipitation values) to help mitigate any innacurracy from examining data  
generated from the standard 4km PRISM grid cell.
%}



%Make a subplot of all figures
%figure('name','Yearly Precipitation Values','numbertitle','off')
figure(2)
set(figure(2),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(2),'name','Yearly Precipitation Values','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN 
%Open up Paine Run data
[PAIN_NUMb,PAIN_TXTb,PAIN_RAWb] = xlsread('monthly_precipitation.xlsx','PAIN','A11:C287');

%PAIN_NUMb is a 286 x 1 (no text headers) double-precision array (numeric data)
%PAIN_TXTb is a 287 x 3 cell array (textual data)
%PAIN_RAWb is a 287 x 3 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_ppt = PAIN_NUMb(:,1);    %Paine Run precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyP1 = sum(reshape(PAIN_ppt,12,23));    %sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyP1(i) = sum_wyP1(i) * .001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,1)
bar(wy, sum_wyP1)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Paine Run, SHEN');



%STAUNTON RIVER  
%Open up Staunton River data
[STAN_NUMb,STAN_TXTb,STAN_RAWb] = xlsread('monthly_precipitation.xlsx','STAN','A11:C287');

%Read in numeric data
STAN_ppt = STAN_NUMb(:,1);    %Staunton River precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyP2 = sum(reshape(STAN_ppt,12,23));    %sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyP2(i) = sum_wyP2(i) * .001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,2)
bar(wy, sum_wyP2)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUMb,PINE_TXTb,PINE_RAWb] = xlsread('monthly_precipitation.xlsx','PINE','A11:C287');

%Read in numeric data
PINE_ppt = PINE_NUMb(:,1);    %Piney River precipitation (in mm)

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyP3 = sum(reshape(PINE_ppt,12,23));    %sum by incremements of 12 for 23 total
for i = 1:23
    sum_wyP3(i) = sum_wyP3(i) * .001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,3)
bar(wy, sum_wyP3)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE
%Open up White Oak Run data
[WOR_NUMb,WOR_TXTb,WOR_RAWb] = xlsread('monthly_precipitation.xlsx','WOR','A11:C443');

%Read in numeric data
WOR_ppt = WOR_NUMb(:,1);    %White Oak Run precipitation (in mm)

%Calculate annual precipitation in meters 
wy1 = 1980:2015;
sum_wyP4 = sum(reshape(WOR_ppt,12,36));    %sum by incremements of 12 for 36 total
for i = 1:36
    sum_wyP4(i) = sum_wyP4(i) * .001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,4)
bar(wy1, sum_wyP4)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('White Oak Run, SHEN');