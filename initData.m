function [data] = initData
%loadData this is where we init project data and print related messages to
%the command window.

global workDir

data = {};

patientCounter = 1;

for i=1:2
    
    if i == 1
        c='/data/Cemented/';
        s=strcat(workDir,c);
        files = dir(s);
        % Remove all empty/hidden files and foleders (Copied from the interwebs)
        % https://se.mathworks.com/matlabcentral/newsreader/view_thread/258220
        files = files([files.isdir] & ~strncmpi('.', {files.name}, 1));
        
        maleC = 0; % latum teljarann fyrir karla i Cemented byrja i 0
        femaleC = 0; % sama fyrir konur
        
        for j = 1:length(files)
             b = files(j).name;
             preUrl = strcat(s,b,'/PRE_O_grayvalues.txt');
             postUrl = strcat(s,b,'/POST_O_grayvalues.txt');
             
             data.patients(patientCounter).name = b;
             data.patients(patientCounter).group = 'cemented';
             data.patients(patientCounter).preUrl = preUrl;
             data.patients(patientCounter).postUrl = postUrl;
             
             patientCounter = patientCounter + 1;
             
            % teljum hve margir karlar eru i cemented groupunni
            countMC = strfind(b,'M');
            if countMC == 4
                maleC= maleC + 1;
            end

            countFC = strfind(b,'F');
            if countFC == 4
                femaleC = femaleC + 1;
            end

        end
    else 
        c = '/data/Uncemented/';
        s=strcat(workDir,c);
        files = dir(s);
        % Remove all empty/hidden files and foleders (Copied from the interwebs)
        files = files([files.isdir] & ~strncmpi('.', {files.name}, 1));
        
        maleU = 0; % latum teljarann fyrir karla i Uncemented byrja i 0
        femaleU = 0; % sama fyrir konur
        
        for j = 1:length(files)
             b = files(j).name;
             preUrl = strcat(s,b,'/PRE_O_grayvalues.txt');
             postUrl = strcat(s,b,'/POST_O_grayvalues.txt');
             
             data.patients(patientCounter).name = b;
             data.patients(patientCounter).group = 'uncemented';
             data.patients(patientCounter).preUrl = preUrl;
             data.patients(patientCounter).postUrl = postUrl;
             
             patientCounter = patientCounter + 1;
             
             % teljum hve margir karlar eru i Uncemented groupunni
            countMU = strfind(b,'M');
            if countMU == 4
                maleU= maleU + 1;
            end

            countFU = strfind(b,'F');
            if countFU == 4
                femaleU = femaleU + 1;
            end

                    
        end
    end
end

fprintf('Thad eru %.d karlar og %.d konur i uncemented hopnum \n',maleU,femaleU)
fprintf('Thad eru %.d karlar og %.d konur i cemented hopnum \n \n',maleC,femaleC)

end

