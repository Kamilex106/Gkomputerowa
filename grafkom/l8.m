%zad1
punkty=csvread("punktman.csv");

function wyjscie = MacierzSkalowanie(Sx,Sy)
wyjscie=[Sx,0,0;0,Sy,0;0,0,1];
endfunction

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';

macierz=MacierzSkalowanie(0.1,0.2);
punkty3=macierz*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');

%zad2
clear;
punkty=csvread("punktman.csv");

function wyjscie = MacierzPrzesuniecie(tx,ty)
wyjscie=[1,0,tx;0,1,ty;0,0,1];
endfunction

x_suma=0;
y_suma=0;

for i=1:size(punkty,1)
x_suma+=punkty(i,1);
y_suma+=punkty(i,2);
end
x_srednia=x_suma/size(punkty,1);
y_srednia=y_suma/size(punkty,1);

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';

macierz=MacierzPrzesuniecie(-x_srednia,-y_srednia);
punkty3=macierz*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');


%zad3
clear;
punkty=csvread("punktman.csv");

function wyjscie = MacierzObrot(obr)
obr=obr*pi/180;
wyjscie=[cos(obr),-sin(obr),0;sin(obr),cos(obr),0;0,0,1];
endfunction

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end

punkty2=punkty2';

macierz=MacierzObrot(-60);
punkty3=macierz*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');


%zad4
clear;
punkty=csvread("punktman.csv");

x_suma=0;
y_suma=0;
for i=1:size(punkty,1)
x_suma+=punkty(i,1);
y_suma+=punkty(i,2);
end
x_srednia=x_suma/size(punkty,1);
y_srednia=y_suma/size(punkty,1);


for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';


MacierzObrobkicalkowitej=MacierzSkalowanie(0.01,0.01)*MacierzObrot(90)*MacierzPrzesuniecie(-x_srednia,-y_srednia);
punkty3=MacierzObrobkicalkowitej*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');
xlabel('X');
ylabel('Y');



%zad5
clear;
punkty=csvread("punktman.csv");

x_min=min(punkty(:,1));
y_min=min(punkty(:,2));


for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';


macierz=MacierzPrzesuniecie(abs(x_min),abs(y_min));
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

plot(punkty_koncowe(:,1),punkty_koncowe(:,2),'sk');
xlabel('X');
ylabel('Y');



%Przyklad
%obrót względem punktu (x=2; y=1) o kąt 45o zgodnie z ruchem zegara 

punkty=csvread("punktman_n.csv");

function wyjscie = MacierzPrzesuniecie(tx,ty)
wyjscie=[1,0,tx;0,1,ty;0,0,1];
endfunction

function wyjscie = MacierzObrot(obr)
obr=obr*pi/180;
wyjscie=[cos(obr),-sin(obr),0;sin(obr),cos(obr),0;0,0,1];
endfunction

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';

MacierzObrobkicalkowitej=MacierzPrzesuniecie(2,1)*MacierzObrot(-45)*MacierzPrzesuniecie(-2,-1);
punkty3=MacierzObrobkicalkowitej*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');



%Przyklad2
%lustrzane odbicie względem prostej pionowej x = 123

punkty=csvread("punktman_n.csv");

function wyjscie = MacierzPrzesuniecie(tx,ty)
wyjscie=[1,0,tx;0,1,ty;0,0,1];
endfunction

function wyjscie = MacierzSkalowanie(sx,sy)
wyjscie=[sx,0,0;0,sy,0;0,0,1];
endfunction

for i=1:size(punkty,1)
punkty2(i,1)=punkty(i,1);
punkty2(i,2)=punkty(i,2);
punkty2(i,3)=1;
end
punkty2=punkty2';

MacierzObrobkicalkowitej=MacierzPrzesuniecie(123,0)*MacierzSkalowanie(-1,1)*MacierzPrzesuniecie(-123,0);
punkty3=MacierzObrobkicalkowitej*punkty2;

for i=1:size(punkty3,2)
punkty4(i,1)=punkty3(1,i);
punkty4(i,2)=punkty3(2,i);
end

plot(punkty4(:,1),punkty4(:,2),'sk');