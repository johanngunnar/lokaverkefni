function plotAvg( data )
%plotAvg Problem 6 - Plot average pixel density

    CementedPre = [];
    CementedPost = [];
    UncementedPre = [];
    UncementedPost = [];
    
    for i = 1:length(data.patients)
        patient = data.patients(i);
        patient.group
        if patient.group == 'cemented'
            for ii = 1:length(patient.preData)
                CementedPre(ii) = patient.postData(ii);
            end
            for ii = 1:length(patient.postData)
                CementedPost(ii) = patient.postData(ii);
            end
        else
            for ii = 1:length(patient.preData)
                UncementedPre(ii) = patient.preData(ii);
            end
            for ii = 1:length(patient.postData)
                UncementedPost(ii) = patient.postData(ii);
            end
        end
    end
    
    hist(CementedPre)

end

