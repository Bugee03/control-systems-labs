clear; clc; close all;

% Sistem (monik form)
a1 = 86.4583;
a0 = 327.0833;
b0 = 833.3333;

% Kontrol kanonik matrisler
Ac = [0 1; -a0 -a1];
Bc = [0; 1];
Cc = [b0 0];
Dc = 0;

% Kontrol edilebilirlik ve gözlemlenebilirlik matrisleri
Mc = ctrb(Ac,Bc);
Mo = obsv(Ac,Cc);

disp("ctrb(Ac,Bc) = "); disp(Mc);
disp("obsv(Ac,Cc) = "); disp(Mo);

% Rank
rc = rank(Mc);
ro = rank(Mo);

disp("rank(ctrb) = "); disp(rc);
disp("rank(obsv) = "); disp(ro);
