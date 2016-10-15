function checkHounsfield( data )
%checkHounsfield - Problem 5, check if all hounsfield units are between
%-150 and 100. 

    flag = 1;

    for i = 1:length(data.patients)
        unitsPre = data.patients(i).preData(:,4);
        unitsPost = data.patients(i).postData(:,4);
        
        minimumVal = min([min(unitsPre), min(unitsPost)]);
        maximumVal = max([max(unitsPre), max(unitsPost)]);
        
        if (minimumVal < -150) || (maximumVal > 150)
            fprintf('Sjuklingur numer %d fer ut fyrir edlilegar hounsfield einingar \n \n', i);
            flag = 0;
        end
    end
    
    if flag 
        fprintf('Allir sjuklingar eru med edlilegar Hounsfield einingar \n \n');
    end
end

