classdef Paraset
    %PARASET Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        numParachutes
       %individual parachute mass
       parachuteMass %kg
       diameter %m
       dragCoefficient
       % encompasses the whole mass for 1 parachute line of one tether
       tetherMass %kg
       tetherLength %m   
       porosity  
    end
    
    properties
       shape
       chuteMaterial
       tetherMaterial    
    end
    
    methods
        function obj = Paraset(inputArg1,inputArg2)
            %PARASET Construct an instance of this class
            %   Detailed explanation goes here
            obj.Property1 = inputArg1 + inputArg2;
        end
        
        function mass = getMass(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            mass = obj.numParachutes*(obj.tetherMass + obj.parachuteMass);
        end
    end
end

