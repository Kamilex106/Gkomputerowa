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
macierz=DodajMargines(macierz);
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

wejscie=[23,24,25;33,34,35;63,64,65;73,74,75];
maska=[0,0.2,0;0.3,0.4,0;0,0,0.1];
got=ZastosujFiltr(wejscie,maska)


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

function wyjscie = ZnormalizujUjemne(maska)
suma=0;
for i=1:size(maska,1)
for j=1:size(maska,2)
suma+=maska(i,j);
end
end
srodkowa=round(size(maska,1)/2);
wyjscie=maska;
wyjscie(srodkowa,srodkowa)+=abs(suma)+1;
endfunction


function wyjscie = Przeskaluj(wejscie,s_wy,w_wy)
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

got=Przeskaluj(dimg,1366,768);
imshow(got/255)