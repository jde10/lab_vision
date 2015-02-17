function jpg = path2JPEG ()
%enter directory to image up to last folder, without last slash
    prompt = {'Enter the directory to the image:', 'Enter the image name'};
    dlg_title = 'Input';
    num_lines = 1;
    def = {'/Users/', 'image.tiff'};
    answer = inputdlg(prompt, dlg_title,num_lines,def);
    
    directory = strcat(answer(1),'/', answer(2));
    direct = cell2mat(directory);
    
    I = imread(direct);
    
    Name = strcat(cell2mat(answer(2)));
    Name = Name(1:end-5);
    Name = strcat(Name, '.jpg');
    
    imwrite(I, Name, 'jpg', 'Comment', 'My JPEG file')
end