classdef Conditions
    %CONDITIONS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Constant)
        earthMass = 5.972*10^24; %kg
        G = 6.67*10^-11; %(N*m2^2)/(kg^2)
    end
    
    properties
        location 
        stationCode
        tOffset
        date
        windArray
    end
    
    %% Constructor
    methods
        function obj = Conditions(location,temperature,date)
            %CONDITIONS Construct an instance of this class
            %   Detailed explanation goes here
            obj.location = location;
           
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

