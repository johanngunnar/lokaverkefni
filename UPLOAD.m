%%
clear all
close all
clc

p = pwd; % notandi tharf ad vera stadsettur i moppu thar sem
         % Cemented og Uncemented mappan er svo pwd virki

for i=1:2
    
    if i == 1
        c='/data/Cemented/';
        s=strcat(p,c);
        cd(s);
        d = dir;
        
        maleC = 0; % latum teljarann fyrir karla i Cemented byrja i 0
        femaleC = 0; % sama fyrir konur
        
        for j = 4:length(d)
             b = d(j).name;
             pre = strcat(s,b,'/PRE_O_grayvalues.txt');
             post = strcat(s,b,'/POST_O_grayvalues.txt');
             
            % teljum hve margir karlar eru i cemented groupunni
                    countMC = strfind(b,'M');
                    if countMC == 4
                    maleC= maleC + 1;
                    end
                    
                    countFC = strfind(b,'F');
                    if countFC
                    femaleC = femaleC + 1;
                    end
            
        end    
    else 
        c = '/data/Uncemented/';
        s=strcat(p,c);
        cd(s) 
        d = dir;
        
        maleU = 0; % latum teljarann fyrir karla i Uncemented byrja i 0
        femaleU = 0; % sama fyrir konur
        for j = 3:length(d)
             b = d(j).name;
             pre = strcat(s,b,'/PRE_O_grayvalues.txt');
             post = strcat(s,b,'/POST_O_grayvalues.txt');
             
             % teljum hve margir karlar eru i Uncemented groupunni
                    countMU = strfind(b,'M');
                    if countMU == 4
                    maleU= maleU + 1;
                    end
                    
                    countFU = strfind(b,'F');
                    if countFU
                    femaleU = femaleU + 1;
                    end
                    
                    
        end
    end
end

fprintf('Thad eru %.f karlar og %.f konur i Uncemented hopnum\n',maleU,femaleU)
fprintf('Thad eru %.f karlar og %.f konur i Cemented hopnum',maleC,femaleC)

cd('../')



