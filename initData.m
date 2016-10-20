function [data] = initData
%loadData this is where we init project data and print related messages to
%the command window.

% Activate global variables inside this function

global workDir
global skastrik

data = {};

% Create the folder string for the data folder.
c=strcat(skastrik,'data',skastrik);
dataFolder=strcat(workDir,c);

% Gather all of the files inside the dataFolder.
files = dir(dataFolder);

% Remove all empty/hidden files and foleders (Copied from the interwebs)
% https://se.mathworks.com/matlabcentral/newsreader/view_thread/258220
files = files([files.isdir] & ~strncmpi('.', {files.name}, 1));

% Define a patient counter persisting over the two seperate for loops
patientCounter = 1;

for j = 1:length(files)
    % File file name is either Cemented or Uncemented
    group = files(j).name;
    % We want that to be lowercase in our calculations
    lowercaseGroup = lower(group);
    % We create a string representing that folder ... 
    s=strcat(dataFolder,group,skastrik);
    subfiles = dir(s);
    % Remove all empty/hidden files and foleders (Copied from the interwebs)
    % https://se.mathworks.com/matlabcentral/newsreader/view_thread/258220
    subfiles = subfiles([subfiles.isdir] & ~strncmpi('.', {subfiles.name}, 1));
    
    % Loop through all of the non-empty files inside root/data
    for i = 1:length(subfiles)
        % Create a variable for current patient's folder name. 
        patientName = subfiles(i).name;
        % Define two string variables with the patient data-urls to be used
        % later on in loadData.m
        preUrl = strcat(s,patientName,skastrik,'PRE_O_grayvalues.txt');
        postUrl = strcat(s,patientName,skastrik,'POST_O_grayvalues.txt');
        
        % Add relevant information about this patient to the data struct.
        data.patients(patientCounter).name = patientName;
        data.patients(patientCounter).group = lowercaseGroup; 
        data.patients(patientCounter).groupSymbol = lowercaseGroup(1); % To be used in counting later
        data.patients(patientCounter).preUrl = preUrl; % Data url's, used in loadData.m
        data.patients(patientCounter).postUrl = postUrl;
 
        % Check if we find the letter 'F' in the patient's Name
        female = strfind(patientName,'F');
        
        % strfind returns an array. If it is not empty, the patient is a
        % female. Otherwise, it is a man. 
        if ~isempty(female)
            % Add gender data to struct. 
            data.patients(patientCounter).gender = 'F';
        else
            data.patients(patientCounter).gender = 'M';
        end
        
        patientCounter = patientCounter + 1;
    end
end

% Create two comparison vectors.
% Returns a boolean array such that all females would be [1 1 1  ...] 
% and all cemented would be [1 1 1 ...]
females = [data.patients.gender] == 'F';
cemented  = [data.patients.groupSymbol] == 'c';

% Sum upp different groups and genders.
cementedMales = sum(~females & cemented);
uncementedMales = sum(~females & ~cemented);
cementedFemales = sum(females & cemented);
uncementedFemales = sum(females & ~cemented);

% Print a message to the command window as instructed. 
fprintf('Thad eru %.f karlar og %.f konur i uncemented hopnum \n',uncementedMales,uncementedFemales)
fprintf('Thad eru %.f karlar og %.f konur i cemented hopnum \n \n',cementedMales,cementedFemales)

end

