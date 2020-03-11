% EE 347 - HW 2 Prob 3
% Edward Rees
% written 01.20.2020
% edited 01.20.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'

while answer == 'Y'

n = input ('How many iterations do you want to run?')
THD = 0
THD2 = 0
I_1RMS = -165/(pi*2^.5)


    for R = 2:n
        THD = (THD^2 +((1/(2*R-1))^2))^.5
    end

    for R = 2:n-1
        THD2 = (THD2^2 +((1/(2*R-1))^2))^.5
    end
    
    Converge_test = abs (THD-THD2)
    
    answer = input ('Run the test again? (Y/N)','s')
end

waveform = 0
t = -1/60:.0001:1/60

hold on

fund_wave = -165/pi*sin(2*pi*(2*1-1)*(60)*t)
for i = 1:13
    waveform = waveform + -165/pi * (1/(2*i-1)*sin (2*pi*(2*i-1)*(60)*t))
end
plot (t,fund_wave)
plot (t,waveform)

fprintf ('\n \nStrange game.')
fprintf ('\nThe only way to win is not to play.\n')