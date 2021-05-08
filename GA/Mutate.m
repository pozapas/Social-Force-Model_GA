function ysol=Mutate(xsol,mu)

    Q=randi([1 7]);
    
    ysol=xsol;
    
    if any(Q==[1 4 5 7])
        % Apply Mutation to f (Binary)
        ysol.f=BinaryMutate(xsol.f,mu);
    end
    
    if any(Q==[2 4 6 7])
        % Apply Mutation to xhat (Real)
        ysol.xhat=RealMutate(xsol.xhat,mu);
    end

    if any(Q==[3 5 6 7])
        % Apply Mutation to bhat (Real)
        ysol.bhat=RealMutate(xsol.bhat,mu);
    end
    
end

function y=BinaryMutate(x,mu)

    nVar=numel(x);
    
    nmu=ceil(mu*nVar);
    
    j=randsample(nVar,nmu);
    
    y=x;
    y(j)=1-x(j);

end

function y=RealMutate(x,mu)

    VarMin=0;
    VarMax=1;

    nVar=numel(x);
    
    nmu=ceil(mu*nVar);
    
    j=randsample(nVar,nmu);
    
    sigma=0.1*(VarMax-VarMin);
    
    y=x;
    y(j)=x(j)+sigma*randn(size(j));
    
    y=max(y,VarMin);
    y=min(y,VarMax);

end

