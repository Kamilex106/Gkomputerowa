img8 = imread("rzeczka.jpg");
dimg = double(img8);


wektor = vec(dimg,1);
wektor2 = vec(dimg,2);


function wyjscie = znajdz_x(x_wy,s_we,s_wy)
wyjscie=round(1+(((x_wy-1)*(s_we-1))/s_wy-1));
endfunction

function wyjscie = znajdz_y(y_wy,w_we,w_wy)
wyjscie=round(1+(((y_wy-1)*(w_we-1))/w_wy-1));
endfunction

for i=2:222
for j=2:333
for k=1:3
dimg2(i,j,k)=dimg(znajdz_x(i,size(dimg,2),333),znajdz_y(j,size(dimg,1),222),k);
end;
end;
end;



%v.2

img8 = imread("rzeczka.jpg");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,333,222);
imshow(dimg2/255);
imwrite(dimg2,"zad1.jpg");

%zad2


img8 = imread("rzeczka_mniejsza.jpg");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,1366,768);
imshow(dimg2/255);
imwrite(dimg2,"zad2.jpg");

%zad3

img8 = imread("logo_linuxa.png");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,672,788);
imshow(dimg2/255);
imwrite(dimg2,"zad3.png");

%zad4


img8 = imread("zrzut_1.png");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,900,432);
imshow(dimg2/255);
imwrite(dimg2,"zad4.png");

%zad5


img8 = imread("zrzut_1.png");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,600,246);
imshow(dimg2/255);
imwrite(dimg2,"zad5.png");

%zad6

img8 = imread("zrzut_1.png");
dimg = double(img8);


function wyjscie = znajdz_wyjsciowe(im,szerokosc,wysokosc)
s_we = size(im,2);
w_we = size(im,1);
y_we = 1:w_we;
x_we = 1:s_we;


s_wy = szerokosc;
w_wy = wysokosc;
y_wy = 1:w_wy;
x_wy = 1:s_wy;

y_wy =  y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy - 1)));
x_wy =  x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy - 1)));

wyjscie = im(y_we(y_wy),x_we(x_wy),:);
endfunction

dimg2=znajdz_wyjsciowe(dimg,400,400);
imshow(dimg2/255);
imwrite(dimg2,"zad6.png");
