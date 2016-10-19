function output = plotAvg( data )
%plotAvg Problem 6 - Plot average pixel density
    
    % Initiate empty arrays for clarity 
    CementedPre = [];
    CementedPost = [];
    UncementedPre = [];
    UncementedPost = [];
    
    for i = 1:length(data.patients)
        % Define a patient to be worked on.
        patient = data.patients(i);
       
        Ncounter = 1;
        for ii = -150:1:100
            c = 0;
            
            data.patients(i).preVariance(Ncounter) = sum(patient.preData(:,4) == ii);
            data.patients(i).postVariance(Ncounter) = sum(patient.postData(:,4) == ii);
           
            
            Ncounter = Ncounter + 1;
        end
        
    end
    
    for i = 1:length(data.patients)
        % Define a patient to be worked on.
        patient = data.patients(i);
        
        if strcmp(patient.group, 'cemented')
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
    
    for i = 1:1:251
        
        CementedPre(i) = mean(cpreVariance(:, i));
        CementedPost(i) = mean(cpostVariance(:, i));
        UncementedPre(i) = mean(upreVariance(:, i));
        UncementedPost(i) = mean(upostVariance(:, i));
        
    end 
      
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
    
    output = CementedPre;
    
    disp('Plot Avg Done')
    
   
end

function X = proportional( arr )
        
    X = arr/sum(arr)*100;
    
end
