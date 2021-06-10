a  = 2.1;
A = a : 0.1 : 2.9;
% A = a;
k = 1;
% 
q = (k/pi())*(pi()/2 + asin(1 - 2.*a./A) + 2.*(1 - 2*a./A).*sqrt((1 - a./A) .* a./A));
q_ = -((4 * k * a * (1 - a ./ A)./(pi() .* A)));

% q = (2*k/pi())*(pi()/2 - asin(a./A) - (a./A) .* (sqrt(1 - (a./A).^2)));
% q_ = 0;

W_n = q + 1i .* q_;
SS = -1 ./W_n;
V_s = real(SS);
U_s = imag(SS);

% figure
plot(V_s, U_s, '+')
title('ACHX')
set(gcf,'color','w');
grid on

Lm = -20 * log10(sqrt(q.^2 + q_ .^2));
phi = (-pi - atan(q_./ q)) * 180/pi;

% figure
% plot(A, phi)
% ylim([-110, -89.1])
% title('phi')
% set(gcf,'color','w');
% grid on
% 
% figure
% plot(A, Lm)
% ylim([0, 50])
% set(gcf,'color','w');
% title('Lm')
% grid on