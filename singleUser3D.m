function singleUser3D( patient )
%singleUser3D Problem 4 - Create a 3d model for a single user
    
    X = patient.preData(:,1);
    Y = patient.preData(:,2);
    Z = patient.preData(:,3);
    
    figure;
    plot3(X, Y, Z, 'r');
    plot(X, Z, 'b');
    
    prevNum = Z(1);
    sliceCounter = 1;
    for i = 2:10:length(Z)
        difference = diff([prevNum, Z(i)]);
        
        if difference > 0
            sliceCounter = sliceCounter + 1;
        end
        
        prevNum = Z(i);
    end
    
    fprintf('Sjuklingur merktur %s var med %d sneida thrividdarmynd \n \n', patient.name , sliceCounter);
end

