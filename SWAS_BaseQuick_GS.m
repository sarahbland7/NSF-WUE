% Student Name: Sarah Bland 
% Program Name: SWAS_BaseQuick_GS.m // PROGRAM #6
% Description: Uses sep() function to separate discharge (Q) data into baseflow and 
% quickflow values for 4 SWAS sites in the Shenandoah National Park by GROWING SEASON.
% NOTE: Growing season is defined for all SWAS sites as being from April - September.
% NOTE: Reliant upon data sets calculated in SWAS_Q_GS and SWAS_Q_GS.
%
% NOTE: Information obtained from the following sites:
% - http://onlinelibrary.wiley.com/doi/10.1029/2011WR010977/full - CATCHMENT SIZES 



%PAINE RUN  
%Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
%Catchment Area = 12.4 km^2 * 0.386102 mi^2/km^2 = 4.79 mi^2

%Separate yearly discharge values into baseflow and quickflow
[PAIN_baseflow_GS, PAIN_quickflow_GS] = sep(PAIN_cfs, 4.79);

%Calculate total quickflow/ baseflow in meters per growing season
wy = 1993:2015;
pa_base_GS = zeros(1, 23);
pa_quick_GS = zeros(1, 23);
for i = 1:23
    ii = find(PAIN_year == wy(i) & PAIN_month >= 4 & PAIN_month <= 9);
    %returns indices from April to September w/in a given calendar year/ water year
    %using '|' and '&' for comparison of non-logical scalar values 
    pa_base_GS(i) = sum(conversion(PAIN_baseflow_GS(ii)))/12.4e6;
    pa_quick_GS(i) = sum(conversion(PAIN_quickflow_GS(ii)))/12.4e6;
    %(1) access cfs values for year's time (ft^3/second) (2) take mean of year's values
    %(3) make conversion (m^3/wy) (4) divide by catchment area of (m^2), resulting in (m/wy)
    %(5) store resulting values in arrray
    %Catchment Area = 12.4 km^2 * 1000000 m^2/km^2 = 12400000 m^2 
end



%STAUNTON RIVER      
%Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
%Catchment Area =  10.5 km^2 * 0.386102 mi^2/km^2 = 4.05 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[STAN_baseflow_GS, STAN_quickflow_GS] = sep(STAN_cfs, 4.05);

%Calculate total quickflow/ baseflow in meters per growing season
wy = 1993:2015;
st_base_GS = zeros(1, 23);
st_quick_GS = zeros(1, 23);
for i = 1:23
    ii = find(STAN_year == wy(i) & (4 <= STAN_month & STAN_month <= 9));
    st_base_GS(i) = conversion(sum(STAN_baseflow_GS(ii)))/10500000;
    st_quick_GS(i) = conversion(sum(STAN_quickflow_GS(ii)))/10500000;
    %Catchment Area =  10.5 km^2 * 1000000 m^2/km^2 = 10500000 m^2 
end



%PINEY RIVER       
%Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
%Catchment Area =  12.6 km^2 * 0.386102 mi^2/km^2 = 4.86 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[PINE_baseflow_GS, PINE_quickflow_GS] = sep(PINE_cfs, 4.86);

%Calculate total quickflow/ baseflow in meters per growing season
wy = 1993:2015;
pi_base_GS = zeros(1, 23);
pi_quick_GS = zeros(1, 23);
for i = 1:23
    ii = find(PINE_year == wy(i) & (4 <= PINE_month & PINE_month <= 9));
    pi_base_GS(i) = conversion(sum(PINE_baseflow_GS(ii)))/12600000;
    pi_quick_GS(i) = conversion(sum(PINE_quickflow_GS(ii)))/12600000;
    %Catchment Area =  12.6 km^2 * 1000000 m^2/km^2 = 12600000 m^2 
end



%WHITE OAK RUN // FULL DATE RANGE  
%Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
%Catchment Area =  5.15 km^2 * 0.386102 mi^2/km^2 = 1.99 mi^2 

%Separate yearly discharge values into baseflow and quickflow
[WOR_baseflow_GS, WOR_quickflow_GS] = sep(WOR_cfs, 1.99);

%Calculate total quickflow/ baseflow in meters per growing season
%DATA FROM 1979 - 2015 
wy1 = 1980:2015;
wh_base_GS = zeros(1, 36);
wh_quick_GS = zeros(1, 36);
for i = 1:36
    ii = find(WOR_year == wy1(i) & (4 <= WOR_month & WOR_month <= 9));
    wh_base_GS(i) = conversion(sum(WOR_baseflow_GS(ii)))/5150000;
    wh_quick_GS(i) = conversion(sum(WOR_quickflow_GS(ii)))/5150000;
    %Catchment Area = 515 ha = 5.15 km^2 * 1000000 m^2/km^2 = 5150000 m^2 
end



%FUNCTION which converts cfs to m^3/gs
function y = conversion(x)
y = x * (1/35.314667) * (60/1) * (60/1) * (24/1);
%(ft^3/s) * (m^3/ft^3) * (s/min) * (min/hr) * (hr/day)
end