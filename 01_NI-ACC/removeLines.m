function removeLines(fileName, numberOfLinesToRemove)

% open the file and read the contents
fid = fopen(fileName,'r');                          % io ho aggiunto string()
text = fread(fid,'*char');
fclose(fid);
% create a temporary file and save the modified text
newFile = fileName;       % io ho aggiunto string()
fid = fopen(newFile,'w');
fwrite(fid,text);
fclose(fid);

if nargin > 1
    fid = fopen(newFile,'rt');
    tempFile = tempname;
    fid2 = fopen(tempFile,'wt');
    id=0;
    tline=fgets(fid);

    while ischar(tline)
        id=id+1;
        if id > numberOfLinesToRemove
            fprintf(fid2,tline);
        end
        tline=fgets(fid);
    end
    fclose(fid); 
    fclose(fid2); 
    movefile(tempFile, newFile);
     
end

