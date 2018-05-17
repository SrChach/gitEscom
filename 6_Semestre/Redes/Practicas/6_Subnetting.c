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

int * sumando(int *num, int sum){
	int i;
	for(i=0; i<8; i++){
		if(sum == 0)
			break;
		if(num[i] == 0){
			num[i] = 1;
			sum--;
		}
	}
}

int aDecimal(int * num){
	int i, cont = 0;
	for(i=0; i<8; i++){
		if(num[i] == 1)
			cont += (int)pow(2, 8-(i+1));
	}
	return cont;
}

int main(){
	int a[4], e[4], i, j = 0, flag = 0, resp = 0, cantSubredes, *num1, *num2, *num3, *num4, *m1, *m2, *m3, *m4;
	
	printf("introduce la direccion de host\n");
	scanf("%d.%d.%d.%d", &a[0], &a[1], &a[2], &a[3]);
	
	num1 = lecturaYConversion(a[0]);
	num2 = lecturaYConversion(a[1]);
	num3 = lecturaYConversion(a[2]);
	num4 = lecturaYConversion(a[3]);
	
	if(num1 == NULL || num2 == NULL || num3 == NULL || num4 == NULL){
		printf("Uno o más de los datos están fuera del rango 0->255");
		return 1;
	}

	printf("\nIntroduce la mascara de subred original\n");
	scanf("%d.%d.%d.%d", &e[0], &e[1], &e[2], &e[3]);

	m1 = lecturaYConversion(e[0]);
	m2 = lecturaYConversion(e[1]);
	m3 = lecturaYConversion(e[2]);
	m4 = lecturaYConversion(e[3]);

	if(m1 == NULL || m2 == NULL || m3 == NULL || m4 == NULL){
		printf("Uno o más de los datos están fuera del rango 0->255");
		return 1;
	}

	printf("\nIntroduce la cantidad de subredes que deseas\n");
	scanf("%d", &cantSubredes);

	for(i=0; i<8; i++)
		if(m1[i] == 1){
			j++;
		} else {
			flag = 1;
			break;
		}
	for(i=0; i<8; i++)
		if(m2[i] == 1 && flag == 0){
			j++;
		} else {
			flag = 1;
			break;
		}
	for(i=0; i<8; i++)
		if(m3[i] == 1 && flag == 0){
			j++;
		} else {
			flag = 1;
			break;
		}
	for(i=0; i<8; i++)
		if(m4[i] == 1 && flag == 0){
			j++;
		} else {
			break;
		}
	
	if(cantSubredes > pow(2, 32-j)){
		printf("no se pueden hacer tantas subredes");
		return 2;
	} else if(cantSubredes == (int)pow(2, 32-j)){
		printf("se pueden realizar las subredes, pero no hay espacio para direcciones de host");
		return 2;
	}

	flag = 0;
	for(i=0; i<(32-j); i++){
		if((int)pow(2, i+1) >= cantSubredes){
			flag = i+1;
			break;
		}
	}

	printf("\nse tomarán prestados %d bits", flag);
	
	printf("\nbits de la mascara original %d", j);
	resp = flag;
	if(j<=8){
		if(flag<=8){
			m2 = sumando(m2, flag);
		} else if(flag <= 16){
			m2 = sumando(m2, 8);
			m3 = sumando(m3, flag - 8);
		} else {
			m2 = sumando(m2, 8);
			m3 = sumando(m3, 8);
			m4 = sumando(m4, flag - 16);
		}
	} else if(j<=16){
		if(flag <= 8){
			m3 = sumando(m3, flag);
		} else if(flag <= 16) {
			m3 = sumando(m3, 8);
			m4 = sumando(m4, flag - 8);
		}
	} else if(j<=24){
		m4 = sumando(m4, flag);
	}

	printf("mascara de subred nueva: \n\t%d.%d.%d.%d\n", aDecimal(m1), aDecimal(m2), aDecimal(m3), aDecimal(m4));
	for(i=1; i<= cantSubredes; i++){
		printf("subred %d:\n", i);
		flag = resp;
		if(j<=8){
			printf("direccion de Red: %d.%d.%d.%d\n", a[0], aDecimal(m2), aDecimal(m3), aDecimal(m4));
			if(flag<=8){
				m2 = sumando(m2, flag);
			} else if(flag <= 16){
				m2 = sumando(m2, 8);
				m3 = sumando(m3, flag - 8);
			} else {
				m2 = sumando(m2, 8);
				m3 = sumando(m3, 8);
				m4 = sumando(m4, flag - 16);
			}
		} else if(j<=16){
			printf("direccion de Red: %d.%d.%d.%d\n", a[0], a[1], aDecimal(m3), aDecimal(m4));
			if(flag <= 8){
				m3 = sumando(m3, flag);
			} else if(flag <= 16) {
				m3 = sumando(m3, 8);
				m4 = sumando(m4, flag - 8);
			}
		} else if(j<=24){
			printf("direccion de Red: %d.%d.%d.%d\n", a[0], a[1], a[2], aDecimal(m4));
			m4 = sumando(m4, flag);
		}
		printf("\n");
	}

	return 0;
}
