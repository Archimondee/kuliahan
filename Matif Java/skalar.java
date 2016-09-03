import java.io.*;
class skalar
{
	public static void main (String[] args) throws Exception
	{
		BufferedReader input = new BufferedReader( new InputStreamReader (System.in));
		
		System.out.println("Masukan Jumlah Ordo Matriks n*n =");
		int n = Integer.parseInt(input.readLine());
		int [][] A = new int [n][n];
		int [][] hasil = new int [n][n];
		System.out.println("Masukkan Indeks =");
		int a = Integer.parseInt(input.readLine());
		
		System.out.println("Matriks A:");
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{
			  System.out.print("Elemen ["+(i+1)+","+(j+1)+"]=");
			  A[i][j]=Integer.parseInt(input.readLine());
			}
		}
		
		
		for(int i=0;i<n;i++)
		{
			System.out.print("|");
			for(int j=0;j<n;j++)
			{
				System.out.print(" "+A[i][j]);
			}
			System.out.println("|");
	
		}
			System.out.println();
			
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{	
				hasil[i][j]=A[i][j]*a; 			
			}
		}
		

		for(int i=0;i<n;i++)
		{
				System.out.print("|");
				for(int j=0;j<n;j++)
			{	
			System.out.print(" "+hasil[i][j]);
			}
			System.out.println("|");
			
			
		}
		
		System.out.println();
	}
}
		
		
