//zad1
img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
wyjscie(i+1,j+1)=wejscie(i,j);
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
if (i==1 && j==1)
wyjscie(i,j)=wejscie(i,j);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i,j-2);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j)=wejscie(i-2,j);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i-2,j-2);

elseif (i==1)
wyjscie(i,j)=wejscie(i,j-1);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j)=wejscie(i-2,j-1);

elseif (j==1)
wyjscie(i,j)=wejscie(i-1,j);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i-1,j-2);

end
end
end
endfunction


maska=[0,0.2,0;0.3,0.4,0;0,0,0.1];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(2,2)*wejscie(i,j)+maska(2,1)*wejscie(i,j-1)+maska(2,3)*wejscie(i,j+1)+maska(1,1)*wejscie(i-1,j-1)+maska(1,2)*wejscie(i-1,j)+maska(1,3)*wejscie(i-1,j+1)+maska(3,1)*wejscie(i+1,j-1)+maska(3,2)*wejscie(i+1,j)+maska(3,3)*wejscie(i+1,j+1);
end;
end;
end;
endfunction

dimg2=zastosuj_filtr(macierz2,maska);
imshow(dimg2/255);

//zad2
//kolorowy
img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

function wyjscie=znormalizuj_maske(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
wyjscie(i,j)=1/wejscie(i,j);
end
end
endfunction


function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
for k=1:3
wyjscie(i+1,j+1,k)=wejscie(i,j,k);
end;
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
for k=1:3

if (i==1 && j==1)
wyjscie(i,j,k)=wejscie(i,j,k);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i,j-2,k);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j,k)=wejscie(i-2,j,k);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-2,j-2,k);

elseif (i==1)
wyjscie(i,j,k)=wejscie(i,j-1,k);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j,k)=wejscie(i-2,j-1,k);

elseif (j==1)
wyjscie(i,j,k)=wejscie(i-1,j,k);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-1,j-2,k);

end
end
end
end
endfunction


maska=[5,6,5;6,6,6;5,6,5];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
for k=1:3
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(2,2)*wejscie(i,j,k)+maska(2,1)*wejscie(i,j-1,k)+maska(2,3)*wejscie(i,j+1,k)+maska(1,1)*wejscie(i-1,j-1,k)+maska(1,2)*wejscie(i-1,j,k)+maska(1,3)*wejscie(i-1,j+1,k)+maska(3,1)*wejscie(i+1,j-1,k)+maska(3,2)*wejscie(i+1,j,k)+maska(3,3)*wejscie(i+1,j+1,k);
end;
end;
end;
end;
endfunction

maska=znormalizuj_maske(maska);
dimg2=zastosuj_filtr(macierz2,maska);
imshow(dimg2/255);








//monochromatyczny
img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

function wyjscie=znormalizuj_maske(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
wyjscie(i,j)=1/wejscie(i,j);
end
end
endfunction


function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
wyjscie(i+1,j+1)=wejscie(i,j);
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
if (i==1 && j==1)
wyjscie(i,j)=wejscie(i,j);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i,j-2);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j)=wejscie(i-2,j);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i-2,j-2);

elseif (i==1)
wyjscie(i,j)=wejscie(i,j-1);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j)=wejscie(i-2,j-1);

elseif (j==1)
wyjscie(i,j)=wejscie(i-1,j);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j)=wejscie(i-1,j-2);

end
end
end
endfunction



maska=[5,6,5;6,6,6;5,6,5];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j)=0;
else
wyjscie(i,j)=maska(2,2)*wejscie(i,j)+maska(2,1)*wejscie(i,j-1)+maska(2,3)*wejscie(i,j+1)+maska(1,1)*wejscie(i-1,j-1)+maska(1,2)*wejscie(i-1,j)+maska(1,3)*wejscie(i-1,j+1)+maska(3,1)*wejscie(i+1,j-1)+maska(3,2)*wejscie(i+1,j)+maska(3,3)*wejscie(i+1,j+1);
end;
end;
end;
endfunction

maska=znormalizuj_maske(maska);
dimg2=zastosuj_filtr(macierz2,maska);
imshow(dimg2/255);


//zad3
img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

function wyjscie=PrzytnijZakres(wejscie)
if wejscie>=255
wyjscie=255;
elseif wejscie<=0
wyjscie=0;
else
wyjscie=wejscie;
end
endfunction

function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
for k=1:3
wyjscie(i+1,j+1,k)=wejscie(i,j,k);
end;
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
for k=1:3

if (i==1 && j==1)
wyjscie(i,j,k)=wejscie(i,j,k);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i,j-2,k);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j,k)=wejscie(i-2,j,k);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-2,j-2,k);

elseif (i==1)
wyjscie(i,j,k)=wejscie(i,j-1,k);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j,k)=wejscie(i-2,j-1,k);

elseif (j==1)
wyjscie(i,j,k)=wejscie(i-1,j,k);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-1,j-2,k);

end
end
end
end
endfunction


maska=[0,-1,0;-1,5,-1;0,-1,0];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
for k=1:3
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(2,2)*wejscie(i,j,k)+maska(2,1)*wejscie(i,j-1,k)+maska(2,3)*wejscie(i,j+1,k)+maska(1,1)*wejscie(i-1,j-1,k)+maska(1,2)*wejscie(i-1,j,k)+maska(1,3)*wejscie(i-1,j+1,k)+maska(3,1)*wejscie(i+1,j-1,k)+maska(3,2)*wejscie(i+1,j,k)+maska(3,3)*wejscie(i+1,j+1,k);
end;
end;
end;
end;
endfunction

dimg2=zastosuj_filtr(macierz2,maska);
dimg2=PrzytnijZakres(dimg2);
imshow(dimg2/255);


//zad4
img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

function wyjscie=SzaroscSrednia(r,g,b)
wyjscie=(r+g+b)/3;
endfunction


function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
for k=1:3
wyjscie(i+1,j+1,k)=wejscie(i,j,k);
end;
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
for k=1:3

if (i==1 && j==1)
wyjscie(i,j,k)=wejscie(i,j,k);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i,j-2,k);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j,k)=wejscie(i-2,j,k);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-2,j-2,k);

elseif (i==1)
wyjscie(i,j,k)=wejscie(i,j-1,k);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j,k)=wejscie(i-2,j-1,k);

elseif (j==1)
wyjscie(i,j,k)=wejscie(i-1,j,k);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-1,j-2,k);

end
end
end
end
endfunction


maska=[0,0,0;-1,0,1;0,0,0];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
for k=1:3
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(2,2)*wejscie(i,j,k)+maska(2,1)*wejscie(i,j-1,k)+maska(2,3)*wejscie(i,j+1,k)+maska(1,1)*wejscie(i-1,j-1,k)+maska(1,2)*wejscie(i-1,j,k)+maska(1,3)*wejscie(i-1,j+1,k)+maska(3,1)*wejscie(i+1,j-1,k)+maska(3,2)*wejscie(i+1,j,k)+maska(3,3)*wejscie(i+1,j+1,k);
end;
end;
end;
end;
endfunction

dimg2=SzaroscSrednia(dimg(:,:,1),dimg(:,:,2),dimg(:,:,3));

dimg2=zastosuj_filtr(macierz2,maska);
dimg2=abs(dimg2);
imshow(dimg2/255);

//zad5

img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);


function wyjscie=dodaj_margines(wejscie)
for i=1:size(wejscie,1)
for j=1:size(wejscie,2)
for k=1:3
wyjscie(i+1,j+1,k)=wejscie(i,j,k);
end;
end;
end;

for i=1:size(wejscie,1)+2
for j=1:size(wejscie,2)+2
for k=1:3

if (i==1 && j==1)
wyjscie(i,j,k)=wejscie(i,j,k);

elseif (i==1 && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i,j-2,k);

elseif (i==size(wejscie,1)+2  && j==1)
wyjscie(i,j,k)=wejscie(i-2,j,k);

elseif (i==size(wejscie,1)+2  && j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-2,j-2,k);

elseif (i==1)
wyjscie(i,j,k)=wejscie(i,j-1,k);

elseif (i==size(wejscie,1)+2)
wyjscie(i,j,k)=wejscie(i-2,j-1,k);

elseif (j==1)
wyjscie(i,j,k)=wejscie(i-1,j,k);

elseif (j==size(wejscie,2)+2)
wyjscie(i,j,k)=wejscie(i-1,j-2,k);

end
end
end
end
endfunction


maska=[-1,-2,-1;0,0,0;1,2,1];

macierz2=dodaj_margines(dimg);

function wyjscie=zastosuj_filtr(wejscie,maska)
for i=2:size(wejscie,1)
for j=2:size(wejscie,2)
for k=1:3
if (i==size(wejscie,1) || j==size(wejscie,2))
wyjscie(i,j,k)=0;
else
wyjscie(i,j,k)=maska(2,2)*wejscie(i,j,k)+maska(2,1)*wejscie(i,j-1,k)+maska(2,3)*wejscie(i,j+1,k)+maska(1,1)*wejscie(i-1,j-1,k)+maska(1,2)*wejscie(i-1,j,k)+maska(1,3)*wejscie(i-1,j+1,k)+maska(3,1)*wejscie(i+1,j-1,k)+maska(3,2)*wejscie(i+1,j,k)+maska(3,3)*wejscie(i+1,j+1,k);
end;
end;
end;
end;
endfunction


dimg2=zastosuj_filtr(macierz2,maska);
dimg2=abs(dimg2);
imshow(dimg2/255);
