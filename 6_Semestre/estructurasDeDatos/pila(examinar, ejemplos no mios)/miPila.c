#include <stdio.h>
#include <stdlib.h>

typedef struct nodo_s{
	int dato;
	struct nodo_s *siguiente;
} nodo_t;
 
typedef nodo_t *ptrNodo;
typedef nodo_t *ptrPila;
 
void push(ptrPila *pila, int x)
{
 // Crea un nuevo nodo
 ptrNodo nodo;
 nodo = (ptrNodo)malloc(sizeof(nodo_t));
 if (nodo != NULL)
	{
	 nodo->dato = x;
	 // El apuntador nodo->siguiente va a apuntar al primer nodo de la lista ligada
	 nodo->siguiente = *pila;
	 // pila va a apuntar al nuevo nodo, con esto hacemos que el nuevo nodo sea ahora el primer nodo de la lista ligada
	 *pila=nodo;
	}
}
 
/*
	Elimina el primer nodo de la lista ligada
	*pila es el apuntador que apunta al primer nodo de la lista ligada (la cima de la pila)
*/
int pop(ptrPila *pila){
	// Crea un nuevo nodo
	ptrNodo nodo;
	int x=0;

	// El nuevo nodo va a apuntar al primer nodo de la lista ligada
	nodo = *pila;
	x = (*pila)->dato;
	// Ahora el segundo nodo de la lista ligada va a ser el primero
	*pila = (*pila)->siguiente;
	// Borra el primer nodo de la lista ligada
	free(nodo);
	// Regresa el valor que contenía el nodo que se eliminó
	return x;
}
 
/*
	Regresa 1 si no hay nodos en la lista ligada y cero en caso contrario
	*pila es el apuntador que apunta al primer nodo de la lista ligada (la cima de la pila)
*/
int pila_vacia(ptrPila *pila)
{
 return (*pila == NULL ? 1:0);
}
 
void nodos_pila(ptrNodo nodo)
{
 if (nodo == NULL)
	 printf("La pila está vacia\n");
 else
	 {
	  while (nodo != NULL)
			{
			 printf("%d\n",nodo->dato);
			 nodo = nodo->siguiente;
			}
	  printf("\n");
	 }
}

int main()
{
 char cadena[]="45+72-*5/";
 int i=0, num1=0, num2=0, result=0;
 ptrPila pila = NULL;
  
 // Muestra la cadena
 printf("La cadena a analizar es la siguiente:\n\n");
 while (cadena[i] != '\0')
	   {
		printf("%c", cadena[i]);        
		i++;
	   }
  
 i=0;
 printf("\n\n");
 // Recorre la cadena
 while (cadena[i] != '\0')
	   {
		// Si el elemento no es un operador, lo ingresa en la pila
		if (cadena[i]!='+' && cadena[i]!='-' && cadena[i]!='*' && cadena[i]!='/')          
			push(&pila, ((int)cadena[i])-48);   // El código ASCII de 0 es 48
		else
			 {
			  num2=pop(&pila);
			  num1=pop(&pila);
			  switch (cadena[i])
					 {
					  case '+':
							   result = num1+num2;
							   printf("suma %d + %d = %d\n",num1, num2, result);
							   push(&pila, result);
							   break;
					  case '-':
							   result = num1-num2;
							   printf("resta %d - %d = %d\n",num1, num2, result);
							   push(&pila, result);
							   break;
					  case '*':
							   result = num1*num2;
							   printf("multiplica %d * %d = %d\n",num1, num2, result);
							   push(&pila, result);
							   break;
					  case '/':
							   result = num1/num2;
							   printf("divide %d / %d = %d\n",num1, num2, result);
							   push(&pila, result);
							   break;
					 }           
			  }
		i++;
	   }
 
 if (pila_vacia(&pila)!=1)
	{
	 printf("\n\nLos elementos en la pila son los siguientes;\n\n");
	 // Muestra los elementos que están en la pila
	 nodos_pila(pila);
	}
  
 return 0;
}