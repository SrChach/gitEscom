#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
	int dato;
	struct nodo * siguiente;
} nodo;

typedef struct cola{
	nodo * frente;
	nodo * final;
	int size;
} cola;

cola ** crearCola(){
	cola ** nueva = NULL;
	nueva = (cola **)malloc(sizeof(cola*));
	if(nueva == NULL)
		return NULL;
	(*nueva) = (cola *)malloc(sizeof(cola));
	if((*nueva) == NULL)
		return NULL;
	(*nueva)->frente = NULL;
	(*nueva)->final = NULL;
	(*nueva)->size = 0;
	return nueva;
}

nodo * crearNodo(int dato){
	nodo * tmp = NULL;
	tmp = (nodo *)malloc(sizeof(nodo));
	if(tmp == NULL)
		return NULL;
	tmp->dato = dato;
	tmp->siguiente = NULL;
	return tmp;
}

int encolar(cola ** actual, int dato){
	nodo * tmp = crearNodo(dato);
	if(*actual == NULL)
		return -1;
	if( (*actual)->frente == NULL && (*actual)->final == NULL ){
		(*actual)->frente = tmp;
		(*actual)->final = tmp;
		(*actual)->size = 1;
		return 0;
	}
	(*actual)->final->siguiente = tmp;
	(*actual)->final = tmp;
	tmp->siguiente = (*actual)->final;
	(*actual)->final = tmp;
	(*actual)->size++;
	return 0;
}

int desencolar(cola ** actual){
	nodo * tmp = NULL;
	int retorno = 0;
	tmp = (*actual)->frente;
	retorno = tmp->dato;
	if((*actual)->frente == (*actual)->final){
		(*actual)->frente = NULL;
		(*actual)->final = NULL;
		(*actual)->size = 0;
		free(tmp);
		return retorno;
	}
	(*actual)->frente = tmp->siguiente;
	(*actual)->size--;
	free(tmp);
	return retorno;
}

int isEmpty(cola ** C){
	if((*C)->frente == NULL)
		return 1;
	return 0; 	
}

int main(){
	cola ** C = crearCola();
	encolar(C, 12);
	encolar(C, -1);
	printf("vacia: %d\n", isEmpty(C));
	printf("%d\n", desencolar(C));
	printf("%d\n", desencolar(C));
	printf("vacia: %d\n", isEmpty(C));

	return 0;
}