% Student Name: Sarah Bland 
% Program Name: SWAS_PET_HMN.m
% Description: Uses PRISM temperature data and general day length data to calculate PET for 
% 4 SWAS sites in the Shenandoah National Park. 
% NOTE: Water year is defined for all SWAS sites as being from the final
% 1/4 of calendar year A through 3/4 of calendar year B (i.e. October - September).
% NOTE: Growing season is defined for all SWAS sites as being from April - September.



%OBTAIN TEMPERATURE DATA 
[S_TEMP_NUM,S_TEMP_TXT,S_TEMP_RAW] = xlsread('daily_T_Day.xlsx','Temperature','A11:D12429');
%S_TEMP_NUM is a 12418 x 4 (no text headers) double-precision array (numeric data)
%S_TEMP_TXT is a 1 x 4 cell array (textual data)
%S_TEMP_RAW is a 12419 x 4 cell array (combination of numeric and textual data)

%Read in numeric data
Temp_Year = S_TEMP_NUM(:,3);           
Temp_Month = S_TEMP_NUM(:,1);     
Temp_Day = S_TEMP_NUM(:,2);             
Temp_Temp = S_TEMP_NUM(:,4);          



%OBTAIN DAYLENGTH DATA 
[S_DAY_NUM,S_DAY_TXT,S_DAY_RAW] = xlsread('daily_T_Day.xlsx','Daylength','A1:K367');
%S_DAY_NUM is a 366 x 11 (no text headers) double-precision array (numeric data)
%S_DAY_TXT is a 1 x 11 cell array (textual data)
%S_DAY_RAW is a 367 x 11 cell array (combination of numeric and textual data)

%Read in numeric data     
Daylen_Month = S_DAY_NUM(:,1);     
Daylen_Day = S_DAY_NUM(:,2);             
Daylen_Daylen = S_DAY_NUM(:,11); 



%CALCULATE DAILY PET  
S_daylen = zeros(1, 12418);        %for temporary checking on daylength values 
S_satVP_daily = zeros(1, 12418);   %for daily saturation vapor pressure
S_PET_daily = zeros(1, 12418);     %for daily PET final calculation

for i = 1:12418
    %Temp arrays have unique values while Daylen arrays do not
    %returns indices of position where days and months are the same (should be only one spot)
    
    day = Temp_Day(i);
    month = Temp_Month(i);
    year = Temp_Year(i);
    
    %index where day & month in the Daylen array correspond to Temp day & month
    ii = find(Daylen_Day == day & Daylen_Month == month);
    
    %temporary checking on daylength values 
    S_daylen(i) = Daylen_Daylen(ii);
    
    S_satVP_daily(i) = 0.611.* exp((17.502.* Temp_Temp(i))./(Temp_Temp(i) + 240.97)); %kilopascals
    S_PET_daily(i) = 29.8.* Daylen_Daylen(ii).* (S_satVP_daily(i)./(Temp_Temp(i) + 273.2)); %mm/day
end



%CALCULATE TOTAL PET PER WATER YEAR
wy = 1982:2015;
S_PET_wy = zeros(1, 34);

for i = 1:34
    ii = find((Temp_Year == (wy(i) - 1) & Temp_Month >= 10) | (Temp_Year == wy(i)) & Temp_Month <= 9);   
    S_PET_wy(i) = sum(S_PET_daily(ii));          %in mm/wy
    S_PET_wy(i) = S_PET_wy(i).*0.001;            %in m/wy
end



%CALCULATE TOTAL PET PER GROWING SEASON
gs = 1982:2015;
S_PET_gs = zeros(1, 34); 

for i = 1:34
    ii = find(Temp_Year == gs(i) & ((4 <= Temp_Month & Temp_Month <= 9)));  
    S_PET_gs(i) = sum(S_PET_daily(ii));            %in mm/gs
    S_PET_gs(i) = S_PET_gs(i).*0.001;              %in m/gs 
end