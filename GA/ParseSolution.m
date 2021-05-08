function sol2=ParseSolution(sol1,model)

    I=model.I;
    J=model.J;
    a=model.a;
    bmax=model.bmax;
    
    f=sol1.f;
    xhat=sol1.xhat;
    bhat=sol1.bhat;
    
    x=zeros(I,J);
    if any(f~=0)
        for i=1:I
            x(i,:)=a(i)*f.*xhat(i,:)/sum(f.*xhat(i,:));
        end
    else
        x(:)=1e20;
    end
    
    b=bhat*bmax;
    
    sol2.f=f;
    sol2.x=x;
    sol2.b=b;

end