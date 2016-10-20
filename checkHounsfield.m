function checkHounsfield( data )
%checkHounsfield - Problem 5, check if all hounsfield units are between
%-150 and 100. 

    % Turn on a default flag value
    flag = 1;

    % Loop through all of the patients 
    for i = 1:length(data.patients)
        % Define a variable name for the patient pre & post hounsfield values.
        unitsPre = data.patients(i).preData(:,4);
        unitsPost = data.patients(i).postData(:,4);
        
        % Find the min/max hounsfield values. 
        minimumVal = min([min(unitsPre), min(unitsPost)]);
        maximumVal = max([max(unitsPre), max(unitsPost)]);
        
        % If the minimum is less than -150 OR the maximum is greater than
        % 100 we print a message to the command window and flip the flag.
        if (minimumVal < -150) || (maximumVal > 100)
            fprintf('Sjuklingur numer %d fer ut fyrir edlilegar hounsfield einingar \n \n', i);
            flag = 0;
        end
    end
    
    % If the flag has not been altered throughout the FULL for loop, we
    % print a message to the command window.
    if flag 
        fprintf('Allir sjuklingar eru med edlilegar Hounsfield einingar \n \n');
    end
end

