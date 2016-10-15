%%
clear all
close all
clc

% Initiate the project by defining our most important variables globally.

global workDir
workDir = pwd; % notandi tharf ad vera stadsettur i moppu thar sem
% Cemented og Uncemented mappan er svo pwd virki

global skastrik
if ismac == 1 
    skastrik = '/';
else 
    skastrik = '\';
end


data = initData;
    
data = loadData(data);

singleUser3D(data.patients(1));

checkHounsfield(data);

% plotAvg(data);

cd(workDir)