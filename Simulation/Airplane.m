classdef Airplane
    %AIRPLANE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties(Constant)
        earthMass = 5.972*10^24; %kg
        G = 6.67*10^-11; %(N*m^2)/(kg^2)
    end
    
    properties
        totalMass
        detachedMass
        fuelMass
        detachedSurfaceArea
        
    end
    
    methods
        function obj = Airplane(inputArg1,inputArg2)
            %AIRPLANE Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

