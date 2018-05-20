#include <stdio.h>
#include <stdlib.h>

struct nodo{
	int dato;
	struct nodo * siguiente;
};

struct nodo * crearNodo(int dato){
	struct nodo * tmp = NULL;
	tmp = (struct nodo *)malloc(sizeof(struct nodo));
	if(tmp==NULL)
		return NULL;
	tmp->dato = dato;
	tmp->siguiente = NULL;
	return tmp;
}

struct nodo * buscarUltimo(struct nodo * lista){
	struct nodo * aux = lista;
	if(aux == NULL)
		return NULL;
	while(aux->siguiente != NULL){
		aux = aux->siguiente;
	}
	return aux;
}

int insertar(struct nodo **lista, int dato){
	struct nodo * nuevo = NULL;
	struct nodo * ultimo = NULL;
	nuevo = crearNodo(dato);
	if(nuevo == NULL)
		return -1;
	if(lista == NULL)
		return -2;
	ultimo = buscarUltimo((*lista));
	ultimo->siguiente = nuevo;
	return 0;	
}

int mostrar(struct nodo * lista){
	struct nodo * aux = lista;
	if(aux==NULL)
		return -2;
	while(aux->siguiente != NULL){
		printf("%d ", aux->dato);
		aux = aux->siguiente;
	}
	printf("%d", aux->dato);
	return 0;
}

int main(void){
	struct nodo * lista = crearNodo(0);
	int i;
	for(i=1;i<100;i++){
		insertar(&lista, i);
	}
	mostrar(lista);	

	return 0;
}
