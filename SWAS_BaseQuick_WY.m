% Student Name: Sarah Bland 
% Program Name: SWAS_BaseQuick_WY.m // PROGRAM #5
% Description: Uses sep() function to separate discharge (Q) data into baseflow and 
% quickflow values for 4 SWAS sites in the Shenandoah National Park by WATER YEAR.
% NOTE: Water year is defined for all Fernow sites as being from May 1 through April 30.
% NOTE: Reliant upon data sets calculated in SWAS_Q_WY and SWAS_Q_WY.
%
% NOTE: Information obtained from the following sites:
% - http://onlinelibrary.wiley.com/doi/10.1029/2011WR010977/full - CATCHMENT SIZES 



%PAINE RUN  
%Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
%Catchment Area = 12.4 km^2 * 0.386102 mi^2/km^2 = 4.79 mi^2

%Separate yearly discharge values into baseflow and quickflow
[PAIN_baseflow, PAIN_quickflow] = sep(PAIN_cfs, 4.79);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
pa_base_WY = zeros(1, 23);
pa_quick_WY = zeros(1, 23);
for i = 1:23
    ii = find((PAIN_year == (wy(i) - 1) & PAIN_quart == 4) | (PAIN_year == wy(i) & PAIN_quart < 4));
    %returns indices of a given water year (both 4th 1/4 of calendar year A & 1st 3/4 of calendar year B)
    %using '|' and '&' for comparison of non-logical scalar values 
    pa_base_WY(i) = sum(conversion(PAIN_baseflow(ii)))/12400000;
    pa_quick_WY(i) = sum(conversion(PAIN_quickflow(ii)))/12400000;
    %(1) access cfs values for year's time (ft^3/second) (2) take mean of year's values
    %(3) make conversion (m^3/wy) (4) divide by catchment area of (m^2), resulting in (m/wy)
    %(5) store resulting values in arrray
    %Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
end



%STAUNTON RIVER      
%Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
%Catchment Area =  10.5 km^2 * 0.386102 mi^2/km^2 = 4.05 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[STAN_baseflow, STAN_quickflow] = sep(STAN_cfs, 4.05);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
st_base_WY = zeros(1, 23);
st_quick_WY = zeros(1, 23);
for i = 1:23
    ii = find((STAN_year == (wy(i) - 1) & STAN_quart == 4) | (STAN_year == wy(i) & STAN_quart < 4));
    st_base_WY(i) = conversion(sum(STAN_baseflow(ii)))/10500000;
    st_quick_WY(i) = conversion(sum(STAN_quickflow(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end



%PINEY RIVER       
%Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
%Catchment Area =  12.6 km^2 * 0.386102 mi^2/km^2 = 4.86 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[PINE_baseflow, PINE_quickflow] = sep(PINE_cfs, 4.86);

%Calculate total annual quickflow/ baseflow in meters per water year
wy = 1993:2015;
pi_base_WY = zeros(1, 23);
pi_quick_WY = zeros(1, 23);
for i = 1:23
    ii = find((PINE_year == (wy(i) - 1) & PINE_quart == 4) | (PINE_year == wy(i) & PINE_quart < 4));
    pi_base_WY(i) = conversion(sum(PINE_baseflow(ii)))/12600000;
    pi_quick_WY(i) = conversion(sum(PINE_quickflow(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end



%WHITE OAK RUN // FULL DATE RANGE  
%Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
%Catchment Area =  5.15 km^2 * 0.386102 mi^2/km^2 = 1.99 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[WOR_baseflow, WOR_quickflow] = sep(WOR_cfs, 1.99);

%Calculate annual discharge in meters per water year
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
wh_base_WY = zeros(1, 36);
wh_quick_WY = zeros(1, 36);
for i = 1:36
    ii = find((WOR_year == (wy1(i) - 1) & WOR_quart == 4) | (WOR_year == wy1(i) & WOR_quart < 4));
    wh_base_WY(i) = conversion(sum(WOR_baseflow(ii)))/5150000;
    wh_quick_WY(i) = conversion(sum(WOR_quickflow(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end



%FUNCTION which converts cfs to m^3/wy
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)
end