%GROWING SEASON 

%Student Name: Sarah Bland 
%Program Name: SWAS_Base&Quick.m
%Description: Uses sep() function to separate discharge (Q) data for four SWAS
%sites into baseflow and quickflow values. 
%Resources: http://onlinelibrary.wiley.com/doi/10.1029/2011WR010977/full - CATCHMENT SIZES 



%PAINE RUN  
%Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
%Catchment Area = 12.4 km^2 * 0.386102 mi^2/km^2 = 4.79 mi^2

%Separate yearly discharge values into baseflow and quickflow
[PAIN_baseflow_GS, PAIN_quickflow_GS] = sep(PAIN_cfs, 4.79);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base1_GS = zeros(1, 23);
total_Quick1_GS = zeros(1, 23);
for i = 1:23
    ii = find(PAIN_year == wy(i) & PAIN_month >= 4 & PAIN_month <= 9);
    %returns indices of a given year (both 1st 1/4 of water year & 2nd 3/4 of water year)
    %using '|' and '&' for comparison of non-logical scalar values 
    total_Base1_GS(i) = sum(conversion(PAIN_baseflow_GS(ii)))/12.4e6;
    %ave_Base1(i) = conversion(mean(PAIN_baseflow(ii)))/12400000;
    total_Quick1_GS(i) = sum(conversion(PAIN_quickflow_GS(ii)))/12.4e6;
    %ave_Quick1(i) = conversion(mean(PAIN_quickflow(ii)))/12400000;
    %(1) access cfs values for year's time (ft^3/second) (2) take mean of year's values
    %(3) make conversion (m^3/wy) (4) divide by catchment area of (m^2), resulting in (m/wy)
    %(5) store resulting values in arrray
    %Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
end
%total_Base1b = sum(reshape(PAIN_baseflow,365,23));    %sum by incremements of 12 for 23 total


%STAUNTON RIVER      
%Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
%Catchment Area =  10.5 km^2 * 0.386102 mi^2/km^2 = 4.05 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[STAN_baseflow_GS, STAN_quickflow_GS] = sep(STAN_cfs, 4.05);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base2_GS = zeros(1, 23);
total_Quick2_GS = zeros(1, 23);
for i = 1:23
    ii = find(STAN_year == wy(i) & (4 <= STAN_month & STAN_month <= 9));
    total_Base2_GS(i) = conversion(sum(STAN_baseflow_GS(ii)))/10500000;
    total_Quick2_GS(i) = conversion(sum(STAN_quickflow_GS(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end



%PINEY RIVER       
%Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
%Catchment Area =  12.6 km^2 * 0.386102 mi^2/km^2 = 4.86 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[PINE_baseflow_GS, PINE_quickflow_GS] = sep(PINE_cfs, 4.86);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base3_GS = zeros(1, 23);
total_Quick3_GS = zeros(1, 23);
for i = 1:23
    ii = find(PINE_year == wy(i) & (4 <= PINE_month & PINE_month <= 9));
    total_Base3_GS(i) = conversion(sum(PINE_baseflow_GS(ii)))/12600000;
    total_Quick3_GS(i) = conversion(sum(PINE_quickflow_GS(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end



%WHITE OAK RUN // FULL DATE RANGE  
%Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
%Catchment Area =  5.15 km^2 * 0.386102 mi^2/km^2 = 1.99 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[WOR_baseflow_GS, WOR_quickflow_GS] = sep(WOR_cfs2, 1.99);

%Calculate annual discharge in meters per water year
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
total_Base4_GS = zeros(1, 36);
total_Quick4_GS = zeros(1, 36);
for i = 1:36
    ii = find(WOR_year2 == wy1(i) & (4 <= WOR_month2 & WOR_month2 <= 9));
    total_Base4_GS(i) = conversion(sum(WOR_baseflow_GS(ii)))/5150000;
    total_Quick4_GS(i) = conversion(sum(WOR_quickflow_GS(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end



%FUNCTION which converts cfs to m^3
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)
end