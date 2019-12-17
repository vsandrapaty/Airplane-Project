function [A320, trajectories, bestDifference, indexOfBestDifference, diameterArray] = AreaFinder2(EPZwinds)
%m/s
targetVelocity = 6;
diameterArray = [60:1:99];
inflatedOverNominalDiameter = 5/6;
canopyMassPerArea = 0.1729;
tetherMassPerArea = 0.0962;
airplaneMass = 42600;
bottomReferenceArea = 108.5571;
frontalReferenceArea = 12.2537;
name = "A320";
numPassengers = 165;
cruisingVelocity = 241.789;
% Position in x,y,z, momentum in x,y,z
initialConditions = [0;0;12801.6;airplaneMass*cruisingVelocity;0;0];
xDragCoefficient = .01357;
zDragCoefficient = 1.6;

for i = 1:length(diameterArray)
    area = pi*((diameterArray(i))/2)^2;
    canopyMass = area*canopyMassPerArea;
    tetherMass = area*tetherMassPerArea;
    inflatedDiameter = inflatedOverNominalDiameter * diameterArray(i);
    
    paraset1 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset2 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset3 = Paraset(3, canopyMass, inflatedDiameter, 0.65, tetherMass, diameterArray(i), "quarter spherical", "kevlar");
    paraset = [paraset1, paraset2, paraset3];
    A320 = Airplane(airplaneMass,bottomReferenceArea,frontalReferenceArea,name,numPassengers,initialConditions,paraset,xDragCoefficient,zDragCoefficient); 
    santaTeresa = Conditions("Santa Teresa, New Mexico",305.3722, "N/A", "EPZ", EPZwinds{1,1}); 
    trajectories(i) = Trajectory(A320, santaTeresa);
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
end

