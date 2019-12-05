classdef Conditions
    %CONDITIONS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Constant)
        earthMass = 5.972*10^24; %kg
        G = 6.67*10^-11; %(N*m^2)/(kg^2)
    end
    
    properties
        location 
        stationCode
        %[z,zdot,x,xdot,y,ydot]
        initialConditions
        tOffset
        date
    end
    
    %% Constructor
    methods
        function obj = Conditions(location,initialConditions,temperature,date)
            %CONDITIONS Construct an instance of this class
            %   Detailed explanation goes here
            obj.location = location;
            obj.initialConditions = initialConditions;
           
            [~,~,T] = atmos(0);
            tOffset = T - temperature;
            obj.tOffset = tOffset;
            obj.date = date;
        end
    end
    
    %% Get methods
    methods
        function [rho,a,T,P,nu,z,sigma] = getAtmos(obj,h)
        %METHOD1 Summary of this method goes here
        %   Detailed explanation goes here
            [rho,a,T,P,nu,z,sigma] = atmos(h,'tOffset',obj.tOffset);
        end
        
        function density = getDensity(obj,h)
            density = atmos(h,'tOffset',obj.tOffset);
        end
    end
end

