% Integrantes:
% Jonas Carvalho Fortes - 494513
% Íris Cordeiro Costa   - 497503

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
trimPressureBrake = [
    0,0,50;
    30,50,70;
    50,100,100
    ];

% Conjunto nebuloso de velocidades(Carro e Rodas)
trimVelocity = [
    0,0,60;
    20,50,80;
    40,100,100
    ];


%______________________ Calculo de Pertinencias _______________________

pressureBrakeLow = pertinence(pressureBrake,trimPressureBrake(1,:));
pressureBrakeMedium = pertinence(pressureBrake,trimPressureBrake(2,:));
pressureBrakeHigh = pertinence(pressureBrake,trimPressureBrake(3,:));

carVelocityHigh = pertinence(carVelocity,trimVelocity(3,:));
wheelVelocityLow = pertinence(wheelVelocity,trimVelocity(1,:));
wheelVelocityHigh = pertinence(wheelVelocity,trimVelocity(3,:));


% Calcula as coordenadas x e y da centroide com base nas pertinencias em
% cada variável nebulosa aplicadas às regras de inferências
CentroidCoordinates = centroid(pressureBrakeLow, pressureBrakeMedium, pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh);


% Mostra resultado 
fprintf('Aplicar freio -> %.2f\n', CentroidCoordinates(1));






