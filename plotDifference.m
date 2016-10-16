function = plotDifference( data )
%plotDifference Problem 8 - Here we plot proportional change in muscle and fat
%mass. 


    for i = 1:length(data.patients)
        patient = data.patients(i);
        
        Y = patient.preData(:,4);
        X = patient.postData(:,4);
        
        
        
    end

end

