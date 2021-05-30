w = tf(0.1318, [0.02 1]);
w = w * tf(1, [1.6129e-04 1]);
w = w * tf(1, [1 0]);

% P = 1600;
% I = tf([176], [1 0]);
% D = tf([40 0], [0.0000000001 1]);
% PID = P + I + D;

P = 4200;
I = tf([1200], [1 0]);
D = tf([1], [1 0]);
D = 70 * 1/D;
% D = tf([70], [0.000001 1]);
PID = P + I + D;
% W = tf([5.272 210.9 10.02], [3.226e-06 0.02016 1 0 0]);

W = w * PID;

bode(W * 10);
opts = bodeoptions;
opts = bodeoptions('cstprefs');
% opts.XLim = [0.01 1000000];
opts.TickLabel.FontSize = 14;
% freqs([5.272 210.9 10.02], [3.226e-06 0.02016 1 0 0])
% set(gca,'XScale','lin')