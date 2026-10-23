% Kontrol Kanonik Form (senin analitik bulduğun matrislerle)
Ac = [0 1; -327.0833 -86.4583];
Bc = [0; 1];
Cc = [833.3333 0];
Dc = 0;

sys_cc = ss(Ac,Bc,Cc,Dc);

figure;
step(sys_cc); grid on;
h = findall(gcf,'Type','line');
set(h,'LineWidth',1.5);

xlabel('Zaman (s)');
ylabel('Açısal Hız, \omega (rad/s)');
title('Kontrol Kanonik Formun Birim Basamak Cevabı (DC-4)');

% Gözlemlenebilir Kanonik Form (senin analitik matrislerin)
Ao = [-86.4583 1; -327.0833 0];
Bo = [833.3333; 0];
Co = [1 0];
Do = 0;

sys_oc = ss(Ao,Bo,Co,Do);
 


figure;
step(sys_oc); grid on;
h = findall(gcf,'Type','line');
set(h,'LineWidth',1.5);

xlabel('Zaman (s)');
ylabel('Açısal Hız, \omega (rad/s)');
title('Gözlemlenebilir Kanonik Formun Birim Basamak Cevabı (DC-4)');

% Transfer fonksiyonu (DC-4)
G = tf(0.08, [0.000096 0.0083 0.0314]);

figure;
step(G); grid on;
h = findall(gcf,'Type','line');
set(h,'LineWidth',1.5);

xlabel('Zaman (s)');
ylabel('Açısal Hız, \omega (rad/s)');
title('Transfer Fonksiyonundan Elde Edilen Birim Basamak Cevabı (DC-4)');
