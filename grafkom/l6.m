function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction


macierz2=[13,14,15,16,17,18,19;23,24,25,26,27,28,29;33,34,35,36,37,38,39;63,64,65,66,67,68,69;73,74,75,76,77,78,79;83,84,85,86,87,88,89]


%zad1

function wyjscie = DodajDowolnyMargines(macierz,margines)
for i=1:size(macierz,1)+(margines*2)
for j=1:size(macierz,2)+(margines*2)
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
macierz=DodajDowolnyMargines(macierz,1);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

maska=[0,0.2,0;0.3,0.4,0;0,0,0.1];
wejscie=[23,24,25;33,34,35;63,64,65;73,74,75];
ZastosujFiltr(wejscie,maska)



%zad2

function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = ZastosujFiltr(macierz,maska)
macierz=DodajMargines(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction


img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);


function wyjscie = DodajMarginesKolor(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
for k=1:3
wyjscie(i,j,k)=0;
end
end
end
wyjscie(2:end-1,2:end-1,:)=macierz;
wyjscie(1,2:end-1,:)=wyjscie(2,2:end-1,:);
wyjscie(end,2:end-1,:)=wyjscie(end-1,2:end-1,:);
wyjscie(:,1,:)=wyjscie(:,2,:);
wyjscie(:,end,:)=wyjscie(:,end-1,:);
endfunction


function wyjscie = ZastosujFiltrKolor(macierz,maska)
macierz=DodajMarginesKolor(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
for k=1:3
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(1,1)*macierz(i-1,j-1,k)+maska(1,2)*macierz(i-1,j,k)+maska(1,3)*macierz(i-1,j+1,k)+maska(2,1)*macierz(i,j-1,k)+maska(2,2)*macierz(i,j,k)+maska(2,3)*macierz(i,j+1,k)+maska(3,1)*macierz(i+1,j-1,k)+maska(3,2)*macierz(i+1,j,k)+maska(3,3)*macierz(i+1,j+1,k);
end
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1,:);
endfunction

maska=[5,6,5;6,6,6;5,6,5];
suma=0;
for i=1:size(maska,1)
for j=1:size(maska,2)
suma+=maska(i,j);
end
end
for i=1:size(maska,1)
for j=1:size(maska,2)
maska(i,j)=maska(i,j)/suma;
end
end

img_filtr=ZastosujFiltrKolor(dimg,maska);


%%zad3

img8=imread("rzeczka.jpg");
dimg=double(img8);


function wyjscie = DodajMarginesKolor(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
for k=1:3
wyjscie(i,j,k)=0;
end
end
end
wyjscie(2:end-1,2:end-1,:)=macierz;
wyjscie(1,2:end-1,:)=wyjscie(2,2:end-1,:);
wyjscie(end,2:end-1,:)=wyjscie(end-1,2:end-1,:);
wyjscie(:,1,:)=wyjscie(:,2,:);
wyjscie(:,end,:)=wyjscie(:,end-1,:);
endfunction


function wyjscie = ZastosujFiltrKolor(macierz,maska)
macierz=DodajMarginesKolor(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
for k=1:3
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(1,1)*macierz(i-1,j-1,k)+maska(1,2)*macierz(i-1,j,k)+maska(1,3)*macierz(i-1,j+1,k)+maska(2,1)*macierz(i,j-1,k)+maska(2,2)*macierz(i,j,k)+maska(2,3)*macierz(i,j+1,k)+maska(3,1)*macierz(i+1,j-1,k)+maska(3,2)*macierz(i+1,j,k)+maska(3,3)*macierz(i+1,j+1,k);
end
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1,:);
endfunction

function wyjscie = PrzytnijZakres(wejscie)
if wejscie>=255
wyjscie=255;
elseif wejscie<=0
wyjscie=0;
else
wyjscie=wejscie;
end;
endfunction

maska=[0,-1,0;-1,5,-1;0,-1,0];

img_filtr=ZastosujFiltrKolor(dimg,maska);
for i=1:size(img_filtr,1)
for j=1:size(img_filtr,2)
for k=1:3
img_filtr(i,j,k)=PrzytnijZakres(img_filtr(i,j,k));
end
end
end
imshow(img_filtr/255);


%zad4

img8=imread("rzeczka.jpg");
dimg=double(img8);



function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = ZastosujFiltr(macierz,maska)
macierz=DodajMargines(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

function wyjscie = SzaroscSrednia(r,g,b)
wyjscie=(r+g+b)/3;
endfunction



maska=[0,0,0;-1,0,1;0,0,0];
for i=1:size(dimg,1)
for j=1:size(dimg,2)
szary_obrazek(i,j)=SzaroscSrednia(dimg(i,j,1),dimg(i,j,2),dimg(i,j,3));
end
end


img_filtr=ZastosujFiltr(szary_obrazek,maska);
img_filtr=abs(img_filtr);
imshow(img_filtr/255);


%zad5

img8=imread("rzeczka.jpg");
dimg=double(img8);


function wyjscie = DodajMarginesKolor(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
for k=1:3
wyjscie(i,j,k)=0;
end
end
end
wyjscie(2:end-1,2:end-1,:)=macierz;
wyjscie(1,2:end-1,:)=wyjscie(2,2:end-1,:);
wyjscie(end,2:end-1,:)=wyjscie(end-1,2:end-1,:);
wyjscie(:,1,:)=wyjscie(:,2,:);
wyjscie(:,end,:)=wyjscie(:,end-1,:);
endfunction


function wyjscie = ZastosujFiltrKolor(macierz,maska)
macierz=DodajMarginesKolor(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
for k=1:3
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(1,1)*macierz(i-1,j-1,k)+maska(1,2)*macierz(i-1,j,k)+maska(1,3)*macierz(i-1,j+1,k)+maska(2,1)*macierz(i,j-1,k)+maska(2,2)*macierz(i,j,k)+maska(2,3)*macierz(i,j+1,k)+maska(3,1)*macierz(i+1,j-1,k)+maska(3,2)*macierz(i+1,j,k)+maska(3,3)*macierz(i+1,j+1,k);
end
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1,:);
endfunction

maska=[-1,-2,-1;0,0,0;1,2,1];

img_filtr=ZastosujFiltrKolor(dimg,maska);
img_filtr=abs(img_filtr);

imshow(img_filtr/255);

%zad6
img8=imread("rzeczka.jpg");
dimg=double(img8);



function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = ZastosujFiltr(macierz,maska)
macierz=DodajMargines(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

function wyjscie = SzaroscSrednia(r,g,b)
wyjscie=(r+g+b)/3;
endfunction



maska1=[0,-1,0;0,0,0;0,1,0];
maska2=[0,0,0;1,0,-1;0,0,0];
for i=1:size(dimg,1)
for j=1:size(dimg,2)
szary_obrazek(i,j)=SzaroscSrednia(dimg(i,j,1),dimg(i,j,2),dimg(i,j,3));
end
end


obr1=ZastosujFiltr(szary_obrazek,maska1);
obr1=abs(obr1);
obr2=ZastosujFiltr(szary_obrazek,maska2);
obr2=abs(obr2);

img_filtr=max(obr1,obr2);
imshow(img_filtr/255);


%zad7
img8=imread("rzeczka.jpg");
dimg=double(img8);



function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = ZastosujFiltr(macierz,maska)
macierz=DodajMargines(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

function wyjscie = SzaroscSrednia(r,g,b)
wyjscie=(r+g+b)/3;
endfunction



maska=[-1,-1,0;-1,0,1;0,1,1];
for i=1:size(dimg,1)
for j=1:size(dimg,2)
szary_obrazek(i,j)=SzaroscSrednia(dimg(i,j,1),dimg(i,j,2),dimg(i,j,3));
end
end


img_filtr=ZastosujFiltr(szary_obrazek,maska);
img_filtr=img_filtr+127.5;
imshow(img_filtr/255);


%zad8
img8=imread("rzeczka.jpg");
dimg=double(img8);



function wyjscie = DodajMargines(macierz)
for i=1:size(macierz,1)+2
for j=1:size(macierz,2)+2
wyjscie(i,j)=0;
end
end
wyjscie(2:end-1,2:end-1)=macierz;
wyjscie(1,2:end-1)=wyjscie(2,2:end-1);
wyjscie(end,2:end-1)=wyjscie(end-1,2:end-1);
wyjscie(:,1)=wyjscie(:,2);
wyjscie(:,end)=wyjscie(:,end-1);
endfunction

function wyjscie = ZastosujFiltr(macierz,maska)
macierz=DodajMargines(macierz);
for i=2:size(macierz,1)
for j=2:size(macierz,2)
if (i==size(macierz,1) || j==size(macierz,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(1,1)*macierz(i-1,j-1)+maska(1,2)*macierz(i-1,j)+maska(1,3)*macierz(i-1,j+1)+maska(2,1)*macierz(i,j-1)+maska(2,2)*macierz(i,j)+maska(2,3)*macierz(i,j+1)+maska(3,1)*macierz(i+1,j-1)+maska(3,2)*macierz(i+1,j)+maska(3,3)*macierz(i+1,j+1);
end
end
end
wyjscie=wyjscie(2:end-1,2:end-1);
endfunction

function wyjscie = SzaroscSrednia(r,g,b)
wyjscie=(r+g+b)/3;
endfunction



maska1=[-1,-sqrt(2),-1;0,0,0;1,sqrt(2),1];
maska2=[-1,0,1;-sqrt(2),0,sqrt(2);-1,0,1];
for i=1:size(dimg,1)
for j=1:size(dimg,2)
szary_obrazek(i,j)=SzaroscSrednia(dimg(i,j,1),dimg(i,j,2),dimg(i,j,3));
end
end


obr1=ZastosujFiltr(szary_obrazek,maska1);

obr2=ZastosujFiltr(szary_obrazek,maska2);


img3=sqrt(obr1.*obr1+obr2.*obr2);
imshow(img3/255);

