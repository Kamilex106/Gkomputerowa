%lab1
function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end

wyjscie(2:end-1,2:end-1)=macierz;

wyjscie(1,2:end-1)=macierz(1,:);
wyjscie(end,2:end-1)=macierz(end,:);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = DodajDowolnyMargines(macierz,margines)
for i=1:size(macierz,1)+(2*margines)
for j=1:size(macierz,2)+(2*margines)
wyjscie(i,j)=0;
end
end

wyjscie(margines+1:end-margines,margines+1:end-margines)=macierz;

for k=1:margines
wyjscie(k,margines+1:end-margines)=macierz(1,:);
wyjscie(end-k+1,margines+1:end-margines)=macierz(end,:);
end
for k=1:margines
wyjscie(:,k)=wyjscie(:,margines+1);
wyjscie(:,end-k+1)=wyjscie(:,end-margines);
end
endfunction


function wyjscie = ZastosujFiltr(macierz,maska)
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if i==size(macierz,1) || j==size(macierz,2)
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

wejscie=[23,24,25;33,34,35;63,64,65;73,74,75]
maska=[0,0.2,0;0.3,0.4,0;0,0,0.1]


function wyjscie = ZnormalizujUjemna(maska)
suma=0;
for i=1:size(maska,1)
for j=1:size(maska,2)
suma+=maska(i,j);
end
end

srednia=round(size(maska,1)/2);

wyjscie=maska;
wyjscie(srednia,srednia)+=abs(suma)+1;
endfunction


function wyjscie = Znormalizuj(maska)
suma=0;
for i=1:size(maska,1)
for j=1:size(maska,2)
suma+=maska(i,j);
end
end

for i=1:size(maska,1)
for j=1:size(maska,2)
wyjscie(i,j)=maska(i,j)/suma;
end
end
endfunction


%lab2
function wyjscie = ZmienRozmiar(wejscie,s_wy,w_wy)
s_we=size(wejscie,2);
w_we=size(wejscie,1);

for i=1:w_wy
for j=1:s_wy
x_we=round(1+((j-1)*(s_we-1))/(s_wy-1));
y_we=round(1+((i-1)*(w_we-1))/(w_wy-1));

wyjscie(i,j,:)=wejscie(y_we,x_we,:);
end
end
endfunction

img8=imread("rzeczka.jpg");
dimg=double(img8);
d_zmieniony=ZmienRozmiar(dimg,333,222);
imshow(d_zmieniony/255);

d_zmieniony=ZmienRozmiar(dimg,1366,768);
imshow(d_zmieniony/255);


%lab3

function wyjscie = MacierzSkalowanie(sx,sy)
wyjscie=[sx,0,0;0,sy,0;0,0,1];
endfunction

function wyjscie = MacierzPrzesuwanie(tx,ty)
wyjscie=[1,0,tx;0,1,ty;0,0,1];
endfunction

function wyjscie = MacierzObrot(obr)
obr=obr*pi/180;
wyjscie=[cos(obr),-sin(obr),0;sin(obr),cos(obr),0;0,0,1];
endfunction

punkty=csvread("punktman.csv");

x_min=min(punkty(:,1));
y_min=min(punkty(:,2));

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end

punkty2=punkty2';

macierz=MacierzPrzesuwanie(abs(x_min),abs(y_min));
macierz2=MacierzSkalowanie(1,-0.5);

punkty3=macierz*punkty2;
punkty4=macierz2*punkty3;

for i=1:size(punkty3,2)
punkty5(i,1)=punkty3(1,i);
punkty5(i,2)=punkty3(2,i);
end


for i=1:size(punkty4,2)
punkty6(i,1)=punkty4(1,i);
punkty6(i,2)=punkty4(2,i);
end


punkty_koncowe=punkty5;
for i=1:size(punkty5,1)
punkty_koncowe(size(punkty5,1)+i,1)=punkty6(i,1);
punkty_koncowe(size(punkty5,1)+i,2)=punkty6(i,2);
end

plot(punkty_koncowe(:,1),punkty_koncowe(:,2),'sk')



%zadanie-c3
%Zadanie: Kombinacja przekształceń i wielokrotne skalowanie
clear;

function wyjscie = MacierzSkalowanie(sx,sy)
wyjscie=[sx,0,0;0,sy,0;0,0,1];
endfunction

function wyjscie = MacierzPrzesuwanie(tx,ty)
wyjscie=[1,0,tx;0,1,ty;0,0,1];
endfunction

function wyjscie = MacierzObrot(obr)
obr=obr*pi/180;
wyjscie=[cos(obr),-sin(obr),0;sin(obr),cos(obr),0;0,0,1];
endfunction

punkty=csvread("punktman.csv");

x_srednia=mean(punkty(:,1));
y_srednia=mean(punkty(:,2));

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';

macierz=MacierzPrzesuwanie(-x_srednia+3,-y_srednia-4);
punkty3=macierz*punkty2;

macierz2=MacierzPrzesuwanie(3,-4)*MacierzObrot(30)*MacierzPrzesuwanie(-3,4);
punkty4=macierz2*punkty3;

macierz3=MacierzPrzesuwanie(3,-4)*MacierzSkalowanie(2,0.5)*MacierzPrzesuwanie(-3,4);
punkty5=macierz3*punkty4;
x_srednia=mean(punkty5(1,:));
y_srednia=mean(punkty5(2,:));
macierz3b=MacierzPrzesuwanie(x_srednia,y_srednia)*MacierzSkalowanie(0.5,2)*MacierzPrzesuwanie(-x_srednia,-y_srednia);
punkty5b=macierz3b*punkty5;


macierz4=MacierzPrzesuwanie(0,-5)*MacierzSkalowanie(1,-1)*MacierzPrzesuwanie(0,5);
punkty6=macierz4*punkty5b;

punkty_mac=punkty3(1:2,:)';
punkty_mac2=punkty4(1:2,:)';
punkty_mac3=punkty5b(1:2,:)';
punkty_mac4=punkty6(1:2,:)';


hold on
plot(punkty(:,1),punkty(:,2),'sk')
plot(punkty_mac(:,1),punkty_mac(:,2),'sb')
plot(punkty_mac2(:,1),punkty_mac2(:,2),'sg')
plot(punkty_mac3(:,1),punkty_mac3(:,2),'sr')
plot(punkty_mac4(:,1),punkty_mac4(:,2),'sy')
legend('Oryginal','2','3','4','5')
hold off