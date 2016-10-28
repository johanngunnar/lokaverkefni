function yearByYear( data )
%yearByYear Problem 8 - Here we plot proportional change in muscle and fat
%mass for every patient
    
    % Define two separate counters for both groups.
    cementedCounter = 1;
    uncementedCounter = 1;
    
    for i = 1:length(data.patients)
        % Define a patient to be worked on.
        patient = data.patients(i);
        
        % If Muscle area was 20% before and is now 25%, difference is
        % calculated as follows:
            % ((25-20)/20)*100 = 25% increase
        fatChange = ((patient.postFatArea - patient.preFatArea) / patient.preFatArea) * 100;
        muscleChange = ((patient.postMuscleArea - patient.preMuscleArea) / patient.preMuscleArea) * 100;
        
        if strcmp(patient.group, 'cemented')
            % Create the y values for the cemented group
            
            % Since we are using bar charts, a single column must represent 
            % values related to a single patient while our rows represent 
            % different patients. 
            % Examples: 
                % Ycemented(3, 1) = fatChange for patient #3
                % Ycemented(5, 2) = muscleChange for patient #5
            
            Ycemented(cementedCounter, 1) = fatChange;
            Ycemented(cementedCounter, 2) = muscleChange;
            
            cementedCounter = cementedCounter + 1;
        else
            % Create the y values for the uuncemented group
            Yuncemented(uncementedCounter, 1) = fatChange;
            Yuncemented(uncementedCounter, 2) = muscleChange;
            uncementedCounter = uncementedCounter + 1;
        end
        

    end
    
    % We are not quite sure why, but we had to take hold off to proceed
    % correctly.
    
    hold off;
    figure;
    
    % Start a 2x1 subplot
    subplot(2, 1, 1);
    % Draw the cemented results wit a bar graph
    bar(Ycemented);
    
    % Add a title, legend and labels
    title('Pre-op vs post-op: Cemented (%)');
    legend('Fat change', 'Muscle change');
    ylabel('Difference (%) Post vs Pre ');
    xlabel('Subject #');
    
    % Hold the graph
    hold on;
    
    subplot(2, 1, 2);
    % Draw the uncemented results wit a bar graph
    bar(Yuncemented);
    
    % Add a title, legend and labels
    title('Pre-op vs post-op: Uncemented (%)');
    legend('Fat change', 'Muscle change');
    ylabel('Difference (%) Post vs Pre ');
    xlabel('Subject #');   

end

