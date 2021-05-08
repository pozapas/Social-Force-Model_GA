function model=SelectModel()

    [FileName FilePath]=uigetfile({'*.mat','MAT Files (*.mat)';'*.*','All Files (*.*)'},'Select Model ...');
    
    if FileName==0
        model=[];
        return;
    end
    
    FullFileName=[FilePath FileName];
    
    data=load(FullFileName);
    
    model=data.model;

end