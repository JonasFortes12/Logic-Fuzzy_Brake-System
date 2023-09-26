
centroid()


% Função principal
function Centroid = centroid(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    
    
    Centroid = trueMeasure(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity);

    
end



% Retorna o limite inferior 
function TrueMeasure = trueMeasure(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    pressaoAplicar = rule01(pertinencePressureBrake) + rule02(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity);
    pressaoLiberar = rule04(pertinencePressureBrake) + rule03(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity);

    TrueMeasure = min([pressaoAplicar, pressaoLiberar]);
end






