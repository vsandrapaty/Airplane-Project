function [time,states] = recovery(airplane,conditions)
    initialStates = airplane.getInitialConditions(); %UnWritten
    timeSpan =[0 5000];
    firstTimeStep = 0.1; %first time-step size     
    options = odeset('Events',@stop,'InitialStep',firstTimeStep,'RelTol',1e-6,'AbsTol',1e-6,'MaxStep',1); %Stop function unwritten
    [time,states] = ode45(@descent,timeSpan,initialStates,options);
    
    %% State -> State Derivatives Function
    function stateDerivatives = descent(states)
    % Positions
    x = states(1);
    y = states(2);    
    z = states(3);
    % Momenta
    Px = states(4); 
    Py = states(5); 
    Pz = states(6); 
    
    g = conditions.getGravity(); %Unwritten
    m = airplane.getMass();
    rho = conditions.getDensity();
    
    % Column vector for momentum in x, y, z
    momentum = [Px; Py; Pz];
    % Column vector for earth relative velocity in x, y, z
    earthRelVelocity = momentum/m; 
    
    forceXDir = airplane.getXDrag(rho,-earthRelVelocity(1));
    forceZDir = airplane.getZDrag(rho,-earthRelVelocity(3));
    
    if (earthRelVelocity(1) <= 10)    
        % Column vector for wind in x, y, z
        wind = conditions.getWind(); %UnWritten
        
        % Column vector for wind relative velocity in x, y, z
        windRelVelocity = earthRelVelocity - wind;
        windRelVelocityUnit = windRelVelocity/norm(windRelVelocity);
        
        forceMag = airplane.getZDrag(rho,norm(windRelVelocity));
        % Column vector for force on airplane in x, y, z
        force = forceMag * -windRelVelocityUnit -m*g;
        forceXDir = force(1);
        forceYDir = force(2);
        forceZDir = force(3);
    end
    
    % Velocity is equal to change in position
    stateDerivatives(1) = earthRelVelocity(1);
    stateDerivatives(2) = earthRelVelocity(2);
    stateDerivatives(3) = earthRelVelocity(3);
    % Force is equal to change in momentum
    stateDerivatives(4) = forceXDir;
    stateDerivatives(5) = forceYDir;
    stateDerivatives(6) = forceZDir;
    end
end