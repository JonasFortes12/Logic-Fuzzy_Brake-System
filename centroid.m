



% Função principal
function Centroid = centroid(pressureBrakeLow,pressureBrakeMedium,pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh)
    

    brakePertinences = trueMeasure(pressureBrakeLow,pressureBrakeMedium,pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh);

    disp(brakePertinences);

    % Calcular centroide aqui com base na função de pertinencia 
    % da saída (combinação do quanto 'liberar' e  'aplicar' o freio)
    % outputPertinenceBrake.m
    
end



% Retorna os limites do grau de verdade entre 'liberar' e 'aplicar' o freio 
function TrueMeasure = trueMeasure(pressureBrakeLow, pressureBrakeMedium, pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh)
    brakeAplyPertinence = rule01(pressureBrakeMedium) + rule02(pressureBrakeHigh, carVelocityHigh, wheelVelocityHigh);
    brakeFreePertinence = rule04(pressureBrakeLow) + rule03(pressureBrakeHigh, carVelocityHigh, wheelVelocityLow);

    TrueMeasure = [brakeFreePertinence, brakeAplyPertinence];
end


%______________________ Regras Nebulosas _______________________________

% Regra 1: Retorna o quanto aplica o freio
function Rule01 = rule01(pressureBrakeMedium)
    
    if pressureBrakeMedium ~= 0
        Rule01 = pressureBrakeMedium;
    else
        Rule01 = 0;
    end

end

% Regra 2: Retorna o quanto aplica o freio
function Rule02 = rule02(pressureBrakeHigh, carVelocityHigh, wheelVelocityHigh)
    
    if pressureBrakeHigh ~= 0 && carVelocityHigh ~= 0 && wheelVelocityHigh ~= 0
        Rule02 = min([pressureBrakeHigh, carVelocityHigh, wheelVelocityHigh]);
    else
        Rule02 = 0;
    end

end


% Regra 3: Retorna o quanto libera o freio
function Rule03 = rule03(pressureBrakeHigh, carVelocityHigh, wheelVelocityLow)
    
    if pressureBrakeHigh ~= 0 && carVelocityHigh ~= 0 && wheelVelocityLow ~= 0
        Rule03 = min([pressureBrakeHigh, carVelocityHigh, wheelVelocityLow]);
    else
        Rule03 = 0;
    end

end


% Regra 4: Retorna o quanto libera o freio
function Rule04 = rule04(pressureBrakeLow)
    
    if pressureBrakeLow ~= 0
        Rule04 = pressureBrakeLow;
    else
        Rule04 = 0;    
    end

end




