%Student Name: Sarah Bland 
%Author Name: Professor Remus Lupin  
%Program Name: sep.m
%Description: Separates an array of daily discharge values into its baseflow
%and quickflow componenents using a constant-slope method. 
%Resources: "Climate and vegetation water use efficiency at catchment scales"



function [baseflow, quickflow] = sep(Q, area)
%INPUT
% Q: daily discharge values, cfs
% area: catchment size, square miles 
%OUTPUT
% baseflow: baseflow discharge, cfs
% quickflow: quickflow discharge, cfs 

%Establish output arrays 
baseflow = zeros(1,length(Q));
quickflow = zeros(1,length(Q));

%Constant-slope separation line, converting cfs hr^-1 to cfs day^-1 for daily data
thresh_slope = 0.05.*area.*24;
%Values need to be converted to cfs/day
%Multiply (0.05cfs/ mi^2)(1/ hr) * (mi^2) * (24hr/ day)

%Conduct body of separation 
for t = 1:length(Q) 
    if t == 1   %initial conditions
        baseflow(t) = Q(t);
        quickflow(t) = 0;
    else        %not initial conditions       
        diffQ = Q(t) - Q(t-1);

        if diffQ >= thresh_slope || Q(t)> baseflow(t-1) + thresh_slope
            baseflow(t) = baseflow(t-1) + thresh_slope;
            quickflow(t) = Q(t) - baseflow(t);
        else
            baseflow(t) = Q(t);  %redefine baseflow
            quickflow(t) = 0;
        end
    end    
end

%Make graph for visualization 
figure(10);
clf(10);

time = 1:length(Q);
plot(time,Q,'b');  
hold on
plot(time,baseflow,'r');

xlabel('Time (days)');
ylabel('Discharge (cfs)')
title('Discharge Hydrograph');