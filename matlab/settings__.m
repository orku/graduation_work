w1 = tf([1], [0.00027 1.63]);
k1 = 37.7 * 0.001;
w1k1 = w1 * k1;
w2 = 1.2 * tf([1], [0.00002 0]);
k3 = 2.4 * 0.14/(196*0.8);
k4 = 3.95 * 0.01;
k4w1 = k4*w1;
k2 = 1/196;
w3 = k3*k2 + k4w1;
% w3 = k3k2 + k4w1 + 9/(196 * 0.8); huetd
w2_ = feedback(w2, w3);
a = w2_ * w1;
full = a*k2;
ir = tf([1], [1 0]);
full_angle = full * ir;

P = 4200;
I = tf([1200], [1 0]);
D = 70 * 1/(tf(1, [1 0]));
PID = P + I + D;

% full_correct = feedback(PID * full_angle, 1);
opts = bodeoptions;
opts = bodeoptions('cstprefs');
opts.XLim = [0.01 1000000];

opt = stepDataOptions;
opt.InputOffset = 1;
opt.StepAmplitude = 2;