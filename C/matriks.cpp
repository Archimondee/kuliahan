#include <stdio.h>

typedef int matrix [2][2]
  max a,b,c;
  int j,i;
  int main(){
    printf("\nElement matrix A: \n");
    for (i=0; i<2; i++){
      for(j=0;j<2;j++){
        printf ("A[%d][%d] = ",i,j);
        scanf("%d",&a[i][j]);
      }
    }

    printf ("\nElement matrix B: \n");
    for (i=0;i<2;i++){
      for(j=0;j<2;j++){
        printf ("B[%d][%d] = ",i,j);
        scanf("%d",%b[i][j]);
        c[i][j] = a[i][j] * b[i][j];
      }
    }

    printf ("\nMatrix C: \n");
    for(i=0;i<2;i++){
      for(j=0;j<2;j++){
        printf("C[%d][%d]  = %d\n",i,j,c[i][j]);
      }
    }
    return 0;
  }
