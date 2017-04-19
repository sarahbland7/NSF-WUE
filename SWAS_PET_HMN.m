%Student Name: Sarah Bland 
%Program Name: SWAS_PET_HMN.m
%Description: Uses PRISM temperature data and general day length data to calculate PET for 4 SWAS sites. 



%OBTAIN TEMPERATURE DATA 
[PET_NUMa,PET_TXTa,PET_RAWa] = xlsread('dailyTempDaylength.xlsx','Temperature','A11:D12429');
%PET_NUMa is a 12418 x 4 (no text headers) double-precision array (numeric data)
%PET_TXTa is a 1 x 4 cell array (textual data)
%PET_RAWa is a 12419 x 4 cell array (combination of numeric and textual data)

%Read in numeric data
Temp_Year = PET_NUMa(:,3);           
Temp_Month = PET_NUMa(:,1);     
Temp_Day = PET_NUMa(:,2);             
Temp_Temp = PET_NUMa(:,4);          



%OBTAIN DAYLENGTH DATA 
[PET_NUMb,PET_TXTb,PET_RAWb] = xlsread('dailyTempDaylength','Daylength','A1:K367');
%PET_NUMb is a 366 x 11 (no text headers) double-precision array (numeric data)
%PET_TXTb is a 1 x 11 cell array (textual data)
%PET_RAWb is a 367 x 11 cell array (combination of numeric and textual data)

%Read in numeric data     
Daylen_Month = PET_NUMb(:,1);     
Daylen_Day = PET_NUMb(:,2);             
Daylen_Daylen = PET_NUMb(:,11); 



%CALCULATE DAILY PET  
daylen = zeros(1, 12418);        %for temporary checking on daylength values 
satVP_daily = zeros(1, 12418);   %for daily saturation vapor pressure
PET_daily = zeros(1, 12418);     %for daily PET final calculation

for i = 1:12418
    %Temp arrays have unique values while Daylen arrays do not
    %returns indices of position where days and months are the same (should be only one spot)
    
    day = Temp_Day(i);
    month = Temp_Month(i);
    year = Temp_Year(i);
    
    %index where day & month in the Daylen array correspond to Temp day & month
    ii = find(Daylen_Day == day & Daylen_Month == month);
    
    %temporary checking on daylength values 
    daylen(i) = Daylen_Daylen(ii);
    
    satVP_daily(i) = 0.611.* exp((17.502.* Temp_Temp(i))./(Temp_Temp(i) + 240.97)); %kilopascals
    PET_daily(i) = 29.8.* Daylen_Daylen(ii).* (satVP_daily(i)./(Temp_Temp(i) + 273.2)); %mm/day
end



%CALCULATE TOTAL PET PER WATER YEAR
wy = 1982:2015;
PET_waterYear = zeros(1, 34);

for i = 1:34
    ii = find((Temp_Year == (wy(i) - 1) & Temp_Month >= 10) | (Temp_Year == wy(i)) & Temp_Month <= 9);   
    PET_waterYear(i) = sum(PET_daily(ii));   %millimeters/wy
    PET_waterYear(i) = PET_waterYear(i).*0.001;   %meters/wy
end



%CALCULATE TOTAL PET PER GROWING SEASON
gs = 1982:2015;
PET_growingSeason = zeros(1, 34); 

for i = 1:34
    ii = find(Temp_Year == gs(i) & ((4 <= Temp_Month & Temp_Month <= 9)));  
    PET_growingSeason(i) = sum(PET_daily(ii));   %millimeters/growing season
    PET_growingSeason(i) = PET_growingSeason(i).*0.001;   %meters/growing season 
end