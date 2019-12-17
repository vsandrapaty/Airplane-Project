% Terminal Velocity vs Parachute Diameter 380
for i = 1:length(diameterArray380)
     landingVelocity380(i) = trajectories380(i).trajectoryVals(end,6)/airplaneMass380;
end
plot(diameterArray380,landingVelocity380)

% Terminal Velocity vs Parachute Diameter 320
for i = 1:length(diameterArray320)
     landingVelocity320(i) = trajectories320(i).trajectoryVals(end,6)/A320.getMass;
end
hold on
plot(diameterArray320,landingVelocity320)
