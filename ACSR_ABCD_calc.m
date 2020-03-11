% EE 347 - HW 4
% Edward Rees
% written 01.20.2020
% edited 01.20.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'

while answer == 'Y'
%Constants
ft_per_mile = 5280

%Entered Values
dist_entered = input('Enter the transmission line distance in miles: ');
AC_R = input('Enter the AC Resistance per mile from the table : ');
AC_L = input('Enter the inductive reactance per mile from the table: ');
AC_C = input('Enter the capacitive admitance per mile from the table: ');
GMR = input('Enter the GMR in feet from the table: ');
spc1 = input('Enter the distance between the conductor 1 and 2 in feet: ');
spc2 = input('Enter the distance between the conductor 2 and 3 in feet: ');
spc3 = input('Enter the distance between the conductor 1 and 3 in feet: ');

%Calculated values
per1000 = dist_entered*ft_per_mile/1000
GMD = (spc1*spc2*spc3)^(1/3);
R = per1000 * AC_R;
X_L = AC_L * per1000 * log (GMD/GMR);
X_C = AC_C/per1000 * 10^6 * log (GMD/GMR);
Y_C = 1/X_C * 1j;

Z = R +X_L*1j;

A = (1 + (Y_C*Z)/2)
B = Z
C = Y_C * ((Y_C*Z)/4 + 1)
D = A




answer=input('Run again? (Y/N)','s')
end


fprintf ('\n \nStrange game.')
fprintf ('\nThe only way to win is not to play.\n')