function CreateAndSaveModels()

    I=[6 8 10 15 20 25 30 40];
    J=[2 3  3  4  4  5  5  6];

    nProblem=numel(I);
    
    for k=1:nProblem
        
        model=CreateRandomModel(I(k),J(k));
        
        ModelName=['model_' num2str(I(k)) 'x' num2str(J(k))];
        
        save(ModelName,'model');
        
    end

end