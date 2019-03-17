#include <stdio.h>
#include <stdlib.h>

extern "C" int AllocMemory(int size, int* matrix);
extern "C" void SetVal(int size, int i, int j, int* matrix, int element);
extern "C" int GetVal(int size, int i, int j, int* matrix);
extern "C" void FreeMemory(int* matrix);
int main()
{
	int matrix = 0;
	int size = 0;
	int i,j;
	int element;
	int min = 0;
	
	printf("Enter square matrix size( 0 < n < 11):\n");
	scanf("%d", &size);
	printf("Entered size: %d\n", size);
	
	printf("start allocation\n");
	
	if(AllocMemory(size, &matrix))
	{ 	 	
		printf("Allocation error!\n");
		return 1;
	}
	
	
	for(i = 0; i < size; i++)
	{
		for(j = 0; j < size; j++)
		{
			printf("[%d][%d] = ",i+1,j+1);
			scanf("%d", &element);
			SetVal(size, i, j, &matrix, element);
			printf("\n");
		}
		printf("\n");
	}
	

	for(i = 0; i < size; i++){

		for(j = 0; j < size; j++)
		{
			printf("[%d][%d] = %d ",i+1,j+1, GetVal(size, i, j, &matrix));
		}
		printf("\n");
	}

	min = GetVal(size, 0, 0, &matrix);
	
	for(i = 1; i < size; i++)
	{
		if(min > GetVal(size, i, i, &matrix))
		{
			min = GetVal(size, i, i, &matrix);
		}
	}
	
	printf("Min value: %d\n", min);
	
	for(i = 0; i <= size-1; i++)
	{
		for(j = 0; j <= size-1; j++)
		{
			if((i==j)||(i+j==size - 1)) SetVal(size, i, j, &matrix, min);
		}
	}
	

	for(i = 0; i < size; i++){

		for(j = 0; j < size; j++)
		{
			printf("[%d][%d] = %d ",i+1,j+1, GetVal(size, i, j, &matrix));
		}
		printf("\n");
	}
	
	FreeMemory(&matrix);
	
	printf("Memory cleared\n");
	
	return 0;
}