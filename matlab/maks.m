t = 0:0.1:1000;
w = 1;
a = 6.2;
w_ = w / a;
J = 0.15;
k = 0.004;% гидродинамический коэф
M = 0.5;
a_t = a*sin(w_*t);
w_t = a*w_*cos(w_*t);
q_t = a*w_*w_*sin(w_*t);


Mn = -J.*q_t + k.*abs(w_t).*w_t + M;
% Mn = -J.*q_t + k.*w_t + M;
plot(Mn, 10*w_t)
% xlim([0.3 0.7])
% ylim([-11 11])
xlabel("Момент, Нм", "FontSize", 14)
ylabel("Угловая скорость вращения, об/мин", "FontSize", 14)
grid on
hold on
% построение механической характеристики двигателя
u = 0.5;
i = 546;
m_ = 36.6;
m = 0:0.1:m_* i * u * 0.2;
n0 = 6560/i;
N_M = n0*(1 - m/(m_ * i * u));
plot(m/1000, N_M)
