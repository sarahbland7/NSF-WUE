%Student Name: Sarah Bland 
%Program Name: SWAS_Base&Quick.m
%Description: Uses sep() function to separate discharge (Q) data for four SWAS
%sites into baseflow and quickflow values. 
%Resources: http://onlinelibrary.wiley.com/doi/10.1029/2011WR010977/full - CATCHMENT SIZES 



%PAINE RUN  
%Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
%Catchment Area = 12.4 km^2 * 0.386102 mi^2/km^2 = 4.79 mi^2

%Separate yearly discharge values into baseflow and quickflow
[PAIN_baseflow, PAIN_quickflow] = sep(PAIN_cfs, 4.79);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base1 = zeros(1, 23);
ave_Base1 = zeros(1,23);
total_Quick1 = zeros(1, 23);
ave_Quick1 = zeros(1,23);
for i = 1:23
    ii = find((PAIN_year == (wy(i) - 1) & PAIN_quart == 4) | (PAIN_year == wy(i) & PAIN_quart < 4));
    %returns indices of a given year (both 1st 1/4 of water year & 2nd 3/4 of water year)
    %using '|' and '&' for comparison of non-logical scalar values 
    total_Base1(i) = sum(conversion(PAIN_baseflow(ii)))/12400000;
    %ave_Base1(i) = conversion(mean(PAIN_baseflow(ii)))/12400000;
    total_Quick1(i) = sum(conversion(PAIN_quickflow(ii)))/12400000;
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
[STAN_baseflow, STAN_quickflow] = sep(STAN_cfs, 4.05);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base2 = zeros(1, 23);
total_Quick2 = zeros(1, 23);
for i = 1:23
    ii = find((STAN_year == (wy(i) - 1) & STAN_quart == 4) | (STAN_year == wy(i) & STAN_quart < 4));
    total_Base2(i) = conversion(sum(STAN_baseflow(ii)))/10500000;
    total_Quick2(i) = conversion(sum(STAN_quickflow(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end



%PINEY RIVER       
%Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
%Catchment Area =  12.6 km^2 * 0.386102 mi^2/km^2 = 4.86 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[PINE_baseflow, PINE_quickflow] = sep(PINE_cfs, 4.86);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
total_Base3 = zeros(1, 23);
total_Quick3 = zeros(1, 23);
for i = 1:23
    ii = find((PINE_year == (wy(i) - 1) & PINE_quart == 4) | (PINE_year == wy(i) & PINE_quart < 4));
    total_Base3(i) = conversion(sum(PINE_baseflow(ii)))/12600000;
    total_Quick3(i) = conversion(sum(PINE_quickflow(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end



%WHITE OAK RUN // FULL DATE RANGE  
%Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
%Catchment Area =  5.15 km^2 * 0.386102 mi^2/km^2 = 1.99 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[WOR_baseflow, WOR_quickflow] = sep(WOR_cfs2, 1.99);

%Calculate annual discharge in meters per water year
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
total_Base4 = zeros(1, 36);
total_Quick4 = zeros(1, 36);
for i = 1:36
    ii = find((WOR_year2 == (wy1(i) - 1) & WOR_quart2 == 4) | (WOR_year2 == wy1(i) & WOR_quart2 < 4));
    total_Base4(i) = conversion(sum(WOR_baseflow(ii)))/5150000;
    total_Quick4(i) = conversion(sum(WOR_quickflow(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end



%FUNCTION which converts cfs to m^3/wy
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)
end