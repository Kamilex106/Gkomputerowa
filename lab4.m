img8=imread("rzeczka2.png");
dimg=double(img8);
minimum=min(dimg(:));
maksimum=max(dimg(:));
dimg2=(dimg-minimum)/(maksimum-minimum)*1;
dimg2=dimg2.^(1/1.5);
dimg2=(dimg-minimum)/(maksimum-minimum)*255;

function wyjscie = porownanievPS(stare,nowe)
wyjscie=abs(nowe-stare);
end;


function wyjscie = PrzytnijZakres(wejscie)
if wejscie<=0
wyjscie=0;
end;
if wejscie>=0&&wejscie<=255
wyjscie=wejscie;
end;
if wejscie>=255
wyjscie=255;
end;
endfunction;


function wyjscie = porownaniev2(stare,nowe)
wyjscie=PrzytnijZakres((nowe-stare)+127.5);
end;


function wyjscie = porownanievPSmnoznik(stare,nowe,mnoznik)
wyjscie=PrzytnijZakres(mnoznik*abs(nowe-stare));
end;

function wyjscie = porownaniev2mnoznik(stare,nowe)
wyjscie=PrzytnijZakres(mnoznik*(nowe-stare)+127.5);
end;


for i=1:size(dimg,1)
for j=1:size(dimg,2)
for k=1:3
dimgvps(i,j,k)=porownanievPSmnoznik(dimg(i,j,k),dimg2(i,j,k),4);
dimgv2(i,j,k)=porownaniev2mnoznik(dimg(i,j,k),dimg2(i,j,k),3);
end;
end;
end;

hold on
subplot(2,2,1)
imshow(dimg/255);
title("org");
subplot(2,2,2)
imshow(dimg2/255);
title("gamma 1.5");
subplot(2,2,3)
imshow(dimgvps/255);
title("porownanie v.PS * 4");
subplot(2,2,4)
imshow(dimgv2/255);
title("porownanie v.2 * 3");