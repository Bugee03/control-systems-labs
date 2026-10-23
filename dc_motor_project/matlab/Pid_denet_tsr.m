%% DC-4 Bitki
G = tf(0.08, [0.000096 0.0083 0.0314]);  

wref = 20;   
figure;
step(G); grid on;
title('PID Öncesi: Açık Çevrim Birim Basamak Yanıtı (G(s))');
xlabel('Zaman (s)'); ylabel('\omega (rad/s)');

% Açık çevrim son değer
yss_open = dcgain(G);  
% Açık çevrim stepinfo
info_open = stepinfo(G);

%% 2) PID ÖNCESİ
T0 = feedback(G,1);

%% 3) PID AYARI 
C = pidtune(G,"PID");  
Kp = C.Kp; Ki = C.Ki; Kd = C.Kd;

%% 4) PID SONRASI - KAPALI ÇEVRİM
Tpid = feedback(C*G,1);

%% 4.4) PID'li ve PID'siz KAPALI çevrim yanıtı aynı grafikte (wref=20)
figure;
step(wref*T0); grid on; hold on;
step(wref*Tpid);
yline(wref,'--','Referans (20 rad/s)','LabelHorizontalAlignment','right');
legend('PID yok (Kapalı Çevrim)','PID var (Kapalı Çevrim)','Location','southeast');
title('PID Öncesi/Sonrası Kapalı Çevrim Basamak Yanıtı (w_{ref}=20 rad/s)');
xlabel('Zaman (s)'); ylabel('\omega (rad/s)');

%% 4.5) Performans ölçütleri (stepinfo ölçekli sistemlerle)
info0   = stepinfo(wref*T0);    
infopid = stepinfo(wref*Tpid);  

% Son değerler (kapalı çevrim)
yss0   = dcgain(wref*T0);
ysspid = dcgain(wref*Tpid);

% Kalıcı durum hatası: ess = r - y_ss  (r = wref)
ess0   = wref - yss0;
esspid = wref - ysspid;

% Maksimum aşım (%) stepinfo içinde var: Overshoot
Mp0   = info0.Overshoot;
Mppid = infopid.Overshoot;

% Sonuçları yazdır
fprintf('\n=== PID YOK (Kapalı) ===\n');
disp(info0);
fprintf('Son Deger = %.4f rad/s\n', yss0);
fprintf('ess = %.6f rad/s\n', ess0);

fprintf('\n=== PID VAR (Kapalı) ===\n');
disp(infopid);
fprintf('Son Deger = %.4f rad/s\n', ysspid);
fprintf('ess = %.6f rad/s\n', esspid);

fprintf('\nPID Kazanclari: Kp=%.6f, Ki=%.6f, Kd=%.6f\n', Kp, Ki, Kd);
