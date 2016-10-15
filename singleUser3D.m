function singleUser3D( patient )
%singleUser3D Problem 4 - Create a 3d model for a single user
    
    X = patient.preData(:,1);
    Y = patient.preData(:,2);
    Z = patient.preData(:,3);
    
    figure;
    plot3(X, Y, Z, 'r');
    % plot(X, Z, 'b');
    
end

