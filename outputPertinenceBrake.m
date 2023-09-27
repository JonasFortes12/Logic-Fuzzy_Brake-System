function OutputPertinenceBrake = outputPertinenceBrake(brakeFree, brakeAply, x)
    
    Xbf = brakeFree*100;
    Xba = brakeAply*100;
    

    if x <= Xbf
        OutputPertinenceBrake = brakeFree;
        
    elseif x >= Xba
        OutputPertinenceBrake = brakeAply;

    else
        OutputPertinenceBrake = x/100;
    
    end

end