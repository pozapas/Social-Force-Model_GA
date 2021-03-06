
options.PopulationSize=pop_size;
options.Generations=generation;
options. StallGenLimit=generation;
[X,fval]=ga(@fun,5,options);
X=[abs(satlin(X(1))) X(2) abs(satlin(X(3:5)))];
Taw=X(1)*(0.9-0.4)+0.4;
A=X(2);
B=X(3)*(0.225-0.1)+0.1;
dt=X(4)*(2-1)+1;
landa=X(5)*(1-0)+0;
b(:,1)=0.5*sqrt((D(:,13)+abs(D(:,13)-(D(:,16)-D(:,8))*dt)).^2+((D(:,16)-D(:,8))*dt).^2);
b(:,2)=0.5*sqrt((D(:,21)+abs(D(:,21)-(D(:,24)-D(:,8))*dt)).^2+((D(:,24)-D(:,8))*dt).^2);
b(:,3)=0.5*sqrt((D(:,29)+abs(D(:,29)-(D(:,32)-D(:,8))*dt)).^2+((D(:,32)-D(:,8))*dt).^2);
F1=(D(:,3).*D(:,4)-D(:,6)+D(:,3).*D(:,5)-D(:,7))/Taw;
F0=D(:,1)+D(:,2);
F2(:,1)=(D(:,13)+abs(D(:,13)-(D(:,16)-D(:,8))*dt))./2./b(:,1);
F2(:,2)=(D(:,21)+abs(D(:,21)-(D(:,24)-D(:,8))*dt))./2./b(:,2);
F2(:,3)=(D(:,29)+abs(D(:,29)-(D(:,32)-D(:,8))*dt))./2./b(:,3);
F3(:,1)=(1+D(:,6)./D(:,8).*(-D(:,11))./D(:,13)+D(:,7)./D(:,8).*(-D(:,12))./D(:,13))/2;
F3(:,2)=(1+D(:,6)./D(:,8).*(-D(:,19))./D(:,21)+D(:,7)./D(:,8).*(-D(:,20))./D(:,21))/2;
F3(:,3)=(1+D(:,6)./D(:,8).*(-D(:,27))./D(:,29)+D(:,7)./D(:,8).*(-D(:,28))./D(:,29))/2;
F4(:,1)=D(:,11)./D(:,13)+(D(:,11)-(D(:,14)-D(:,6)).*dt)./(abs(D(:,13)-(D(:,16)-D(:,8)).*dt));
F4(:,2)=D(:,19)./D(:,21)+(D(:,19)-(D(:,22)-D(:,6)).*dt)./(abs(D(:,21)-(D(:,24)-D(:,8)).*dt));
F4(:,3)=D(:,27)./D(:,29)+(D(:,27)-(D(:,30)-D(:,6)).*dt)./(abs(D(:,29)-(D(:,32)-D(:,8)).*dt));

F5(:,1)=D(:,12)./D(:,13)+(D(:,12)-(D(:,15)-D(:,8)).*dt)./(abs(D(:,13)-(D(:,16)-D(:,8)).*dt));
F5(:,2)=D(:,20)./D(:,21)+(D(:,20)-(D(:,23)-D(:,8)).*dt)./(abs(D(:,21)-(D(:,24)-D(:,8)).*dt));
F5(:,3)=D(:,28)./D(:,29)+(D(:,28)-(D(:,31)-D(:,8)).*dt)./(abs(D(:,29)-(D(:,32)-D(:,8)).*dt));

FF(:,1)=A*exp(-b(:,1)./B).*F2(:,1).*(landa+(1-landa)).*F3(:,1).*0.5.*(F4(:,1)+F5(:,1)) ;
FF(:,2)=A*exp(-b(:,2)./B).*F2(:,2).*(landa+(1-landa)).*F3(:,2).*0.5.*(F4(:,2)+F5(:,2)) ;
FF(:,3)=A*exp(-b(:,3)./B).*F2(:,3).*(landa+(1-landa)).*F3(:,3).*0.5.*(F4(:,3)+F5(:,3)) ;
z=F1-F0+sum(FF,2);
clc
disp('optimization completed ...')
disp(['Taw=' num2str(Taw)])
disp(['A=' num2str(A)])
disp(['B=' num2str(B)])
disp(['dt=' num2str(dt)])
disp(['landa=' num2str(landa)])



