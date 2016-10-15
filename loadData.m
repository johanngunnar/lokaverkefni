function [ data ] = loadData( data )
%loadData Here we use the previously initiated data struct to load real
%data samples for further use. 
    
    totalPatients = length(data.patients);
    
    % Start a timer
    tic
    
    for i = 1:length(data.patients)
        % Define patient being worked on
        patient = data.patients(i);
        % Print a message to the command window  
        fprintf('Er ad lesa inn gogn fyrir %s hop, einstaklingur numer %d af %d \n',patient.group, i,totalPatients)
        
        % Load user data and add to data struct
        
        preData = load(patient.pre);
        postData = load(patient.post);
        
        data.patients(i).preData = preData;
        data.patients(i).postData = postData;
        
    end
    
    
    timeElapsed = toc;
    fprintf('\nThad tok alls %.1f sek and lesa inn oll gognin \n',timeElapsed)
    
    data = data;
end

