w1 = tf([1], [0.00027 1.63]);
k1 = 37.7 * 0.001;
w1k1 = w1 * k1;
w2 = 1.2 * tf([1], [0.00002 0]);
k3 = 2.4 * 0.14/(196*0.8);
k4 = 3.95 * 0.01;bo
k4w1 = k4*w1;
k2 = 1/196;
w3 = k3*k2 + k4w1;
% w3 = k3k2 + k4w1 + 9/(196 * 0.8); huetd
w2_ = feedback(w2, w3);
a = w2_ * w1;
full = a*k2;
ir = tf([1], [1 0]);
full_angle = full * ir;

P = 11194;
I = tf([1230.70], [1 0]);
D = tf([1 0], [0.0000000001 1]);
PID = P + I + D;

full_correct = feedback(PID * full_angle, 1);