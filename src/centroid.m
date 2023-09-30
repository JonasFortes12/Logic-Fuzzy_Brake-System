% Função principal da centroide
function Centroid = centroid(pressureBrakeLow,pressureBrakeMedium,pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh)
    

    brakePertinences = trueMeasure(pressureBrakeLow,pressureBrakeMedium,pressureBrakeHigh, carVelocityHigh, wheelVelocityLow, wheelVelocityHigh);

    brakeFree = brakePertinences(1);
    brakeAply = brakePertinences(2);
    
    coordinates = centroidAreaCalculation(brakeFree,brakeAply);

    Centroid = [coordinates(1), coordinates(2)];

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


function CentroidAreaCalculation = centroidAreaCalculation(brakeFree,brakeAply)
    
    %Cria área do triangulo 'liberar freio'
    triangleFreeBrake = polyshape([0,0; 0,1; 100,0]);

    %Cria área do triangulo 'aplicar freio'
    triangleAplyBrake = polyshape([0,0; 100,1; 100,0]);

    %Cria áreas delimitadas pelos valores 'aplicar freio' e 'liberar freio'
    %retornado pelas regras nebulosas
    retangleFreeBrake = polyshape([0,0; 0,brakeFree; 100,brakeFree; 100,0]);
    retangleAplyBrake = polyshape([0,0; 0,brakeAply; 100,brakeAply; 100,0]);
    

    %Cria a interseção entre a área delimitada pelos resultados das regras
    %de entrada e a área dos triangulos das regras nebulosas de saídas
    areaFreeBrake = intersect(triangleFreeBrake, retangleFreeBrake);
    areaAplyBrake = intersect(triangleAplyBrake, retangleAplyBrake);

    %Une as áreas de cada diretiva 'liberar freio' e 'aplicar freio'
    areaFreeAndAplyBrake = union(areaFreeBrake,areaAplyBrake);

    % Retorna as coordenadas x e y da centroide da área resultante
    [x, y] = centroid(areaFreeAndAplyBrake);

    CentroidAreaCalculation = [x, y];

end



