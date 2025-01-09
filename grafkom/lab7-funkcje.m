function wyjscie = Skalowanie(wejscie,s_wy,w_wy)
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

function wyjscie = Skalowanie(wejscie,s_wy,w_wy)
s_we=size(wejscie,2);
w_we=size(wejscie,1);
x_we=1:s_we;
y_we=1:w_we;

x_wy=1:s_wy;
y_wy=1:w_wy;

y_wy = y_we(round(1+((y_wy-1)*(w_we-1))/(w_wy-1)));
x_wy = x_we(round(1+((x_wy-1)*(s_we-1))/(s_wy-1)));

wyjscie=wejscie(y_we(y_wy),x_we(x_wy),:);
endfunction

