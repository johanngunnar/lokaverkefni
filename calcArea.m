function output = calcArea( data )
%calcArea Problem 7 - calculate the area under muscle and fat. Area units
%are pixels but we decided to calculate the area proportionally so that
%the data would me more compareble between patients.    

    for i = 1:length(data.patients)
        % Define a patient to be worked on. 
        patient = data.patients(i);
        preData = [];
        
        % -------------
        % PRE OP
        % -------------
        Y = patient.preData(:,4);
        
        % Gather all data rows where the hounsfield unit represents fat or
        % muscle.
        Yfat = Y(((Y >= -150) & (Y <= -50)));
        YMuscle = Y(((Y >= 0) & (Y <= 100)));
        
        % Here we call a subfunction that sums together all of the pixels.  
        fatArea = arrToArea(Yfat);
        muscleArea = arrToArea(YMuscle);
        
        % Generate a proportional fat/muscle value based on total pixels.
        fatArea = (fatArea / length(Y))*100;
        muscleArea = (muscleArea / length(Y))*100;
        
        % Add Pre-op fat/muscle areas to the patient data struct. 
        
        data.patients(i).preFatArea = fatArea;
        data.patients(i).preMuscleArea = muscleArea;
        
        fprintf('\nBefore the operation, patient %s has a muscle area of %.0f%% and fat area of %.0f%% \n',patient.name, muscleArea, fatArea );

        % -------------
        % POST OP
        % -------------
        % Here we re-define all of the previously created variables to
        % gather information about the patient's post-op status. 
        
        % For more information, read comments for PRE-OP
        
        Y = patient.postData(:,4);
        
        Yfat = Y(((Y >= -150) & (Y <= -50)));
        YMuscle = Y(((Y >= 0) & (Y <= 100)));
          
        fatArea = arrToArea(Yfat);
        muscleArea = arrToArea(YMuscle);
        
        fatArea = (fatArea / length(Y))*100;
        muscleArea = (muscleArea / length(Y))*100;
        
        % Add Post-op fat/muscle areas to the patient data struct. 
        
        data.patients(i).postFatArea = fatArea;
        data.patients(i).postMuscleArea = muscleArea;
       
        fprintf('\nPost operation, patient %s has a muscle area of %.0f%%  and fat area of %.0f%% \n',patient.name, muscleArea, fatArea );
        
    end
    
    output = data;
      
end

function X = arrToArea( arr )
%arrToArea - take an array of values and manually integrate it to find
%area. 

    % Define a seperate counter to avoid negative-index error
    Ncounter = 1;
    
    for i = -150:1:100
        
        % Find how many instances of each hounsfield value can be found
        % inside the input array.
        y = sum(arr == i);
        
        % The area of this single slice must thus be the y value times the
        % width of the slice, in this case 1. 
        sliceArea = (y * 1);
        
        % Add the slice area to a vector to return back to the main
        % function.
        N(Ncounter) = sliceArea;

        Ncounter = Ncounter + 1;
    end
    
    % Sum together all of the slices to complete the manual integration. 
    X = sum(N);
    
end


