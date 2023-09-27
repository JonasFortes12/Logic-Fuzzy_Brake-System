
function Pertinence = pertinence(value, trim)
   
    if value < trim(1)
        Pertinence = 0;
    
    elseif value >= trim(1) && value < trim(2)
        Pertinence = (value - trim(1)) / (trim(2) - trim(1));
    
    elseif value >= trim(2) && value < trim(3)
        Pertinence = (trim(3) - value) / (trim(3) - trim(2));
    
    else
        Pertinence = 0;
    end

end

