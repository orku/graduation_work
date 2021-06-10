syms s;
syms w;
R = 165.6 * (3.5 * s + 1) * (0.016*s + 1);%числитель передатки
Q = (0.02* s + 1)*(0.00016 * s + 1)* s^2 ;%знаменатель передатки
h = R/Q;
H=subs(h,s,1i*w);%подставляем iw вместо s 
H=collect(H);