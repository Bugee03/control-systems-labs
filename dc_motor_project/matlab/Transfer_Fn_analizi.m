%1.1 TF ile tanımlama
% DC Motor (DC-4)
R = 5.0;
L = 0.06;
J = 0.0016;
b = 0.005;
K = 0.08;

s = tf('s');
G = K / ( (L*s + R)*(J*s + b) + K^2 );


%Kutupları ve varsa sıfırları bulma
p = pole(G);
z = zero(G);

%pzmap ile kutup–sıfır diyagramı
figure;
pzmap(G);
grid on;
title('Kutup-Sifir Diyagrami (PZ Map)');


