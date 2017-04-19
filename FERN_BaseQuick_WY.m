% Student Name: Sarah Bland 
% Program Name: FERN_BaseQuick_WY.m
% Description: Uses sep() function to separate discharge (Q) data into baseflow and 
% quickflow values for 3 Fernow Experimental Forest sites by WATER YEAR.
% NOTE: Water year is defined for all Fernow sites as being from May 1 through April 30.
% NOTE: Reliant upon data sets calculated in FERN_Q_P_WY and/or FERN_Q_P_GS. 



%WATERSHED THREE 
%Catchment Area = 34.27 ha * 0.00386102 mi^2/ha = 0.13 mi^2
%Catchment Area = 34.27 ha = 0.3427 km^2 * 1000000 m^2/km^2 = 342700 m^2 

%Separate discharge values into baseflow and quickflow
[WS3_baseflow, WS3_quickflow] = sep(WS3_discharge.*0.001.*34.27.*10000.*35.3147./24./60./60, 0.13);
%Discharge begins in mm/day & needs to be converted to cfs (i.e. ft^3/sec)
%Multiply (mm/ day) * (0.001m/ 1mm) * (ha) * (10000m^2/ 1ha) * (35.3147ft^3/ 1m^3) * (1day/ 24hr) 
%         * (1hr/ 60min) * (1min/ 60sec)

%Calculate average baseflow/ quickflow in meters per water year
wy3 = 1958:2015;
%Water year operates on prior calendar year s.t. will relabel to be 1957-2014
WS3_base_WY = zeros(1, 58);
WS3_quick_WY = zeros(1, 58);
for i = 1:58
    ii = find((WS3_year == (wy3(i) - 1) & WS3_month >= 5) | (WS3_year == wy3(i) & WS3_month <= 4));
    %sum every index at which a value exists w/in the water year
    WS3_base_WY(i) = conversion(sum(WS3_baseflow(ii)))./342700;
    WS3_quick_WY(i) = conversion(sum(WS3_quickflow(ii)))./342700;
    %make conversion to (m^3/wy), divide by catchment area of (m^2), result in (m/wy)
end



%WATERSHED FOUR
%Catchment Area = 38.73 hectares * 0.00386102 mi^2/ha = 0.15 mi^2
%Catchment Area = 38.73 ha = 0.3873 km^2 * 1000000 m^2/km^2 = 387300 m^2 

%Separate discharge values into baseflow and quickflow
[WS4_baseflow, WS4_quickflow] = sep(WS4_discharge.*0.001.*34.27.*10000.*35.3147./24./60./60, 0.15);

%Calculate average baseflow/ quickflow in meters per water year
wy4 = 1958:2015;
WS4_base_WY = zeros(1, 58);
WS4_quick_WY = zeros(1, 58);
for i = 1:58
    ii = find((WS4_year == (wy4(i) - 1) & WS4_month >= 5) | (WS4_year == wy4(i) & WS4_month <= 4));
    WS4_base_WY(i) = conversion(sum(WS4_baseflow(ii)))./387300;
    WS4_quick_WY(i) = conversion(sum(WS4_quickflow(ii)))./387300;
end



%WATERSHED SEVEN        
%Catchment Area = 24.22 hectares * 0.00386102 mi^2/ha = 0.09 mi^2 
%Catchment Area = 24.22 ha = 0.2422 km^2 * 1000000 m^2/km^2 = 242200 m^2

%Separate discharge values into baseflow and quickflow
[WS7_baseflow, WS7_quickflow] = sep(WS7_discharge.*0.001.*34.27.*10000.*35.3147./24./60./60, 0.09);

%Calculate average baseflow/ quickflow in meters per water year
wy7 = 1958:2015;
WS7_base_WY = zeros(1, 58);
WS7_quick_WY = zeros(1, 58);
for i = 1:58
    ii = find((WS7_year == (wy7(i) - 1) & WS7_month >= 5) | (WS7_year == wy7(i) & WS7_month <= 4));
    WS7_base_WY(i) = conversion(sum(WS7_baseflow(ii)))./242200;
    WS7_quick_WY(i) = conversion(sum(WS7_quickflow(ii)))./242200;
end



%FUNCTION which converts cfs to m^3
function y = conversion(x)
y = x * (1/35.3147) * (60/1) * (60/1) * (24/1);
%(ft^3/sec) * (m^3/ft^3) * (sec/min) * (min/hr) * (hr/day)
end