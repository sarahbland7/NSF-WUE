%Student Name: Sarah Bland 
%Program Name: SWAS_PET_MOPEX.m
%Description: Uses MOPEX data set to calculate PET for USGS 01628500 
%(i.e. Shenandoah River near Lynnwood, VA)



%OBTAIN PET DATA 
[PET_MPX_NUM,PET_MPX_TXT,PET_MPX_RAW] = xlsread('PET_data.xlsx','SWAS','A12056:H20455');
%PET_MPX_NUM is a 20454 x 8 (no text headers) double-precision array (numeric data)
%PET_MPX_TXT is a 20455 x 8 cell array (textual data)
%PET_MPX_RAW is a 20455 x 8 cell array (combination of numeric and textual data)

%Read in numeric data
PET_Year = PET_MPX_NUM(:,1);           
PET_Month = PET_MPX_NUM(:,2);     
PET_Day = PET_MPX_NUM(:,3);             
PET_PET = PET_MPX_NUM(:,5);          



%CALCULATE TOTAL PET PER WATER YEAR
wy = 1982:2003;
PET_waterYear_MPX = zeros(1, 22);

for i = 1:22
    ii = find((PET_Year == (wy(i) - 1) & PET_Month >= 10) | (PET_Year == wy(i)) & PET_Month <= 9);   
    PET_waterYear_MPX(i) = sum(PET_PET(ii));   %millimeters/wy
    PET_waterYear_MPX(i) = PET_waterYear_MPX(i).*0.001;   %meters/wy
end



%CALCULATE TOTAL PET PER GROWING SEASON
gs = 1982:2003;
PET_growingSeason_MPX = zeros(1, 22); 

for i = 1:22
    ii = find(PET_Year == gs(i) & ((4 <= PET_Month & PET_Month <= 9)));
    PET_growingSeason_MPX(i) = sum(PET_PET(ii));   %millimeters/growing season
    PET_growingSeason_MPX(i) = PET_growingSeason_MPX(i).*0.001;   %meters/growing season 
end