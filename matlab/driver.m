% % построение нагрузочной характеристики
t = 0:0.1:100;
w = 7;
a = 1.75;
w_ = w / a;
J = 0.39;
M = 10.6;% was 6
k = 0.14; % гидродинамический коэф
a_t = a*sin(w_*t);
w_t = a*w_*cos(w_*t);
q_t = a*w_*w_*sin(w_*t);
Mn = -J.*q_t + k.*abs(w_t).*w_t + M;
% Mn = -J.*q_t + k.*w_t + M;
plot(Mn, 10*w_t)
% xlim([4 16])
% ylim([-35 35])
xlabel("Момент, Нм", "FontSize", 14)
ylabel("Угловая скорость вращения, об/мин", "FontSize", 14)
grid on
hold on
% построение механической характеристики двигателя
% u = 0.87;
% i = 406;%w as 215
% m_ = 1020;% was 632
% m = 0:0.1:m_* i * u * 0.15;
% n0 = 8810/i; % was 7500
% N_M = n0*(1 - m/(m_ * i * u));
% plot(m/1000, N_M)

% legend("Нагрузочна характеристика", "Механическая характеристика двигателя вместе с редуктором")

% i = 215 https://www.faulhaber.com/fileadmin/Import/Media/EN_2668_CR_DFF.pdf
% mtotor    https://www.faulhaber.com/fileadmin/Import/Media/EN_32GPT_FMM.pdf

% % faulhaber 3257 24cr with 38/2s 246
% % faulhaber 3257 24cr with 38/2s 159
% % RE 30 ∅30 mm, Graphite Brushes, 60 Watt GPX 32 406 or 326
