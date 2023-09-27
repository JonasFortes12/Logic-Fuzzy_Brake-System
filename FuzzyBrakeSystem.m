
%______________________ Conjuntos Nebulosos ____________________________

% Conjunto nebuloso da pressão no pedal de freio 
trimPressureBrake = [[0,0,50],[30,50,70],[50,100,100]];

% Conjunto nebuloso de velocidades(Carro e Rodas)
trimVelocity = [[0,0,60],[20,50,80],[40,100,100]];


pressureBrakeLow = pertinence(60,trimPressureBrake(1,1:3));
pressureBrakeMedium = pertinence(60,trimPressureBrake(1,4:6));
pressureBrakeHigh = pertinence(60,trimPressureBrake(1,7:9));
carVelocityHigh = pertinence(80,trimVelocity(1,7:9));
wheelVelocityLow = pertinence(55,trimVelocity(1,1:3));
wheelVelocityHigh = pertinence(55,trimVelocity(1,7:9));


c = centroid(pressureBrakeLow, pressureBrakeMedium, pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh);


disp(c);













