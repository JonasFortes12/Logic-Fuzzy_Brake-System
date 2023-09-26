
%______________________ Conjuntos Nebulosos ____________________________

% Conjunto nebuloso da pressão no pedal de freio 
trimPressureBrake = [[0,0,50],[30,50,70],[50,100,100]];

% Conjunto nebuloso de velocidades(Carro e Rodas)
trimVelocity = [[0,0,60],[20,50,80],[40,100,100]];





disp(rule01(pertinence(80,trimPressureBrake(1,1:3))));








