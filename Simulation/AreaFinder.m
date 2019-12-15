%m/s
targetVelocity = 6;
diameterArray = [200:1:400];
massPerArea = 147.418 / 466.98;
inflatedOverNominalDiameter = 5/6;
canopyMassPerArea = 0.1729;
tetherMassPerArea = 0.0962;
airplaneMass = 560000;
for i = 1:length(diameterArray)
    area = pi*((diameterArray(i))/2)^2;
    canopyMass = area*canopyMassPerArea;
    tetherMass = area*tetherMassPerArea;
    inflatedDiameter = inflatedOverNominalDiameter * diameterArray(i);
    
    paraset1 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset2 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset3 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset = [paraset1, paraset2, paraset3];
    A380 = Airplane(airplaneMass,361.8552,871.4305,"Airbus A380",555,[0;0;12801.6;163268000;0;0],paraset,.01357,1.6); 
    santaTeresa = Conditions("Santa Teresa, New Mexico",305.3722, "N/A", "EPZ", EPZwinds{1,1}); 
    trajectories(i) = Trajectory(A380, santaTeresa);
end
bestDifference = intmax;
for i = 1:length(diameterArray)
     landingVelocity = trajectories(i).trajectoryVals(end,6)/airplaneMass;
     difference = abs(landingVelocity) - targetVelocity;
     if abs(difference) <= bestDifference
         bestDifference = difference;
         indexOfBestDifference = i;
     end
end


