#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int * lecturaYConversion(int e){
	int * temp = (int*)malloc(sizeof(int)*8);
	int i;
	if((e<0) || (e>255))
		return NULL;
	for(i=0; i<8; i++){
		temp[i] = 0;
		if(e >= pow(2, (7-i)) ){
			temp[i] = 1;
			e = e % (int)pow(2, (7-i));
		}
	}
	return temp;
}

void anadir(int **tot, int *num, int pos){
	int i;
	for(i=0; i<8 ;i++){
		(*tot)[i+pos] = num[i];
	}
}

int * totalBits(){
	int i, a[4], *num1, *num2, *num3, *num4, *host;
	scanf("%d.%d.%d.%d", &a[0], &a[1], &a[2], &a[3]);
	
	num1 = lecturaYConversion(a[0]);
	num2 = lecturaYConversion(a[1]);
	num3 = lecturaYConversion(a[2]);
	num4 = lecturaYConversion(a[3]);
	
	if(num1 == NULL || num2 == NULL || num3 == NULL || num4 == NULL){
		printf("Uno o más de los datos están fuera del rango 0->255. Reintroduce");
		return NULL;
	}

	printf("\n");
	host = (int*)malloc(sizeof(int)*32);

	anadir(&host, num1, 0);
	anadir(&host, num2, 8);
	anadir(&host, num3, 16);
	anadir(&host, num4, 24);
	return host;
}

int * copiar(int * num){
	int i, *newNet;
	newNet = (int*)malloc(sizeof(int)*32); 
	for(i=0;i<32;i++)
		newNet[i] = num[i];
	return newNet;
}

int * generaNueva(int *mask, int i, int f){
	int cont, *newMask;
	newMask = copiar(mask);
	for(cont = 0; cont<f; cont++)
		(newMask)[cont+i] = 1;
	return newMask;
}

void sumaUno(int **num, int ini, int lim){
	int i;
	for(i=ini+lim-1; i>=ini; i--){
		if((*num)[i]==0){
			(*num)[i]=1;
			break;
		} else {
			(*num)[i]=0;
		}
	}
	//
	printf("\n");
}

void aN(int **num, int ini, int conv){
	int i;
	for(i=ini;i<32;i++){
		(*num)[i]=conv;
	}
}

int aDecimal(int * num, int pos){
	int i, cont = 0;
	for(i=pos; i<8+pos; i++){
		if(num[i] == 1)
			cont += (int)pow(2, 7-i+pos);
	}
	return cont;
}

int main(){
	int i, f, k, l, cantSubredes, *host = NULL, *mask = NULL, *newMask = NULL, *outNet = NULL;
	printf("introduce la direccion de host\n");
	while(host==NULL)
		host = totalBits();

	printf("introduce la mascara de subred original\n");
	while(mask==NULL)
		mask = totalBits();

	printf("\nIntroduce la cantidad de subredes que deseas\n");
	scanf("%d", &cantSubredes);
	for(i=0;i<32;i++)
		if(mask[i] == 0)
			break;

	printf("\n%d\n", i);

	if(cantSubredes > pow(2, 31-i)){
		printf("no se pueden hacer tantas subredes");
		return 1;
	} else if(cantSubredes == (int)pow(2, 31-i)){
		printf("se pueden realizar las subredes, pero no hay espacio para direcciones de host");
		return 1;
	}

	for(f=0; f<(32-i); f++)
		if((int)pow(2, f+1) >= cantSubredes){
			f = f+1;
			break;
		}

	printf("Se tomaran prestados %d bits\n", f);
	
	newMask = generaNueva(mask, i, f);
	printf("Mascara de subred original: %d.%d.%d.%d\n", aDecimal(mask, 0), aDecimal(mask, 8), aDecimal(mask, 16), aDecimal(mask, 24));
	printf("Nueva mascara de subred: %d.%d.%d.%d\n", aDecimal(newMask, 0), aDecimal(newMask, 8), aDecimal(newMask, 16), aDecimal(newMask, 24));

	printf("\n");

	outNet = copiar(host);
	for(k=0;k<cantSubredes;k++){
	 	aN(&outNet, i+f, 0);
		printf("Direccion de red %d: %d.%d.%d.%d\n", k, aDecimal(outNet, 0), aDecimal(outNet, 8), aDecimal(outNet, 16), aDecimal(outNet, 24));
	 	aN(&outNet, i+f, 1);
		printf("Direccion de Broadcast %d: %d.%d.%d.%d\n", k, aDecimal(outNet, 0), aDecimal(outNet, 8), aDecimal(outNet, 16), aDecimal(outNet, 24));
		sumaUno(&outNet, i, f);
		printf("\n");
	}
	exit(0);
}
