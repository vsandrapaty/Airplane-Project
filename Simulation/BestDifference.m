bestDifference = intmax;
for i = 1:length(diameterArray)
     landingVelocity = trajectories(i).trajectoryVals(end,6)/airplaneMass;
     difference = abs(landingVelocity) - targetVelocity;
     if abs(difference) <= bestDifference
         bestDifference = difference;
         indexOfBestDifference = i;
     end
end