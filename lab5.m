img8=imread("rzeczka_mniejsza.jpg");
dimg=double(img8);

minimum=min(dimg(:));maksimum=max(dimg(:));
dimg2=(dimg-minimum)/(maksimum-minimum)*1;

R=dimg2(:,:,1);G=dimg2(:,:,2);B=dimg2(:,:,3);

MinRGB=min(dimg2(:));
MaxRGB=max(dimg2(:));

Chroma=MaxRGB-MinRGB;


function wyjscieK = wyliczH(R,G,B,Chroma)
if (Chroma <= 0.001)
wyjscie=0;
end;
if (R==maxRGB&&Chroma>0.001)
wyjscie=mod((G-B)/Chroma,6);
end;
if (G==maxRGB&&Chroma>0.001)
wyjscie=((B-R)/Chroma)+2;
end;
if (B==maxRGB&&Chroma>0.001)
wyjscie=((R-G)/Chroma)+4;
end;
wyjscieK=wyjscie*60;
endfunction;

function wyjscie = wyliczL(MinRGB,MaxRGB)
wyjscie=(MaxRGB+MinRGB)/2;
endfunction;


function wyjscie = wyliczS(L,Chroma)
if (L<=0.001||L>=0.999)
wyjscie=0;
end;
else
wyjscie=2;
end;
endfunction;


for (i=1:size(dimg2,1)
for (j=1:size(dimg2,2)
dimgH(i,j,:)=wyliczH(R,G,B,Chroma);
L=wyliczL(MinRGB,MaxRGB);
dimgS(i,j,:)=wyliczS(L,Chroma);
end;
end;

hold on;
subplot(2,2,1);
imshow(dimg2/1);
title("RGB");
subplot(2,2,2);
imshow(dimgH/1);
title("Hue/360stopni");
subplot(2,2,3);
imshow(dimgS/1);
title("Saturation");
subplot(2,2,4);
imshow(dimgL/1);
title("Lightness");