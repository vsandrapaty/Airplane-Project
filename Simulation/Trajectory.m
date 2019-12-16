classdef Trajectory
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        trajectoryVals
        time
    end
    
    %% Constructor
    methods
        function obj = Trajectory(airplane,conditions)
            %SIMULATION Construct an instance of this class
            %   Detailed explanation goes here
            [obj.time, obj.trajectoryVals] = recovery(airplane,conditions);
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
    methods
        function plotTrajectory3D(obj)
           x = obj.trajectoryVals(:,1);
           y = obj.trajectoryVals(:,2);
           z = obj.trajectoryVals(:,3);
           plot3(x,y,z);
        end
    end
end

