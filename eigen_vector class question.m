
clear
clc
close all

k1=3; k2=2; m1=1; m2=1;

vm1_t0=0; 
vm2_t0=0;
am1_t0=3.45;
am2_t0=.775;
 
normal_mode=0; 

A = [-k1/m1 - k2/m1, k2/m1;
 k2/m2, -k2/m2]; 
[e_vectors, e_values]=eig(A); 

evect1=e_vectors(:,1) 
evect2=e_vectors(:,2)
eval1=-e_values(1,1) 
eval2=-e_values(2,2) 

temp_matrix1=[evect1(1),evect2(1);evect1(2),evect2(2)];
a1_a2=inv(temp_matrix1)*[vm1_t0;vm2_t0];
a1=a1_a2(1);
a2=a1_a2(2);

temp_matrix2=[evect1(1)*sqrt(eval1),evect2(1)*sqrt(eval2);evect1(2)*sqrt(eval1),evect2(2)*sqrt(eval2)];
b1_b2=inv(temp_matrix2)*[am1_t0;am2_t0];
b1=b1_b2(1);
b2=b1_b2(2);

if normal_mode==1
 %a1=0; b1=0; a2=1; b2=1; %first mode
 a1=1; b1=1; a2=0; b2=0; %second mode
end

% Now plug these into our equations and can plot versus time (t)

t=0:.1:10;
vm1=evect1(1)*(a1*cos(sqrt(eval1)*t)+b1*sin(sqrt(eval1)*t)) +
evect2(1)*(a2*cos(sqrt(eval2)*t)+b2*sin(sqrt(eval2)*t));

vm2=evect1(2)*(a1*cos(sqrt(eval1)*t)+b1*sin(sqrt(eval1)*t)) +
evect2(2)*(a2*cos(sqrt(eval2)*t)+b2*sin(sqrt(eval2)*t));

%This was the analytical solution FOR PARTICULAR SYSTEM PARAMETERS

vm1_class=sin(t)+sin(sqrt(6)*t);
vm2_class=2*sin(t)-0.5*sin(sqrt(6)*t);

% PLOT TO COMPARE THE SOLUTIONS ('Class solution' for given BCs)_

plot(t,vm1,t,vm2,t,vm1_class,'x',t,vm2_class,'o')
legend('vm1 - Matlab', 'vm2 - Matlab', 'vm1 - Class', 'vm2 - class');


30/4/18 2:19 PM MATLAB Command Window 1 of 1


evect1 =
        -0.8944
        0.4472

evect2 =
        -0.4472
        -0.8944
eval1 =
        6
eval2 =
        1



