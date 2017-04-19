% Student Name: Sarah Bland 
% Program Name: FERN_PET_HMN.m
% Description: Uses temperature data and day length data to calculate PET for 
% 3 Fernow Experimental Forest sites.
% NOTE: Water year is defined for all Fernow sites as being from May 1 through April 30.
% NOTE: Growing season is defined for all Fernow sites as being from May 1 through October 31.



%OBTAIN TEMPERATURE DATA 
[TEMP_NUM,TEMP_TXT,TEMP_RAW] = xlsread('daily_T_Day.xlsx','Temperature','A1:G22938');
%TEMP_NUM is a 22937 x 6 (no text headers) double-precision array (numeric data)
%TEMP_TXT is a 22938 x 7 cell array (textual data)
%TEMP_RAW is a 22938 x 7 cell array (combination of numeric and textual data)

%Read in numeric data
Temp_Year = TEMP_NUM(:,3);           
Temp_Month = TEMP_NUM(:,1);     
Temp_Day = TEMP_NUM(:,2);             
Temp_Temp = TEMP_NUM(:,6);          



%OBTAIN DAYLENGTH DATA 
[DAY_NUM,DAY_TXT,DAY_RAW] = xlsread('daily_T_Day.xlsx','Daylength','A1:K367');
%DAY_NUM is a 366 x 11 (no text headers) double-precision array (numeric data)
%DAY_TXT is a 1 x 11 cell array (textual data)
%DAY_RAW is a 367 x 11 cell array (combination of numeric and textual data)

%Read in numeric data     
Daylen_Month = DAY_NUM(:,1);     
Daylen_Day = DAY_NUM(:,2);             
Daylen_Daylen = DAY_NUM(:,11); 



%CALCULATE DAILY PET  
daylen = zeros(1, 22937);        %for temporary checking on daylength values 
satVP_daily = zeros(1, 22937);   %for daily saturation vapor pressure
PET_daily = zeros(1, 22937);     %for daily PET final calculation

for i = 1:22937
    %Temp arrays have unique values while Daylen arrays do not
    %returns indices of position where days and months are the same (should be only one spot)
    
    day = Temp_Day(i);
    month = Temp_Month(i);
    year = Temp_Year(i);
    
    %index where day & month in the Daylen array correspond to Temp day & month
    ii = find(Daylen_Day == day & Daylen_Month == month);
    
    %temporary checking on daylength values 
    daylen(i) = Daylen_Daylen(ii);
    
    satVP_daily(i) = 0.611.* exp((17.502.* Temp_Temp(i))./(Temp_Temp(i) + 240.97)); 
    % in kilopascals
    PET_daily(i) = 29.8.* Daylen_Daylen(ii).* (satVP_daily(i)./(Temp_Temp(i) + 273.2)); 
    % in mm/day
end



%CALCULATE TOTAL PET PER WATER YEAR
%Water year operates on prior calendar year s.t. will relabel to be 1957-2014
wy = 1958:2015;
PET_waterYear = zeros(1, 58);

for i = 1:58
    ii = find((Temp_Year == (wy(i) - 1) & Temp_Month >= 5) | (Temp_Year == wy(i)) & Temp_Month <= 4);   
    PET_waterYear(i) = sum(PET_daily(ii));          %in mm/wy
    PET_waterYear(i) = PET_waterYear(i).*0.001;     %in m/wy
end



%CALCULATE TOTAL PET PER GROWING SEASON
%Growing season operates on appropriate calendar year s.t. 1957-2014 is correct
gs = 1957:2014;
PET_growingSeason = zeros(1, 58); 

for i = 1:58
    ii = find(Temp_Year == gs(i) & ((5 <= Temp_Month & Temp_Month <= 10)));  
    PET_growingSeason(i) = sum(PET_daily(ii));           %in mm/gs
    PET_growingSeason(i) = PET_growingSeason(i).*0.001;  %in m/gs 
end