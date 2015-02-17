function jpg = pathAll2JPEG ()
    prompt = {'Enter the directory to the image:'};
    dlg_title = 'Input';
    num_lines = 1;
    def = {'/Users/'};
    answer = inputdlg(prompt, dlg_title,num_lines,def);
    directory = strcat(answer(1));
    
    direc = cell2mat(directory);
    direc = horzcat(direc);
    
    imdir = dir(fullfile(direc));
    
    for k=4:length(imdir)
        
        fileDir = strcat(direc,'/', imdir(k).name);
        
        I = imread(fileDir);
        
        I_name = imdir(k).name;
        
        I_name = I_name(1:end-5);
        
        I_name = strcat(I_name, '.jpg');
        
        imwrite(I, I_name, 'jpg', 'Comment', 'My JPEG file')
    end
end