tic;
clc;
clear;

    
filename = 'Val_C.xlsx';
sheet = 25;

V0 = xlsread(filename, sheet, 'C1:C8');
e0x = xlsread(filename, sheet, 'D1:D8');
e0y = xlsread(filename, sheet, 'E1:E8');
Vax = xlsread(filename, sheet, 'F1:F8');
Vay = xlsread(filename, sheet, 'G1:G8');
N_Va = xlsread(filename, sheet, 'H1:H8');
xb1 = xlsread(filename, sheet, 'I1:I8');
yb1 = xlsread(filename, sheet, 'J1:J8');
dab1x = xlsread(filename, sheet, 'K1:K8');
dab1y = xlsread(filename, sheet, 'L1:L8');
N_dab1 = xlsread(filename, sheet, 'M1:M8');
Vb1x = xlsread(filename, sheet, 'N1:N8');
Vb1y = xlsread(filename, sheet, 'O1:O8');
N_vb1 = xlsread(filename, sheet, 'P1:P8');
xb2 = xlsread(filename, sheet, 'Q1:Q8');
yb2 = xlsread(filename, sheet, 'R1:R8');
dab2x = xlsread(filename, sheet, 'S1:S8');
dab2y = xlsread(filename, sheet, 'T1:T8');
N_dab2 = xlsread(filename, sheet, 'U1:U8');
Vb2x = xlsread(filename, sheet, 'V1:V8');
Vb2y = xlsread(filename, sheet, 'W1:W8');
N_vb2 = xlsread(filename, sheet, 'X1:X8');
xb3 = xlsread(filename, sheet, 'Y1:Y8');
yb3 = xlsread(filename, sheet, 'Z1:Z8');
dab3x = xlsread(filename, sheet, 'AA1:AA8');
dab3y = xlsread(filename, sheet, 'AB1:AB8');
N_dab3 = xlsread(filename, sheet, 'AC1:AC8');
Vb3x = xlsread(filename, sheet, 'AD1:AD8');
Vb3y = xlsread(filename, sheet, 'AE1:AE8');
N_vb3 = xlsread(filename, sheet, 'AF1:AF8');
taw = xlsread(filename, sheet, 'AG1:AG8');
alpha = xlsread(filename, sheet, 'AH1:AH8');
beta = xlsread(filename, sheet, 'AI1:AI8');
dt = xlsread(filename, sheet, 'AJ1:AJ8');
landa = xlsread(filename, sheet, 'AK1:AK8');

F1=sqrt(((V0.*e0x-Vax)./taw).^2 + ((V0.*e0y-Vay)./taw).^2);

b1 =0.5.*sqrt((N_dab1 + abs(N_dab1 -(N_vb1 - N_Va).*dt)).^2 + ((N_vb1 - N_Va).*dt).^2);
F21=(N_dab1 + abs(N_dab1 -(N_vb1 -N_Va).*dt))./2.*b1;
F31=(1+Vax./N_Va.*(-dab1x)./N_dab1 +Vay./N_Va.*(-dab1y)./N_dab1)/2;
F41=dab1x ./N_dab1 +((dab1x -(Vb1x -Vax).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
F51=dab1y./N_dab1 +((dab1y -(Vb1y -N_Va).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
FFx1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F41);
FFy1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F51);
FF1=sqrt((FFx1.^2)+(FFy1.^2));

b2 =0.5.*sqrt((N_dab2 + abs(N_dab2 -(N_vb2 - N_Va).*dt)).^2 + ((N_vb2 - N_Va).*dt).^2);
F22=(N_dab2 + abs(N_dab2 -(N_vb2 -N_Va).*dt))./2.*b2;
F32=(1+Vax./N_Va.*(-dab2x)./N_dab2 +Vay./N_Va.*(-dab2y)./N_dab2)/2;
F42=dab2x ./N_dab2 +((dab2x -(Vb2x -Vax).*dt)./(abs(N_dab2 -(N_vb2 -N_Va).*dt)));
F52=dab2y./N_dab2 +((dab2y -(Vb2y -N_Va).*dt)./(abs(N_dab2 -(N_vb2 -N_Va).*dt)));
FFx2=alpha.*exp(-b1./beta).*F22.*(landa+(1-landa).*F32).*0.5.*(F42);
FFy2=alpha.*exp(-b1./beta).*F22.*(landa+(1-landa).*F32).*0.5.*(F52);
FF2=sqrt((FFx2.^2)+(FFy2.^2));

b3 =0.5.*sqrt((N_dab3 + abs(N_dab3 -(N_vb3 - N_Va).*dt)).^2 + ((N_vb3 - N_Va).*dt).^2);
F23=(N_dab3 + abs(N_dab3 -(N_vb3 -N_Va).*dt))./2.*b3;
F33=(1+Vax./N_Va.*(-dab3x)./N_dab3 +Vay./N_Va.*(-dab3y)./N_dab3)/2;
F43=dab3x ./N_dab3 +((dab3x -(Vb3x -Vax).*dt)./(abs(N_dab3 -(N_vb3 -N_Va).*dt)));
F53=dab3y./N_dab3 +((dab3y -(Vb3y -N_Va).*dt)./(abs(N_dab3 -(N_vb3 -N_Va).*dt)));
FFx3=alpha.*exp(-b1./beta).*F23.*(landa+(1-landa).*F33).*0.5.*(F43);
FFy3=alpha.*exp(-b1./beta).*F23.*(landa+(1-landa).*F33).*0.5.*(F53);
FF3=sqrt((FFx3.^2)+(FFy3.^2));

a = F1 + FF1 + FF2 + FF3;

filename = 'Val_C.xlsx';
sheet = 25;

xlswrite(filename, a, sheet, 'AN1:AN8')


filename = 'Val_C.xlsx';
sheet = 25;

V0 = xlsread(filename, sheet, 'C9:C48');
e0x = xlsread(filename, sheet, 'D9:D48');
e0y = xlsread(filename, sheet, 'E9:E48');
Vax = xlsread(filename, sheet, 'F9:F48');
Vay = xlsread(filename, sheet, 'G9:G48');
N_Va = xlsread(filename, sheet, 'H9:H48');
xb1 = xlsread(filename, sheet, 'I9:I48');
yb1 = xlsread(filename, sheet, 'J9:J48');
dab1x = xlsread(filename, sheet, 'K9:K48');
dab1y = xlsread(filename, sheet, 'L9:L48');
N_dab1 = xlsread(filename, sheet, 'M9:M48');
Vb1x = xlsread(filename, sheet, 'N9:N48');
Vb1y = xlsread(filename, sheet, 'O9:O48');
N_vb1 = xlsread(filename, sheet, 'P9:P48');
xb2 = xlsread(filename, sheet, 'Q9:Q48');
yb2 = xlsread(filename, sheet, 'R9:R48');
dab2x = xlsread(filename, sheet, 'S9:S48');
dab2y = xlsread(filename, sheet, 'T9:T48');
N_dab2 = xlsread(filename, sheet, 'U9:U48');
Vb2x = xlsread(filename, sheet, 'V9:V48');
Vb2y = xlsread(filename, sheet, 'W9:W48');
N_vb2 = xlsread(filename, sheet, 'X9:X48');
taw = xlsread(filename, sheet, 'AG9:AG48');
alpha = xlsread(filename, sheet, 'AH9:AH48');
beta = xlsread(filename, sheet, 'AI9:AI48');
dt = xlsread(filename, sheet, 'AJ9:AJ48');
landa = xlsread(filename, sheet, 'AK9:AK48');

F1=sqrt(((V0.*e0x-Vax)./taw).^2 + ((V0.*e0y-Vay)./taw).^2);

b1 =0.5.*sqrt((N_dab1 + abs(N_dab1 -(N_vb1 - N_Va).*dt)).^2 + ((N_vb1 - N_Va).*dt).^2);
F21=(N_dab1 + abs(N_dab1 -(N_vb1 -N_Va).*dt))./2.*b1;
F31=(1+Vax./N_Va.*(-dab1x)./N_dab1 +Vay./N_Va.*(-dab1y)./N_dab1)/2;
F41=dab1x ./N_dab1 +((dab1x -(Vb1x -Vax).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
F51=dab1y./N_dab1 +((dab1y -(Vb1y -N_Va).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
FFx1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F41);
FFy1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F51);
FF1=sqrt((FFx1.^2)+(FFy1.^2));

b2 =0.5.*sqrt((N_dab2 + abs(N_dab2 -(N_vb2 - N_Va).*dt)).^2 + ((N_vb2 - N_Va).*dt).^2);
F22=(N_dab2 + abs(N_dab2 -(N_vb2 -N_Va).*dt))./2.*b2;
F32=(1+Vax./N_Va.*(-dab2x)./N_dab2 +Vay./N_Va.*(-dab2y)./N_dab2)/2;
F42=dab2x ./N_dab2 +((dab2x -(Vb2x -Vax).*dt)./(abs(N_dab2 -(N_vb2 -N_Va).*dt)));
F52=dab2y./N_dab2 +((dab2y -(Vb2y -N_Va).*dt)./(abs(N_dab2 -(N_vb2 -N_Va).*dt)));
FFx2=alpha.*exp(-b1./beta).*F22.*(landa+(1-landa).*F32).*0.5.*(F42);
FFy2=alpha.*exp(-b1./beta).*F22.*(landa+(1-landa).*F32).*0.5.*(F52);
FF2=sqrt((FFx2.^2)+(FFy2.^2));

a = F1 + FF1 + FF2;

filename = 'Val_C.xlsx';
sheet = 25;

xlswrite(filename, a, sheet, 'AN9:AN48')

filename = 'Val_C.xlsx';
sheet = 25;

V0 = xlsread(filename, sheet, 'C49:C209');
e0x = xlsread(filename, sheet, 'D49:D209');
e0y = xlsread(filename, sheet, 'E49:E209');
Vax = xlsread(filename, sheet, 'F49:F209');
Vay = xlsread(filename, sheet, 'G49:G209');
N_Va = xlsread(filename, sheet, 'H49:H209');
xb1 = xlsread(filename, sheet, 'I49:I209');
yb1 = xlsread(filename, sheet, 'J49:J209');
dab1x = xlsread(filename, sheet, 'K49:K209');
dab1y = xlsread(filename, sheet, 'L49:L209');
N_dab1 = xlsread(filename, sheet, 'M49:M209');
Vb1x = xlsread(filename, sheet, 'N49:N209');
Vb1y = xlsread(filename, sheet, 'O49:O209');
N_vb1 = xlsread(filename, sheet, 'P49:P209');
taw = xlsread(filename, sheet, 'AG49:AG209');
alpha = xlsread(filename, sheet, 'AH49:AH209');
beta = xlsread(filename, sheet, 'AI49:AI209');
dt = xlsread(filename, sheet, 'AJ49:AJ209');
landa = xlsread(filename, sheet, 'AK49:AK209');

F1=sqrt(((V0.*e0x-Vax)./taw).^2 + ((V0.*e0y-Vay)./taw).^2);

b1 =0.5.*sqrt((N_dab1 + abs(N_dab1 -(N_vb1 - N_Va).*dt)).^2 + ((N_vb1 - N_Va).*dt).^2);
F21=(N_dab1 + abs(N_dab1 -(N_vb1 -N_Va).*dt))./2.*b1;
F31=(1+Vax./N_Va.*(-dab1x)./N_dab1 +Vay./N_Va.*(-dab1y)./N_dab1)/2;
F41=dab1x ./N_dab1 +((dab1x -(Vb1x -Vax).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
F51=dab1y./N_dab1 +((dab1y -(Vb1y -N_Va).*dt)./(abs(N_dab1 -(N_vb1 -N_Va).*dt)));
FFx1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F41);
FFy1=alpha.*exp(-b1./beta).*F21.*(landa+(1-landa).*F31).*0.5.*(F51);
FF1=sqrt((FFx1.^2)+(FFy1.^2));
 
a = F1 + FF1;

filename = 'Val_C.xlsx';
sheet = 25;

xlswrite(filename, a, sheet, 'AN49:AN209')


filename = 'Val_C.xlsx';
sheet = 25;

a_o = xlsread(filename, sheet, 'AM:AM');
a = xlsread(filename, sheet, 'AN:AN');
sz = size(a,1);
nrmse = sqrt(sum((((a_o-a)./a_o).^2)')/sz);
Teile = sqrt(sum(((a-a_o).^2)')/sz)/(sqrt(sum((a.^2)')/sz)+sqrt(sum((a_o.^2)')/sz));

filename = 'Val_C.xlsx';
sheet = 25;

xlswrite(filename, nrmse, sheet, 'AP1')
xlswrite(filename, Teile, sheet, 'AQ1')

toc;
