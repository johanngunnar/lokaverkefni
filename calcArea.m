function calcArea( data )
%plotAvg Problem 6 - Plot average pixel density

    

    for i = 1:length(data.patients)
        patient = data.patients(i);
        preData = [];
        
        disp(['Looking at patient named ', patient.name]);
        
        % PRE OP
        Y = patient.preData(:,4);
        
        Yfat = Y(((Y >= -150) & (Y <= -50)));
        YMuscle = Y(((Y >= 0) & (Y <= 100)));

        Yfat = createSlices(Yfat);
        YMuscle = createSlices(YMuscle);
        
        fatArea = sum(Yfat);
        muscleArea = sum(YMuscle);
       
        fprintf('\nBefore operation, patient %s has muscle area of %.1f hounsfield and fat area of %.1f hounsfield \n \n',patient.name, muscleArea, fatArea );

        % POST OP
        
        Y = patient.postData(:,4);
        
        Yfat = Y(((Y >= -150) & (Y <= -50)));
        YMuscle = Y(((Y >= 0) & (Y <= 100)));

        Yfat = createSlices(Yfat);
        YMuscle = createSlices(YMuscle);
        
        fatArea = sum(Yfat);
        muscleArea = sum(YMuscle);
       
        fprintf('\nPost operation, patient %s has muscle area of %.1f hounsfield and fat area of %.1f hounsfield \n \n',patient.name, muscleArea, fatArea );
        
    end
      
    
end

function X = createSlices( arr )

    Ncounter = 1;
    
    for i = -150:1:100
        c = 0;
        
        c = sum( (arr >= (i - 1)) & (arr <= i) );
        
        sliceArea = (c * 1);
        
        N(Ncounter) = sliceArea;
        Ncounter = Ncounter + 1;
    end
    
    X = N;
    
end


