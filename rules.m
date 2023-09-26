
%______________________ Regras Nebulosas _______________________________

% Regra 1: Retorna o quanto aplica o freio
function Rule01 = rule01(pertinencePressureBrake)
    
    if pertinencePressureBrake ~= 0
        Rule01 = pertinencePressureBrake;
    else
        Rule01 = 0;
    end

end

% Regra 2: Retorna o quanto aplica o freio
function Rule02 = rule02(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    
    if pertinencePressureBrake ~= 0 && pertinenceCarVelocity ~= 0 && pertinenceWheelVelocity ~= 0
        Rule02 = min([pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity]);
    else
        Rule02 = 0;
    end

end

% Regra 3: Retorna o quanto libera o freio
function Rule03 = rule03(pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity)
    
    if pertinencePressureBrake ~= 0 && pertinenceCarVelocity ~= 0 && pertinenceWheelVelocity ~= 0
        Rule03 = min([pertinencePressureBrake, pertinenceCarVelocity, pertinenceWheelVelocity]);
    else
        Rule03 = 0;
    end

end


% Regra 4: Retorna o quanto libera o freio
function Rule04 = rule04(pertinencePressureBrake)
    
    if pertinencePressureBrake ~= 0
        Rule04 = pertinencePressureBrake;
    else
        Rule04 = 0;    
    end

end