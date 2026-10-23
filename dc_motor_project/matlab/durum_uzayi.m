% Transfer fonksiyonu (DC-4)
num = 0.08;
den = [0.000096 0.0083 0.0314];

G = tf(num, den);

% MATLAB'in bulduğu durum-uzayı 
sys_ss = ss(G);

A = sys_ss.A
B = sys_ss.B
C = sys_ss.C
D = sys_ss.D

%3.2 Durum uzayından step yanıtı çizme ve transfer 
figure;
step(G); grid on; hold on;
step(sys_ss);
legend('TF ile step(G)', 'State-space ile step(sys\_ss)');
title('TF ve Durum-Uzayi Step Karsilastirmasi');


%3.3 Analitik: Kontrol Kanonik Form
a2 = 0.000096; 
a1 = 0.0083; 
a0 = 0.0314; 
b0 = 0.08;

a1p = a1/a2;
a0p = a0/a2;
b0p = b0/a2;

Ac = [0 1; -a0p -a1p];
Bc = [0; 1];
Cc = [b0p 0];
Dc = 0;

Ac, Bc, Cc, Dc
sys_cc = ss(Ac,Bc,Cc,Dc);

%3.4 Analitik: Gözlenebilir Kanonik Form
Ao = Ac';
Bo = Cc';
Co = Bc';
Do = 0;

Ao, Bo, Co, Do
sys_oc = ss(Ao,Bo,Co,Do);

% Kontrol edilebilirlik
Mc = ctrb(Ac,Bc);
rank_Mc = rank(Mc)

% Gözlemlenebilirlik
Mo = obsv(Ac,Cc);
rank_Mo = rank(Mo)


%=================================================
clear; clc; close all;

% Transfer fonksiyonu 
G = tf(0.08, [0.000096 0.0083 0.0314]);

% Monik forma göre katsayılar
a1 = 86.4583;
a0 = 327.0833;
b0 = 833.3333;

% Kontrol kanonik form
Ac = [0 1; -a0 -a1];
Bc = [0; 1];
Cc = [b0 0];
Dc = 0;

sys_cc = ss(Ac,Bc,Cc,Dc);

figure;
h = stepplot(sys_cc);
grid on;

opt = getoptions(h);
opt.LineWidth = 1.8;
setoptions(h,opt);

title('Kontrol Kanonik Formun Step Cevabı');
xlabel('ZAMAN');
ylabel('GENLİK');

