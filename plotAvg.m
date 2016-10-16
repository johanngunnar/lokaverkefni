function plotAvg( data )
%plotAvg Problem 6 - Plot average pixel density
    
    % Initiate empty arrays for clarity 
    CementedPre = [];
    CementedPost = [];
    UncementedPre = [];
    UncementedPost = [];
    
    for i = 1:length(data.patients)
        % Define a patient to be worked on.
        patient = data.patients(i);
        
        if strcmp(patient.group, 'cemented')
            for ii = 1:length(patient.preData)
                CementedPre(ii) = patient.preData(ii,4);
            end
            for ii = 1:length(patient.postData)
                CementedPost(ii) = patient.postData(ii,4);
            end
        else 
            for ii = 1:length(patient.preData)
                UncementedPre(ii) = patient.preData(ii,4);
            end
            for ii = 1:length(patient.postData)
                UncementedPost(ii) = patient.postData(ii,4);
            end
        end
        
    end
    
    % Call a subfunction to manipulate data
    CementedPre = sumAveragePixels(CementedPre);
    CementedPost = sumAveragePixels(CementedPost);
    UncementedPre = sumAveragePixels(UncementedPre);
    UncementedPost = sumAveragePixels(UncementedPost);
    
    figure;
    
    % Create a 2 by 2 subplot...
    subplot(2,2,1);
    
    % Plot the pre-op data for the cemented group.
    plot(-150:1:100, CementedPre);
    % Define labels as stated in the project description
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    % Create a plot-title
    title('Average curve for pre-op cemented')
    % Define a axis
    axis([-150, 100, 0, 2])
    % Hold the plotting
    hold;
    
    % Same as above... 
    subplot(2,2,2);
    plot(-150:1:100, CementedPost);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for post-op cemented')
    axis([-150, 100, 0, 2])
    hold;
    
    subplot(2,2,3);
    plot(-150:1:100, UncementedPre);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for pre-op uncemented')
    axis([-150, 100, 0, 2])
    hold;
   
    subplot(2,2,4);
    plot(-150:1:100, UncementedPost);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for post-op uncemented')
    axis([-150, 100, 0, 2])
    
end

function X = sumAveragePixels( arr )
    
    % Define a counter because array indicies can't be a negative number.
    Ncounter = 1;
    
    % Loop through all of the 251 possible Hounsfield units as separate
    % slices
    for i = -150:1:100
        c = 0;
        
        % Count the number of hounsfield units in each slice. 
        c = sum(arr == i);
        
        N(Ncounter) = c;
        Ncounter = Ncounter + 1;
    end
    
    X = N/sum(N)*100;
    
end
