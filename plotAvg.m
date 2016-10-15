function plotAvg( data )
%plotAvg Problem 6 - Plot average pixel density

    CementedPre = [];
    CementedPost = [];
    UncementedPre = [];
    UncementedPost = [];
    
    for i = 1:length(data.patients)
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
        
    CementedPre = sumAveragePixels(CementedPre);
    CementedPost = sumAveragePixels(CementedPost);
    UncementedPre = sumAveragePixels(UncementedPre);
    UncementedPost = sumAveragePixels(UncementedPost);
    
    figure;
    
    subplot(2,2,1);
    plot(-150:1:100, CementedPre);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for pre-op cemented')
    axis([-150, 100, 0, 2])
    hold
    
    subplot(2,2,2);
    plot(-150:1:100, CementedPost);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for post-op cemented')
    axis([-150, 100, 0, 2])
    hold
    
    subplot(2,2,3);
    plot(-150:1:100, UncementedPre);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for pre-op uncemented')
    axis([-150, 100, 0, 2])
    hold
   
    subplot(2,2,4);
    plot(-150:1:100, UncementedPost);
    ylabel('Percentage of pixels []');
    xlabel('Hounsfield units');
    title('Average curve for post-op uncemented')
    axis([-150, 100, 0, 2])
    
end

function X = sumAveragePixels( arr )

    Ncounter = 1;
    
    for i = -150:1:100
        c = 0;
        
        c = sum((arr >= (i - 1)) & (arr <= i));
        
        N(Ncounter) = c;
        Ncounter = Ncounter + 1;
    end
    
    X = N/sum(N)*100;
    
end
