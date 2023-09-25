% Função principal
function Centroid = centroid()
    precision = 20;
    x = 100/precision;

    for i = x:x:100
        %c += (x*lowerLimit)
        %Fazer a formula do somatorio para encontrar a centroide, o valor
        %de i sera usado tanto como i como passo (numerador) e i/100
        %(denominador) e recriar a formula do livro;
    end
end



% Retorna o limite inferior 
function LowerLimit = lowerLimit(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    pressaoAplicar = rule01(pertinencePressureBrake) + rule01(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity);
    pressaoLiberar = rule04(pertinencePressureBrake) + rule03(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity);

    LowerLimit = min([pressaoAplicar, pressaoLiberar]);
end

% Regra 1: Retorna o quanto aplica o freio
function Rule01 = rule01(pertinencePressureBrake)
    
    if pertinencePressureBrake >= 50 && pertinencePressureBrake < 70
        Rule01 = pertinencePressureBrake;
    end

end

% Regra 2: Retorna o quanto aplica o freio
function Rule02 = rule02(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    
    if pertinencePressureBrake >= 50 && pertinenceCarVelocity >= 40 && pertinenceWheelVelocity >= 40
        Rule02 = min([pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity]);
    end

end

% Regra 3: Retorna o quanto libera o freio
function Rule03 = rule03(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    
    if pertinencePressureBrake >= 50 && pertinenceCarVelocity >= 40 && pertinenceWheelVelocity < 60
        Rule03 = min([pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity]);
    end

end


% Regra 4: Retorna o quanto libera o freio
function Rule04 = rule04(pertinencePressureBrake)
    
    if pertinencePressureBrake < 50
        Rule04 = pertinencePressureBrake;
    end

end

