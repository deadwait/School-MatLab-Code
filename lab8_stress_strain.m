% ENGR Lab 8 Stress, Strain, and Deflection 
% Edward Rees
% written 11.28.2018
% edited 11.28.2018

% What we're doing...
    % Calculates Stress, Strain, and Elastic Deformation of a cylindrical 
    % Rod for user defined inputs, the script is looped so the user can 
    % repeat the process.
    % Takes inputs of:
    %   load in kilo-Newtons
    %   Length in meters
    %   Diameter in milli-meters
    %   Modulus of Elasticity in Giga-Pascals
    % Produces outputs of:
    %   Stress in MPa
    %   Strain in m/m
    %   Deflection in mm


% clear and clean workspace and windows
clear
close all 
clc

% Program statement
fprintf ('This Program calculates Stress, Strain, and Elastic Deformation')
fprintf ('\nof a cylindrical Rod based on your inputs of Load, Length of')
fprintf ('\nthe Rod, Diameter of the Rod, and the Modulus of Elasticity of')
fprintf ('\nthe Rod\n')

run=1;

while run ==1
    close all
% user input
loadkN=input ('\n\nPlease enter the load in kilo-Newtons (kN) - ');
lengthm=input ('Please enter rod length in meters (m)- ');
diametermm=input ('Please enter rod diameter in millimeters (mm) - ');
modulusGPa=input ('Please enter rod modulus of elasticity in giga-Pascals (GPa) - ');

% Manipulate user input to base units
loadN=loadkN*10^(3);
radiusm=(diametermm*10^(-3))/2;
modulusPa=modulusGPa*10^(9);

% Calculate stress, strain and defeflection
rodArea=pi*radiusm^2;
stressPa=loadN/rodArea;
deflectionm=(loadN*lengthm)/(rodArea*modulusPa);
strain=deflectionm/lengthm;

% Manipulate calculations for output
stressMPa=stressPa*10^-6;
deflectionmm=deflectionm*10^3;

% Output calculations to user
fprintf ('\nThe stress in the rod is %0.3f Mega-Pascals(MPa)',stressMPa)
fprintf ('\nThe strain in the rod is %0.3f',strain)
fprintf ('\nThe deflection in the rod is %0.3f millimeters (mm)',deflectionmm)

answer=input ('\n\nWould you like to calculate the Stress, Strain, and Defelction \nof another rod? (Y/N)  ','s');


if answer=='y'||answer=='Y'
    run=1;
else run=0;
end 
end

fprintf ('\n \nStrange game.')
fprintf ('\nThe only way to win is not to play.\n')
