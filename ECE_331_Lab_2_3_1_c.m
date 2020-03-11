% ECE 3331 Lab 2
% Edward Rees
% written 02.07.2020
% edited 02.07.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'


%generate mesh grid
[x,y] = meshgrid (-10:.5:10, -10:.5:10)
phi = atan2(y,x)
r = sqrt(x.*x+y.*y)

%generate x and y values of vectors
phi_comp = r.*cos(phi)
rcomp = r
xcomp = r.*cos(phi) - r.*sin(phi).*cos(phi)
ycomp = r.*sin(phi) + r.*cos(phi).*cos(phi)

%generate divergence
calc_div=(2.-sin(phi))
lab_div=divergence(x,y,xcomp,ycomp)

%generate curl
calc_curl=(2.*cos(phi))
lab_curl=curl(x,y,xcomp,ycomp)

%generate quiver plot
quiver (x,y,xcomp,ycomp)
title('Vector field (Problem 3)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calculated divergence plot
hold on
figure
pcolor(x,y,calc_div); shading ('flat'); colorbar
title('Calculated Divergence (Problem 3)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate lab divergence plot
hold on
figure
pcolor(x,y,lab_div); shading ('flat'); colorbar
%caxis([-1 1])
title('Lab Divergence (Problem 3)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calc curl plot
hold on
figure
pcolor(x,y,calc_curl); shading ('flat'); colorbar
title('Calculated Curl (Problem 3)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calc curl plot
hold on
figure
pcolor(x,y,lab_curl); shading ('flat'); colorbar
title('Lab Curl (Problem 3)')
xlabel('X-Axis')
ylabel('Y-Axis')
