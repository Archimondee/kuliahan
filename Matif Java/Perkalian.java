import javax.swing.*;
class Perkalian
{

	public static void main(String[] args)
	{
		int A [][] = new int [3][3];
		int B [][] = new int [3][3];
		int hasil [][] = new int [3][3];
		
		String dataA [][] = new String [3][3];
		//String dataA [][] = new String [3][3];
		String dataB [][] = new String [3][3];
		String hasilS [][] = new String [3][3];
		
		int i,j,k,m;
		i=0;
		j=0;
		k=0;
		m=0;
		
// ***************** Matriks A *********************

		do
		{
			j=0;
			do
			{
				dataA[i][j] = JOptionPane.showInputDialog("Masukkan Data A ["+ i + "]["+ j + "]" );
				A[i][j] = Integer.parseInt(dataA[i][j]);
				
				j++;
			}while (j<3); //end do j
			
			i++;
		}while (i<3); //end do i
		
// ***************** Matriks B *********************

	k=0;
		do
		{
			m=0;
			do
			{
				dataB[k][m] = JOptionPane.showInputDialog("Masukkan Data B ["+ k + "]["+ m + "]" );
				B[k][m] = Integer.parseInt(dataB[k][m]);
				
				m++;
			}while (m<3); //end do m
			
			k++;
		}while (k<3); //end do k
		
// ***************** Menampilkan data pada Matriks A ***********************

		for (k=; k<3; k++ ) // for pada ini untuk menampilkan data
		{
			for (m=0; m<3; m++ )
			{
				System.out.print(" "+A[k][m]); // Menampilkan data A[i]);
				
			}
			
			System.out.println();  // membuat baris ke bawah
		}
			System.out.println("\n\n");
			
			
// ***************** Menampilkan data pada Matriks B ***********************

		for (k=0; k<3; k++ ) // for pada ini untuk menampilkan data
		{
			for (m=0; m<3; m++ )
			{
				System.out.print(" "+B[k][m]); // Menampilkan data B[i]);
				
			}
			
			System.out.println();  // membuat baris ke bawah
		}
			System.out.println("\n\n");
			
// ***************** Untuk mengalikan kedua matriks di atas ***********************	

				for (i=0; i<3; i++)
				{
					for (j=0; j<3; j++)
						{
							hasil[i][j] = 0;
							for (k=0; k<3; k++)
							{
							hasil[i][j] += A[i][k] * B[k][j];
							}
						}
				}
				System.out.println("\n\n");
				System.out.println("Hasilnya adalah = ");
				System.out.println("\n");
				
// ***************** untuk menampilkan hasil ***********************				

				for(i=0; i<3; i++)
					{
						for(j=0; j<3; j++)
						{
							//System.out.println("hasil tambah adalah ");
							System.out.print(" "+ hasil[i][j]);
						}
							System.out.println(" ");
					}
					
					System.out.println();  // membuat baris ke bawah
		}
}