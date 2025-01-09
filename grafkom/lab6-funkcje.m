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


function wyjscie = ZastosujFiltr(macierz,maska)
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


function wyjscie = ZnormalizujUjemne(maska)
suma=0;
for i=1:size(maska,1)
for j=1:size(maska,2)
suma+=maska(i,j);
end
end
wyjscie=maska;
srodkowa=round(size(maska,1)/2);
if suma<0
wyjscie(srodkowa,srodkowa)+=abs(suma)+1;
else
wyjscie(srodkowa,srodkowa)=(wyjscie(srodkowa,srodkowa)-suma)+1;
end
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

