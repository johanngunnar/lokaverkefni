function [ data ] = loadData( data )
%loadData Here we use the previously initiated data struct to load real
%data samples for further use. 
    
    totalPatients = length(data.patients);
    
    % Start a timer
    tic
    
    counter = 1;
    for i = 1:length(data.patients)
        % Define patient being worked on
        patient = data.patients(i);
        % Print a message to the command window  
        fprintf('Er ad lesa inn gogn fyrir %s hop, einstaklingur numer %d af %d \n',patient.group, counter, (totalPatients/2))
        
        % Load user data...
        preData = load(patient.preUrl);
        postData = load(patient.postUrl);
        
        % ... and add to data struct
        data.patients(i).preData = preData;
        data.patients(i).postData = postData;
        
        % Reset patient counter when finished with first half
        if counter == (totalPatients/2) 
            counter = 1;
        else
            counter = counter + 1;
        end
    end
    
    % Close the timer
    timeElapsed = toc;
    
    fprintf('\nThad tok alls %.1f sek and lesa inn oll gognin \n',timeElapsed)
    
    % Return the updated data back to main.m
    data = data;
end

