classdef Conditions
    %CONDITIONS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        location
        %[z,zdot,x,xdot,y,ydot]
        initialConditions
        tOffset
        date
    end
    
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

