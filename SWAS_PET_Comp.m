%Student Name: Sarah Bland 
%Program Name: SWAS_PET_Comp.m
%Description: Plot MOPEX PET calculations vs. Hamon PET calculations 

%Make a subplot of 4 figures 
figure(10)
clf
set(figure(10),'name','Two Methods for Calculating PET','numbertitle','off')

hold on
plot(1982:2003, PET_waterYear_MPX, '*')
plot(1982:2015, PET_waterYear, '+')
plot(1982:2003, PET_growingSeason_MPX, 'o')
plot(1982:2015, PET_growingSeason, 'x')
legend('WY Mopex', 'WY Hamon', 'GS Mopex', 'GS Hamon')
hold off

xlabel('Time'); 
ylabel('PET Values')
