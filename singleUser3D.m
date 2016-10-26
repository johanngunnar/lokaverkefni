function singleUser3D( patient )
%singleUser3D Problem 4 - Create a 3d model for a single user
    
    % Define X,Y,Z data vectors for the patient. 
    X = patient.preData(:,1);
    Y = patient.preData(:,2);
    Z = patient.preData(:,3);
    
    % Initiate a figure
    figure;
    % Plot the X,Y,Z values with the color red in 3d.
    plot3(X, Y, Z, 'r');
    % Add a title to the plot.
    title(char(['3d model for patient #', patient.name]))
    
    % Define a starting point as to finding a difference
    prevNum = Z(1);
    % Initiate a slice counter. 
    sliceCounter = 1;
    
    % We make the for loop jump on 10 because we do not need to look at
    % every data point.
    for i = 2:10:length(Z)
        % Find diff between the previous number and the current one, 
        difference = diff([prevNum, Z(i)]);
        
        % ... if the diff is greater than 0, we have found a new slice.
        if difference > 0
            sliceCounter = sliceCounter + 1;
        end
        
        % Re-define the prevNum for comparison
        prevNum = Z(i);
    end
    
    % Print a message to the command window. 
    fprintf('Sjuklingur merktur %s var med %d sneida thrividdarmynd \n \n', patient.name , sliceCounter);
end

