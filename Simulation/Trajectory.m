classdef Trajectory
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        trajectoryVals
    end
    
    %% Constructor
    methods
        function obj = trajectory(airplane,conditions)
            %SIMULATION Construct an instance of this class
            %   Detailed explanation goes here
            obj.trajectoryVals = recovery(airplane,conditions);
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
    methods
        function plotTrajectory3D(obj)
           x = obj.trajectoryVals(:,2);
           y = obj.trajectoryVals(:,3);
           z = obj.trajectoryVals(:,4);
           plot3(x,y,z);
        end
    end
end

