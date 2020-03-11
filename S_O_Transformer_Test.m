% ECE 322 - HW 2
% Edward Rees
% written 01.20.2020
% edited 01.20.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'

%Transformer Model
while answer == 'Y'
   %User input values
   %Short Circuit Test
   V_SC = input ('Enter Short Circuit Voltage: ');
   I_SC = input ('Enter Short Circuit Current (Rated Current): ');
   P_SC = input ('Enter Short Circuit Power: ');
   
   %Open Circuit Test
   V_OC = input ('Enter Open Circuit Voltage (Rated Voltage): ');
   I_OC = input ('Enter Open Circuit Current: ');
   P_OC = input ('Enter Open Circuit Power: ');
   
   %Calcualted Values
   Z_EQ = V_SC/I_SC;
   Theta_SC = acos (P_SC/(V_SC*I_SC));
   R_EQ = Z_EQ*cos(Theta_SC);
   X_EQ = Z_EQ*sin(Theta_SC);
   
   Y_OC = I_OC/V_OC;
   Theta_OC = -1*acos(P_OC/(V_OC*I_OC));
   G_OC = Y_OC*cos(Theta_OC);
   B_OC = Y_OC*sin(Theta_OC);
   R_C = 1/G_OC;
   X_M = -1/B_OC;
   
   fprintf ('\nR_EQ = %d\n', R_EQ)
   fprintf ('\nX_EQ = %d\n', X_EQ)
   fprintf ('\nR_C = %d\n', R_C)
   fprintf ('\nX_M = %d\n', X_M)
   
   answer=input('Run again? (Y/N)','s')
end

answer = 'Y'

%Voltage Regulation
while answer == 'Y'
    %User input values
    V_rated = V_OC;
    S_rated = input ('Enter the rated apparent power: ');
    PF_load = input ('Power factor of the load: ');
    
    %Calculated values
    I_sa = S_rated/V_rated;
    PF_theta = -1*acos(PF_load);
    I_sa_rect = I_sa*cos(PF_theta) + 1j*I_sa*sin(PF_theta);
    V_p_nl = V_rated
    delta_v = I_sa_rect*(R_EQ+1j*X_EQ)
    V_p_fl = V_rated + delta_v
    VR_load = (abs(V_p_nl) - abs(V_p_fl))/abs(V_p_fl)
    
    
    answer=input('Run again? (Y/N)','s')
end

answer = 'Y'

%Efficiency
while answer == 'Y'
 
    
    %calculated values
    I_rated = I_SC;
    P_out = V_rated*I_rated*PF_load; 
    eff_mat = [0:1:120];
    V_seen = linspace (120,141.44,121);
    I_seen = linspace (.029,.5942,121);
    
    i=1
    
    while i < 122
        P_cu = I_seen(i)^2*R_EQ;
        P_core = V_seen(i)^2/R_C;
        P_loss = P_cu+P_core
        Eff = (P_out*((i-1)/100))/(P_out*((i-1)/100)+P_loss);
        eff_mat(i) = Eff*100;
        i=i+1;
    end
    
    plot (eff_mat);
    
    answer=input('Run again? (Y/N)','s')
end
fprintf ('\n \nStrange game.')
fprintf ('\nThe only way to win is not to play.\n')