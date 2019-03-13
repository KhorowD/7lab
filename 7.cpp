#include <stdio.h>
#include <stdlib.h>

extern "C" int AllocMemory(int size, int* matrix);
//extern "C" int MinVal(int size, int *min, int* matrix);
int main()
{
	int matrix = 0;
	int size = 0;
	int i,j;
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
	
	printf("%d\n",matrix);
	
	return 0;
}