#include <stdio.h>
#include <stdlib.h>



int main(){
	
	int uno, dos, tres, cuatro;
	printf("Introduce la Direccion IP:\n");
	scanf("%d.%d.%d.%d", &uno, &dos, &tres, &cuatro);
		
	printf("\nClase de IP:  ");
	if( 1<=uno && uno<=127 ){
		printf("A\nDireccion de Red: %d.0.0.0\nMascara de Red: 255.0.0.0\nDireccion de Broadcast: %d.255.255.255\nRango de direcciones de Host: %d.0.0.1 -> %d.255.255.254", uno, uno, uno, uno);
		
	} else if(128<=uno && uno<=191){
		printf("B\nDireccion de Red: %d.%d.0.0\nMascara de Red: 255.255.0.0\nDireccion de Broadcast: %d.%d.255.255\nRango de direcciones de Host: %d.%d.0.1 -> %d.%d.255.254", uno, dos, uno, dos, uno, dos, uno, dos);
	} else if(192<=uno && uno <=223){
		printf("C\nDireccion de Red: %d.%d.%d.0\nMascara de Red: 255.255.255.0\nDireccion de Broadcast: %d.%d.%d.255\nRango de direcciones de Host: %d.%d.%d.1 -> %d.%d.%d.254", uno, dos, tres, uno, dos, tres, uno, dos, tres, uno, dos, tres);
	} else {
		printf("Dirección IP inválida");
	}
	
	return 0;
}
