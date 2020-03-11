% ECE 322 - HW 2
% Edward Rees
% written 01.20.2020
% edited 01.20.2020


% clear and clean workspace and windows
clear
close all 

% variables and arrays
answer = 'Y'

% Electric field from a ring charge

y = -5:.5:5;                %meters
z = 0:.25:5;                %meters

[Y,Z] = meshgrid (y,z);

b = 2;                      %radius of ring charge
rho_1 = 1;                  %line charge density; Coulomb/meter
phi = [0:pi/1000:pi]       %variable in radians

delphi = b .* (phi(2)-phi(1)); %differential element
Ex = zeros (length(z),length(y));
Ey = zeros (length(z),length(y));
Ez = zeros (length(z),length(y));

for m = 1:length(y);
    for n = 1:length(z); 
        for o = 1:length(phi);
            xr = b .* cos(phi(o)); %x coordinate of ring
            yr = b .* sin(phi(o)); %y coordinate of ring
            Rp = [0 Y(n,m) Z(n,m)]-[xr yr 0];
            Rp2 = dot(Rp,Rp);
            Rhat = Rp/sqrt(Rp2);
            Ex(n,m) = Ex(n,m) + Rhat(1) ./ Rp2;
            Ey(n,m) = Ey(n,m) + Rhat(2) ./ Rp2;
            Ez(n,m) = Ez(n,m) + Rhat(3) ./ Rp2;
        end
    end
end

Ex = rho_1*delphi .* Ex ./ (4*pi*8.85e-12)
Ey = rho_1*delphi .* Ey ./ (4*pi*8.85e-12)
Ez = rho_1*delphi .* Ez ./ (4*pi*8.85e-12)

%generate divergence
%calc_div=(0.*xcomp.*ycomp)
lab_div=divergence(Y,Z,Ey,Ez)

%generate curl
%calc_curl=(2.*cos(x).*cos(y))
lab_curl=curl(Y,Z,Ey,Ez)

%generate quiver plot
figure
quiver (Y,Z,Ey,Ez)
title('Vector field (Ring Charge)')
xlabel('Y-Axis')
ylabel('Z-Axis')

%generate lab divergence plot
hold on
figure
pcolor(Y,Z,lab_div); shading ('flat'); colorbar
%caxis([-1 1])
title('Lab Divergence (Ring Charge)')
xlabel('Y-Axis')
ylabel('Z-Axis')


%generate calc curl plot
hold on
figure
pcolor(Y,Z,lab_curl); shading ('flat'); colorbar
title('Lab Curl (Ring Charge)')
xlabel('X-Axis')
ylabel('Y-Axis')