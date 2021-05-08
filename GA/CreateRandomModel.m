function model=CreateRandomModel(I,J)

    amin=10;
    amax=90;
    a=randi([amin amax],1,I);
    
    bmax=round(1.5*sum(a));
    
    cmin=10;
    cmax=50;
    c=randi([cmin cmax],I,J);
    
    e0=1000;
    e1=50;
    
    model.I=I;
    model.J=J;
    model.a=a;
    model.bmax=bmax;
    model.c=c;
    model.e0=e0;
    model.e1=e1;

end