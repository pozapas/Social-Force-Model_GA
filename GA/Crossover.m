function [ysol1 ysol2]=Crossover(xsol1,xsol2,gamma)

    Q=randi([1 7]);
    
    ysol1=xsol1;
    ysol2=xsol2;
    
    if any(Q==[1 4 5 7])
        % Apply Crossover to f (Binary)
        [ysol1.f ysol2.f]=BinaryCrossover(xsol1.f,xsol2.f);
    end
    
    if any(Q==[2 4 6 7])
        % Apply Crossover to xhat (Real)
        [ysol1.xhat ysol2.xhat]=ArithmeticCrossover(xsol1.xhat,xsol2.xhat,gamma);
    end

    if any(Q==[3 5 6 7])
        % Apply Crossover to xhat (Real)
        [ysol1.bhat ysol2.bhat]=ArithmeticCrossover(xsol1.bhat,xsol2.bhat,gamma);
    end
    
end

function [y1 y2]=BinaryCrossover(x1,x2)

    pSinglePoint=0.1;
    pDoublePoint=0.2;
    pUniform=1-pSinglePoint-pDoublePoint;
    
    METHOD=RouletteWheelSelection([pSinglePoint pDoublePoint pUniform]);
    
    switch METHOD
        case 1
            [y1 y2]=SinglePointCrossover(x1,x2);
            
        case 2
            [y1 y2]=DoublePointCrossover(x1,x2);
            
        case 3
            [y1 y2]=UniformCrossover(x1,x2);
            
    end


end

function [y1 y2]=SinglePointCrossover(x1,x2)

    nVar=numel(x1);
    
    c=randi([1 nVar-1]);
    
    y1=[x1(1:c) x2(c+1:end)];
    y2=[x2(1:c) x1(c+1:end)];

end

function [y1 y2]=DoublePointCrossover(x1,x2)

    nVar=numel(x1);
    
    cc=randsample(nVar-1,2);
    c1=min(cc);
    c2=max(cc);
    
    y1=[x1(1:c1) x2(c1+1:c2) x1(c2+1:end)];
    y2=[x2(1:c1) x1(c1+1:c2) x2(c2+1:end)];

end

function [y1 y2]=UniformCrossover(x1,x2)

    alpha=randi([0 1],size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
end

function [y1 y2]=ArithmeticCrossover(x1,x2,gamma)

    VarMin=0;
    VarMax=1;

    alpha=unifrnd(-gamma,1+gamma,size(x1));
    
    y1=alpha.*x1+(1-alpha).*x2;
    y2=alpha.*x2+(1-alpha).*x1;
    
    y1=max(y1,VarMin);
    y1=min(y1,VarMax);
    
    y2=max(y2,VarMin);
    y2=min(y2,VarMax);

end
