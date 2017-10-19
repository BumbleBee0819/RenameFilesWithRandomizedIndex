% written by WB Sep. 26, 2017.
% This code will rename the sequantially named files (e.g. vid1.png, vid2.png, ...) with random number. 
% By default the name of the output images should look like "newvid_*.png".


curDir = pwd;
directory = pwd;
d = dir(directory);
names = {d.name};  
isdirs = {d.isdir};  
isdirs = [isdirs{:}]; 

%WB% Get unhidden files
numnames = length(names);
visible = logical(zeros(numnames, 1));
for n = 1:numnames
    name = names{n};
    if name(1) ~= '.'
        visible(n) = 1;
    end
end
names = names(visible); 
isdirs = isdirs(visible);

%WB% Cell array containing directories
list.dirs = {names{[isdirs]}};  


workDir = pwd;
for i = 1: length(isdirs)
    tmpdir = [list.dirs{i}];
    cd(tmpdir);
    
    %WB% Get all unhidden files
    file_d = dir(pwd);
    file_names = {file_d.name};  
    file_isdirs = {file_d.isdir};  
    file_isdirs = [file_isdirs{:}]; 
    
    
    file_numnames = length(file_names);
    file_visible = logical(zeros(file_numnames, 1));
    for cnt = 1:file_numnames
        file_name = file_names{cnt};
        if file_name(1) ~= '.'
            file_visible(cnt) = 1;
        end
    end
    
    file_names = file_names(file_visible);
    %WB% Get all unhiden files
    file_d = file_d(file_visible);   
    %WB% How many image files in total
    len_frames = length(file_names);
    %WB% Random permutation
    new_frame_sequence = randperm(len_frames); 
    
    %WB% Rename the image files with the new index
    for frames = 1:len_frames
        name_new = ['newvid_',int2str(new_frame_sequence(frames)),'.png'];
        try
            movefile(file_d(frames).name,name_new);
        end
    end
    
    cd(workDir);
end
    
        
        
    
    
    
    
    