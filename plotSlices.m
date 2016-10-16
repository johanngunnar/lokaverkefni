function  plotSlices( data )
%plotSlices Problem 10 - Plot a single slice for every patient
    
    % Create a 251x3 color matrix to be used in coloring.
    colors = hsv(251);

    patients = length(data.patients); 
    figure;
    for j = 1:patients
        % Define the patient to be worked on.
        patient = data.patients(j);
        pD = patient.preData;
        
        zmin = min(pD(:,3));

        rows = find(pD(:,3) == zmin);

        bottomSlize = pD(rows,:);

        fprintf('Starting scatter plot drawing \n');
        
        subplot(1,2,j);
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

        fprintf('Scatter plot drawing finished \n');
        titleStr = char(['Einstaklingur # ', num2str(j)]);
        title(titleStr);
        axis off;
    end
    %hold off;
end

