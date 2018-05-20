#include <stdio.h>
#include <stdio.h>

/*
	Programa que calcula la producciones de 1 elemento a partir de dos, incluye combinaciones de nC3
*/

int main(){
	int n=0, q=0, a=0, k=0;
	scanf("%d", &n);
	for(q=0;q<n-1;q++){
		for(a=q+1;a<n;a++){
			for(k=a+1;k<=n;k++){
				printf("(%d, %d)=> %d\n(%d, %d)=> %d\n(%d, %d)=> %d\n", q, a, k, q, k, a, k, a, q);
			}
		}
	}
	printf("%d", n);

	return 0;
}
