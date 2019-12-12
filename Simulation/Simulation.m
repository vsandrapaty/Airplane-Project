%% Create a number of airplane objects to be simulated
 paraset1 = Paraset(3, 80.7394, 24.384, 0.65, 44.9056, 29.2608, "quarter spherical", "kevlar");
paraset2 = Paraset(3, 80.7394, 24.384, 0.65, 44.9056, 29.2608, "quarter spherical", "kevlar");
paraset3 = Paraset(3, 80.7394, 24.384, 0.65, 44.9056, 29.2608, "quarter spherical", "kevlar");
paraset = [paraset1, paraset2, paraset3];
A380 = Airplane(560000,361.8552,871.4305,"Airbus A380",555,[0;0;12801.6;163268000;0;0],paraset,.01357,1.6); 

%% Create a number of conditions objects to be simulated
    % Use randi(imax)
    index(1) = randi(11);
    index(2) = randi(30);
     while isempty(EPZwinds{index(1), index(2)})
            index(1) = randi(11);
            index(2) = randi(30);
     end
     santaTeresa = Conditions("Santa Teresa, New Mexico",305.3722, "N/A", "EPZ", EPZwinds{index(1), index(2)}); 
     trajectory1 = Trajectory(A380, santaTeresa);
%% Create a number of Paraset objects to be simulated
    % Start by trying 1/2, 2x, and 8x 
