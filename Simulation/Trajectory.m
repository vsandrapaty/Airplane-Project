classdef Trajectory
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        trajectory
    end
    
    %% Constructor
    methods
        function obj = trajectory(airplane,conditions)
            %SIMULATION Construct an instance of this class
            %   Detailed explanation goes here
            obj.trajectory = recovery(airplane,conditions);
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
    methods
        function = plotTrajectory3D(obj)
           x = obj.trajectory(:,2);
           y = obj.trajectory(:,3);
           z = obj.trajectory(:,4);
           plot3(x,y,z);
        end
end

