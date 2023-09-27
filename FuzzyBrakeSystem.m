addpath('src/'); %importa as funções auxiliares 


%______________________ Definição de Entradas ________________________
pressureBrake = -1;
carVelocity = -1;
wheelVelocity = -1;

% Solicitar valores de entrada válidos
while pressureBrake < 0 || pressureBrake > 100
    pressureBrake = input('Insira a pressão no pedal (0-100): ');
end

while carVelocity < 0 || carVelocity > 100
    carVelocity = input('Insira a velocidade do carro (0-100): ');
end

while wheelVelocity < 0 || wheelVelocity > 100
    wheelVelocity = input('Insira a velocidade das rodas (0-100): ');
end




%______________________ Conjuntos Nebulosos ____________________________

% Conjunto nebuloso da pressão no pedal de freio 
trimPressureBrake = [[0,0,50],[30,50,70],[50,100,100]];

% Conjunto nebuloso de velocidades(Carro e Rodas)
trimVelocity = [[0,0,60],[20,50,80],[40,100,100]];


%______________________ Calculo de Pertinencias _______________________

pressureBrakeLow = pertinence(pressureBrake,trimPressureBrake(1,1:3));
pressureBrakeMedium = pertinence(pressureBrake,trimPressureBrake(1,4:6));
pressureBrakeHigh = pertinence(pressureBrake,trimPressureBrake(1,7:9));
carVelocityHigh = pertinence(carVelocity,trimVelocity(1,7:9));
wheelVelocityLow = pertinence(wheelVelocity,trimVelocity(1,1:3));
wheelVelocityHigh = pertinence(wheelVelocity,trimVelocity(1,7:9));


% Calcula a centroide com base nas pertinencias em cada variável debulosa
c = centroid(pressureBrakeLow, pressureBrakeMedium, pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh);


% Mostra resultado 
disp(strcat('Aplicar Freio', ' -> ', num2str(c)));













