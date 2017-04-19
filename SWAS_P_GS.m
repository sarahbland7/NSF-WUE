%GROWING SEASON 

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
figure(7)
set(figure(7),'position',[0, 0, 1250, 750]);
%'position' // left, bottom, width, height
set(figure(7),'name','Yearly Precipitation Values // Growing Season','numbertitle','off')
%set name & turn off typical number title 



%PAINE RUN 
%Open up Paine Run data
[PAIN_NUMb,PAIN_TXTb,PAIN_RAWb] = xlsread('monthly_precipitation.xlsx','PAIN','A11:D287');

%PAIN_NUMb is a 286 x 1 (no text headers) double-precision array (numeric data)
%PAIN_TXTb is a 287 x 3 cell array (textual data)
%PAIN_RAWb is a 287 x 3 cell array (combination of numeric and textual data)

%Read in numeric data
PAIN_ppt = PAIN_NUMb(:,3);    
PAIN_year = PAIN_NUMb(:,1);         
PAIN_month = PAIN_NUMb(:,2);         

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyP1_GS = zeros(1, 23);
for i = 1:23
    ii = find(PAIN_year == wy(i) & (4 <= PAIN_month & PAIN_month <= 9));
    sum_wyP1_GS(i) = sum(PAIN_ppt(ii)).*0.001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,1)
bar(wy, sum_wyP1_GS)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Paine Run, SHEN');



%STAUNTON RIVER  
%Open up Staunton River data
[STAN_NUMb,STAN_TXTb,STAN_RAWb] = xlsread('monthly_precipitation.xlsx','STAN','A11:D287');

%Read in numeric data
STAN_ppt = STAN_NUMb(:,3);    
STAN_year = STAN_NUMb(:,1);         
STAN_month = STAN_NUMb(:,2);       

wy = 1993:2015;
sum_wyP2_GS = zeros(1, 23);
for i = 1:23
    ii = find(STAN_year == wy(i) & (4 <= STAN_month & STAN_month <= 9));
    sum_wyP2_GS(i) = sum(STAN_ppt(ii)).*0.001;   %convert from mm to m
end 


%Make a bar graph of output
subplot(2,2,2)
bar(wy, sum_wyP2_GS)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Staunton River, SHEN');



%PINEY RIVER 
%Open up Piney River data
[PINE_NUMb,PINE_TXTb,PINE_RAWb] = xlsread('monthly_precipitation.xlsx','PINE','A11:D287');

%Read in numeric data
PINE_ppt = PINE_NUMb(:,3);    
PINE_year = PINE_NUMb(:,1);         
PINE_month = PINE_NUMb(:,2);       

%Calculate annual precipitation in meters 
wy = 1993:2015;
sum_wyP3_GS = zeros(1, 23);
for i = 1:23
    ii = find(PINE_year == wy(i) & (4 <= PINE_month & PINE_month <= 9));
    sum_wyP3_GS(i) = sum(PINE_ppt(ii)).*0.001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,3)
bar(wy, sum_wyP3_GS)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('Piney River, SHEN');



%WHITE OAK RUN // FULL DATE RANGE
%Open up White Oak Run data
[WOR_NUMb,WOR_TXTb,WOR_RAWb] = xlsread('monthly_precipitation.xlsx','WOR','A11:D443');

%Read in numeric data
WOR_ppt = WOR_NUMb(:,3);    
WOR_year = WOR_NUMb(:,1);         
WOR_month = WOR_NUMb(:,2);       

wy = 1980:2015;
sum_wyP4_GS = zeros(1, 36);
for i = 1:36
    ii = find(WOR_year == wy(i) & (4 <= WOR_month & WOR_month <= 9));
    sum_wyP4_GS(i) = sum(WOR_ppt(ii)).*0.001;   %convert from mm to m
end 

%Make a bar graph of output
subplot(2,2,4)
bar(wy1, sum_wyP4_GS)
xlabel('Year');
ylabel('Yearly Precipitation (m)')
title('White Oak Run, SHEN');