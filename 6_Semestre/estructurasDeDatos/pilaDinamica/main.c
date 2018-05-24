#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
	int dato;
	struct nodo * anterior;
} nodo;

nodo ** crearPila(){
	nodo ** pila = (nodo**)malloc(sizeof(nodo*));
	if(pila == NULL)
		return NULL;
	*pila = NULL;
	return pila;
}

nodo * crearNodo(int dato){
	nodo * tmp = NULL;
	tmp = (nodo *)malloc(sizeof(nodo));
	if(tmp == NULL)
		return NULL;
	tmp->dato = dato;
	tmp->anterior = NULL;
	return tmp;
}

int push(nodo **pila, int dato){
	nodo *nuevo = NULL;
	nuevo = crearNodo(dato);
	if(nuevo == NULL)
		return -1;
	if(*pila == NULL){
		*pila = nuevo;
		return 0;
	}
	nuevo->anterior = *pila;
	*pila = nuevo;
	return 0;
}

int pop(nodo **pila){
	if(*pila == NULL){
		printf("pila vacia\n");
		exit(-1);
	}
	nodo * aux = *pila;
	int r = (*pila)->dato;
	*pila = (*pila)->anterior;
	free(aux);
	return r;
}

int isEmpty(nodo **pila){
	return *pila == NULL;
}

int top(nodo ** pila){
	return (*pila)->dato;
}

int vaciar(nodo ** pila){
	nodo * aux;
	while(*pila != NULL){
		aux = *pila;
		*pila = (*pila)->anterior;
		free(aux);
	}
}

int main(){
	nodo ** pila = crearPila();
	int a = 0, i;
	for(i=0; i<100;i++){
		push(pila, i);
	}
	for(i=0;i<100;i++){
		printf("%d ", pop(pila));
	}

	return 0;
}
