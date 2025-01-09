function wyjscie = przeskaluj(wejscie,s_wy,w_wy)
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
przes=przeskaluj(dimg,333,222);
imshow(przes/255);

przes=przeskaluj(dimg,1366,768);
imshow(przes/255);

img8=imread("logo_linuxa.png");
dimg=double(img8);
przes=przeskaluj(dimg,672,788);
imshow(przes/255);

img8=imread("zrzut_1.png");
dimg=double(img8);
przes=przeskaluj(dimg,900,432);
imshow(przes/255);


przes=przeskaluj(dimg,600,246);
imshow(przes/255);

przes=przeskaluj(dimg,400,400);
przes=przeskaluj(dimg,603,285);
imshow(przes/255);
