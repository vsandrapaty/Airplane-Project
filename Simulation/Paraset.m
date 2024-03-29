classdef Paraset
    %PARASET Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
       numParachutes
       %individual parachute mass
       parachuteMass %kg
       inflatedDiameter %m
       dragCoefficient
       % encompasses the whole mass for 1 parachute line of one tether
       tetherMass %kg 
       nominalDiameter %m
       
       
    end
    
    properties
       shape
       material   
    end
    
    %% Constructor
    methods
        function obj = Paraset(numParachutes, parachuteMass, inflatedDiameter, dragCoefficient, tetherMass, nominalDiameter, shape, material)
            %PARASET Construct an instance of this class
            %   Detailed explanation goes here
            obj.numParachutes = numParachutes
            obj.parachuteMass = parachuteMass
            obj.inflatedDiameter = inflatedDiameter
            obj.dragCoefficient = dragCoefficient
            obj.tetherMass = tetherMass
            obj.nominalDiameter = nominalDiameter
            obj.shape = shape
            obj.material = material
        end
    end
    
    %% Getters
    methods
         function mass = getMass(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            mass = obj.numParachutes*(obj.tetherMass + obj.parachuteMass);
            
         end
        
          function drag = getDrag(obj, density, speed)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            area = (obj.inflatedDiameter/2)^2 * pi;
            drag = (1/2) * density * speed^2 * area * obj.dragCoefficient * obj.numParachutes;
            
          end
    end
end

