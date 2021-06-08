clear all;
syms s;
syms w;
syms a;%вещественное
syms y;
assume(a,'positive');
assume(w,'positive');
assume(y,'positive');
A = 2.1;
k1=30;
k=1;
c=A;
b=c/k;
T1=0.1;
T2=0.1;
q = (k/pi())*(pi()/2 + asin(1 - 2.*A./y) + 2.*(1 - 2*A./y).*sqrt((1 - A./y) .* A./y));
q1 = ((4 * k * A * (1 - A ./ y)./(pi() .* y)));

R = k1;%числитель передатки
Q=s*(T1*s+1)*(T2*s+1);%знаменатель передатки
H=subs(Q,s,1i*w);%подставляем iw вместо s 
H=collect(H);
Res=H+R*(q+1i*q1);
Res=collect(Res);

assume (a>=b);%длемаем предположение
X=real(Res);
Y=imag(Res);
omega=solve(Y,w);
sprintf('Omega = ');
disp(omega);
X=subs(X,w,omega);
q_ampl=solve(X==0.0001,y);
disp(q_ampl);

% % строим график q(a)
% q=(2*c/pi)*(1/c*asin(c/a)+(1/a)*sqrt(1-(c/a)^2));
% fplot(q,[0,100]); % вместо ezplot, в документации сказано, что так лучше
% title('The graphic of q(a) function');
% xlabel('The coordinate of a');
% ylabel('The coordinate of q');
% grid
% hold on
% ampl = 65;
% 
% omega;
% ampl;
% Res=H+R*(q+1i*q1);
% Res=collect(Res);
% assume (a>=b);
% X=real(Res);
% Y=imag(Res);
% x1=diff(X,w); %ищем конечные разности(частные производные)
% x2=diff(X,a);
% y1=diff(Y,w);
% y2=diff(Y,a);
% 
% %Проверка выполнения условия устойчивости предельного цикла устойчивости
% x1=subs(x1,w,omega); %подставляем найденные значения амплитуды и частоты в частные производные
% x2=subs(x2,a,ampl);
% y1=subs(y1,w,omega);
% y2=subs(y2,a, ampl);
% 
% stable = x2*y1-x1*y2
% if (stable>0)
% sprintf('Предельный цикл устойчив, а знчит в системе есть автоколебания')
% else sprintf('Предельный цикл не устойчив, а знчит в системе отсутствуют автоколебания');
% end;
% 
% %Проверка устойчивости по критерию Найквиста
% 
% Wl1 = tf([30], [0.01 0.2 1 0]);% linear part
% figure
% bode(Wl1);
% grid on;
% 
% a_ = b + 0.1:0.1:100; %nonlinear
% q_plt = subs(q, a, a_);
% figure
% lm = -20*log(q_plt);
% plot(a_, lm);
% set(gca, 'XScale', 'log');
% grid on
% title('The graphic of -20 * log(q(a)) function');
% xlabel('The coordinate of a');
% ylabel('The coordinate of -20 * log(q)');
% 
% phi = -pi;
% phi_plt = subs(phi, a, a_);
% figure
% plot(a_, phi_plt);
% grid on;
% title('The graphic of phi(a)');
% xlabel('The coordinate of a');
% ylabel('The coordinate of phi(a)');
