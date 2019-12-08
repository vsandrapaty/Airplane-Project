classdef Conditions
    %CONDITIONS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Constant)
        earthMass = 5.972*10^24; %kg
        G = 6.67*10^-11; %(N*m2^2)/(kg^2)
        earthRadius = 6371071.027; %m
    end
    
    properties
        location 
        stationCode
        tOffset
        date
        % In matrix square, 1st column is height, 2nd column is westerly
        % wind, 3rd column is northerly wind
        windArray
    end
    
    %% Constructor
    methods
        function obj = Conditions(location,temperature,date,stationCode,windArray)
            %CONDITIONS Construct an instance of this class
            %   Detailed explanation goes here
            obj.location = location;
           
            [~,~,T] = atmos(0);
            tOffset = T - temperature;
            obj.tOffset = tOffset;
            obj.date = date;
            obj.stationCode = stationCode;
            obj.windArray = windArray;
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
        
        function g = getGravity(obj,heightOfPlane)
            g = (obj.G * obj.earthMass) / ((heightOfPlane + obj.earthRadius)^2);
        end
        function wind = getWind(obj,height)
            wind(1) = interp1(obj.windArray(:,1),obj.windArray(:,2),height);
            wind(2) = interp1(obj.windArray(:,1),obj.windArray(:,3),height);
            wind(3) = 0;
        end
    end
end

