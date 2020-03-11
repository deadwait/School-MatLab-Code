% ECE 3331 Lab 2
% Edward Rees
% written 02.07.2020
% edited 02.07.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'


% ECE 322 - HW 2
% Edward Rees
% written 01.20.2020
% edited 01.20.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'

%   MESHGRID   X and Y arrays for 3-D plots.
%   [X,Y] = MESHGRID(x,y) transforms the domain specified by vectors
%   x and y into arrays X and Y that can be used for the evaluation
%   of functions of two variables and 3-D surface plots.
%   The rows of the output array X are copies of the vector x and
%   the columns of the output array Y are copies of the vector y.

%[X,Y] = meshgrid(-4:.2:4, -4:.2:4);
%Z = X .* exp (-X^2-Y.^2);
%surf (X,Y,Z)

%   Quiver plot.
%   QUIVER(X,Y,U,V) plots velocity vectors as arrows with components (u,v)
%   at the points (x,y).  The matrices X,Y,U,V must all be the same size
%   and contain corresponding position and velocity components (X and Y
%   can also be vectors to specify a uniform grid).  QUIVER automatically
%   scales the arrows to fit within the grid.
%   [x,y] = meshgrid(-2:.2:2,-1:.15:1);
%   z = x .* exp(-x.^2 - y.^2); 
%   [px,py] = gradient(z,.2,.15);
%   contour(x,y,z), hold on 
%   quiver(x,y,px,py), hold off, axis image


%generate mesh grid
[x,y] = meshgrid (-10:.5:10, -10:.5:10)

%generate x and y values of vectors
r = sqrt(x.*x+y.*y);
phi = atan2(y,x);
 
I = 10000;
u0 = 4*pi*10^(-7);
 
xcomp = ((-u0*I)./(2*pi.*r)).*sin(phi);
ycomp = (( u0*I)./(2*pi.*r)).*cos(phi);
 
xcomp(21,21) = 0;
ycomp(21,21) = 0;

%generate divergence
calc_div=(0.*xcomp.*ycomp)
lab_div=divergence(x,y,xcomp,ycomp)

%generate curl
calc_curl=((u0*I)./(2*pi*r.^2))
lab_curl=curl(x,y,xcomp,ycomp)

%generate quiver plot
quiver (x,y,xcomp,ycomp)
title('Vector field (Problem 1)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calculated divergence plot
hold on
figure
pcolor(x,y,calc_div); shading ('flat'); colorbar
title('Calculated Divergence (Problem 1)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate lab divergence plot
hold on
figure
pcolor(x,y,lab_div); shading ('flat'); colorbar
%caxis([-1 1])
title('Lab Divergence (Problem 1)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calc curl plot
hold on
figure
pcolor(x,y,calc_curl); shading ('flat'); colorbar
title('Calculated Curl (Problem 1)')
xlabel('X-Axis')
ylabel('Y-Axis')

%generate calc curl plot
hold on
figure
pcolor(x,y,lab_curl); shading ('flat'); colorbar
title('Lab Curl (Problem 1)')
xlabel('X-Axis')
ylabel('Y-Axis')
