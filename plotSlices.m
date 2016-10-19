function  plotSlices( data )
%plotSlices Problem 10 - Plot a single slice for every patient
    
    % Create a 251x3 color matrix to be used in coloring.
    colors = hsv(251);
    
    % Only analyze a specific part of the patients. The number of patients
    % should not exceed 18 with the provided data.
        % Groupsymbol: 'c' is cemented, 'u' is uncemented
    patients  = data.patients([data.patients.groupSymbol] == 'c');
    
    % Define a length variable for further use
    patients_Length = length(patients); 
    
    % Initiate a figure before the for loop
    figure;
    for j = 1:patients_Length
        % Define the patient to be worked on.
        patient = patients(j);
        % Define a shortcut variable for patient data.
        pD = patient.preData;
        
        % Find the mininum z value ...
        zmin = min(pD(:,3));
    
        % ... create a index-vector of all of the rows where the third column 
        % (z-values) equal the minimum z value.
        rows = find(pD(:,3) == zmin);

        % And select all of the data samples with an index in the rows
        % vector.
        bottomSlize = pD(rows,:);
    
        % Print a message to the command window
        fprintf('Drawing a scan slice for %s \n', patient.name);
        
        % Create a dynamic subplot with a fixed number of three columns and
        % a dynamic number of rows. 
        subplot(4,4,j);
        
        for i = 1:length(bottomSlize)
            % Define the (x,y) data-point to be plotted onto a graph
            x = bottomSlize(i, 1);
            y = bottomSlize(i, 2);

            % Since Hounsfield units can be in the range of [-150, 100], we
            % need to add at 151 to every selector to get a range of [1, 251] -
            % corresponding with the amount of colors in our colors vector.
            colorNum = bottomSlize(i, 4) + 151;

            % Plot every (x,y) data-point to a graph with a color represented by
            % the hounsfield unit
            plot(x, y,'color', colors(colorNum, :),'marker', '.' );
            hold on;
        end
        
        % Create a dynamic titlestr variable to use in the plot/subplot.
        titleStr = char(['Einstaklingur # ', num2str(j)]);
        title(titleStr);
        axis off;
        
    end
    %hold off;
end

