
function Pertinence = pertinence(value, trim)
    
    if numel(trim) == numel(unique(trim))
        Pertinence = trianglePertinence(value, trim);
    
    elseif trim(1) == trim(2)
        if value < trim(3)
            Pertinence = (trim(3) - value) / (trim(3) - trim(2));
        else
            Pertinence = 0;
        end
    
    elseif trim(2) == trim(3)
        if value >= trim(1)
            Pertinence = (value - trim(1)) / (trim(2) - trim(1));
        else
            Pertinence = 0;
        end
        
    
    end




    

end


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




