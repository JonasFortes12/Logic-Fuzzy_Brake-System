% Calculo das pertinencias com base na configuração triangular [a, b, c]
% para os vértices (a,1), (b,1) e (c,0) ou (a,0), (b,1) e (c,1)
% em que a=b ou b=c

function Pertinence = pertinence(value, trim)
    
    % Se os valores de trim forem todos diferentes
    if numel(trim) == numel(unique(trim))
        Pertinence = trianglePertinence(value, trim);
    
    % Se os dois primeiros valores de trim forem iguais
    elseif trim(1) == trim(2)
        if value < trim(3)
            Pertinence = (trim(3) - value) / (trim(3) - trim(2));
        else
            Pertinence = 0;
        end

     % Se os dois ultimos valores de trim forem iguais
    elseif trim(2) == trim(3)
        if value >= trim(1)
            Pertinence = (value - trim(1)) / (trim(2) - trim(1));
        else
            Pertinence = 0;
        end
        
    end

end

% Calculo das pertinencias com base na configuração triangular [a, b, c]
% para os vértices (a,0), (b,1) e (c,0)
function TrianglePertinence = trianglePertinence(value, trim)
    if value < trim(1)
        TrianglePertinence = 0;
    
    elseif value >= trim(1) && value <= trim(2)
        TrianglePertinence = (value - trim(1)) / (trim(2) - trim(1));
    
    elseif value >= trim(2) && value <= trim(3)
        TrianglePertinence = (trim(3) - value) / (trim(3) - trim(2));
    
    else
        TrianglePertinence = 0;
    end
    
end




