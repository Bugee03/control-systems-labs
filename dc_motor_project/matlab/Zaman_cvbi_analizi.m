clear; clc; close all;

% =========================
% 2. BÖLÜM: ZAMAN CEVABI ANALİZİ
% Sistem: DC-4
% =========================

num = 0.08;
den = [0.000096 0.0083 0.0314];
G = tf(num, den);

%% 2.1 Birim impuls yanıtı
figure;
impulse(G); grid on;
title('Birim İmpuls Yanıtı');
xlabel('Zaman (s)');
ylabel('\omega (rad/s)');

%% 2.2 Birim basamak yanıtı
figure;
step(G); grid on;
title('Birim Basamak Yanıtı');
xlabel('Zaman (s)');
ylabel('\omega (rad/s)');

%% 2.3 Teorik son değer (dcgain)
yss = dcgain(G);

figure;
step(G); grid on; hold on;
yline(yss,'--',sprintf('Son Deger (dcgain)=%.4f', yss));
title('Basamak Yanıtı ve Teorik Son Değer');
xlabel('Zaman (s)');
ylabel('\omega (rad/s)');

disp("dcgain(G) (teorik son değer) = ");
disp(yss);

clear; clc; close all;

% Sistem
G = tf(0.08, [0.000096 0.0083 0.0314]);

% Step bilgileri (MATLAB)
info = stepinfo(G);

tr = info.RiseTime;        % yükselme zamanı
ts = info.SettlingTime;    % oturma süresi
yss = dcgain(G);           % son değer

% Grafik
figure;
step(G,'r'); grid on; hold on;

% tr ve ts çizgileri
xline(tr,'--m',sprintf('t_r = %.3f s',tr),'LineWidth',1.5);
xline(ts,'--b',sprintf('t_s = %.3f s',ts),'LineWidth',1.5);

% son değer çizgisi (ince)
yline(yss,'k:','Son Değer');

title('Geçici Rejim Büyüklüklerinin Grafik Üzerinde Gösterimi');
xlabel('Zaman (s)');
ylabel('\omega (rad/s)');

legend('Step Yanıtı','t_r','t_s','Son Değer','Location','best');
