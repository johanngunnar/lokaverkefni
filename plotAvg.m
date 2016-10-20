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
       
        % Init a seperate counter because we cant update a vector with a
        % non-positive index value [-150, 0].
        Ncounter = 1;
        
        % For each patient, loop through all of the possible hounsfield
        % values. 
        for ii = -150:1:100
            
            % We update each patient with a [251x1] vector with values
            % representing the amount of each hounsfield units in the
            % patient data-set.
            data.patients(i).preVariance(Ncounter) = sum(patient.preData(:,4) == ii);
            data.patients(i).postVariance(Ncounter) = sum(patient.postData(:,4) == ii);
           
            % Increment the counter
            Ncounter = Ncounter + 1;
        end
        
    end
    
    % Again, we loop through all of the patients. 
    for i = 1:length(data.patients)
        % Define a patient to be worked on.
        patient = data.patients(i);
        
        % Divide patients into groups and create seperate data-vectors for
        % cemented pre/post and uncemented pre/post
        if strcmp(patient.group, 'cemented')
            % We split the patients into groups.
            % Each patient gets his row, with 251 columns representing the
            % sum total of each hounsfield value. 
            for ii = 1:1:251
                cpreVariance(i, ii) = data.patients(i).preVariance(ii);
                cpostVariance(i, ii) = data.patients(i).postVariance(ii);
            end
        else
            for ii = 1:1:251
                upreVariance(i, ii) = data.patients(i).preVariance(ii);
                upostVariance(i, ii) = data.patients(i).postVariance(ii);
            end
        end
       

    end  
    
    % When the vectors are complete, we loop through each hounsfield value
    % and find the average sum for each hounsfield value. 
    % So if 3 patients have [3,6,9] instances of the hounsfield value -50, the mean
    % is 6, and so on. 
    for i = 1:1:251
        
        CementedPre(i) = mean(cpreVariance(:, i));
        CementedPost(i) = mean(cpostVariance(:, i));
        UncementedPre(i) = mean(upreVariance(:, i));
        UncementedPost(i) = mean(upostVariance(:, i));
        
    end 
    
    % We call the proportional subfunction that turns these into
    % non-absolute values. 
    CementedPre = proportional(CementedPre);
    CementedPost = proportional(CementedPost);
    UncementedPre = proportional(UncementedPre);
    UncementedPost = proportional(UncementedPost);
    
    figure; 
    
    % Create a 2 by 2 subplot...
    subplot(2,2,1);
    
    % Plot the pre-op data for the uncemented group.
    plot(-150:1:100, UncementedPre);
    % Define labels as stated in the project description
    ylabel('Percentage of pixels');
    xlabel('Hounsfield units');
    % Create a plot-title
    title('Average curve for pre-op uncemented')
    % Define a axis
    axis([-150, 100, 0, 2])
    % Hold the plotting
   
    % Same as above...
    subplot(2,2,2);
    plot(-150:1:100, UncementedPost);
    ylabel('Percentage of pixels');
    xlabel('Hounsfield units');
    title('Average curve for post-op uncemented')
    axis([-150, 100, 0, 2])
    
    subplot(2,2,3);
    plot(-150:1:100, CementedPre);
    ylabel('Percentage of pixels');
    xlabel('Hounsfield units');
    title('Average curve for pre-op cemented')
    axis([-150, 100, 0, 2])
    
    subplot(2,2,4);
    plot(-150:1:100, CementedPost);
    ylabel('Percentage of pixels');
    xlabel('Hounsfield units');
    title('Average curve for post-op cemented')
    axis([-150, 100, 0, 2])
    
    disp('Plot Avg Done')
    
   
end

function X = proportional( arr )
        
    X = arr/sum(arr)*100;
    
end
