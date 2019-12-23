%% The path that the plane took in three dimensions after the plane deployed 380
% saved as Plot1
trajectories380(133).plotTrajectory3D();
%% The path that the plane took in three dimensions after the plane deployed 320
% saved as Plot2
trajectories320(32).plotTrajectory3D();
%% X velocity vs time (A380)
% saved as Plot3
plot(trajectories380(133).time,trajectories380(133).trajectoryVals(:,4)/airplaneMass380);

%% X velocity vs time (A320)
% saved as Plot4
plot(trajectories320(32).time,trajectories320(32).trajectoryVals(:,4)/A320.getMass());

%% Z velocity vs time (A380)
% Saved as Plot5
plot(trajectories380(133).time,trajectories380(133).trajectoryVals(:,6)/airplaneMass380);

%% Z velocity vs time (A320)
% Saved as Plot6
plot(trajectories320(32).time,trajectories320(32).trajectoryVals(:,6)/A320.getMass());
