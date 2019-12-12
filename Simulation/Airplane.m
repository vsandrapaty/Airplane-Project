classdef Airplane
    %AIRPLANE Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Mass
        bottomReferenceArea
        frontalReferenceArea
    end

    properties
        Name
        NumPassengers
        % Column Vector containing (x,y,z) (x dot, y dot, z dot)
        initialConditions
    end

    properties
        Parasets
        XDragCoefficient
        ZDragCoefficient
    end

    methods
        function obj = Airplane(Mass, bottomReferenceArea, frontalReferenceArea, Name, NumPassengers, initialConditions, Parasets, XDragCoefficient, ZDragCoefficient)
            %AIRPLANE Construct an instance of this class
            %   Detailed explanation goes here
            obj.Mass = Mass;
            obj.bottomReferenceArea = bottomReferenceArea;
            obj.frontalReferenceArea = frontalReferenceArea;
            obj.Name = Name;
            obj.NumPassengers = NumPassengers;
            obj.initialConditions = initialConditions;
            obj.Parasets = Parasets;
            obj.XDragCoefficient = XDragCoefficient;
            obj.ZDragCoefficient = ZDragCoefficient;

        end

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
%% Getter
    methods
        function XDrag = getXDrag(obj, density, speed)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            XDrag = (1/2) * density * speed^2 * obj.frontalReferenceArea * obj.XDragCoefficient + obj.Parasets(1).getDrag(density, speed);
        end
    end
%% Getter
    methods
        function ZDrag = getZDrag(obj, density, speed)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            ZDrag = (1/2) * density * speed^2 * obj.bottomReferenceArea * obj.ZDragCoefficient + obj.Parasets(2).getDrag(density, speed) + obj.Parasets(3).getDrag(density, speed);
        end
        function Mass = getMass(obj)
            Mass = obj.Mass;
        end
        function initialConditions = getInitialConditions(obj)
            initialConditions = obj.initialConditions;
        end
    end
end
