import java.io.*;
class transpose
{
	public static void main (String[] args) throws Exception
	{
		BufferedReader input = new BufferedReader( new InputStreamReader (System.in));
                //deklarasi objek input dari kelas buffered reader
		
	
		
		System.out.print("masukan jumlah ordo matriks n*n =");
		int n=Integer.parseInt(input.readLine());
		int [][] matrika = new int [n][n];
		int [][] matrikb = new int [n][n];
		int [][] matrikc = new int [n][n];
                //deklasari variabel yang digunakan
		System.out.println("matriks A:");
		for(int i=0;i<n;i++)  
		{
			for(int j=0;j<n;j++)
			{
			  System.out.print("elemen ["+(i+1)+","+(j+1)+"]=");
			  matrika[i][j]=Integer.parseInt(input.readLine());  //input nilai matriks A ke dalam variabel matrika
			 }
		}
		System.out.println("matriks B:");
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{
			  System.out.print("elemen ["+(i+1)+","+(j+1)+"]=");
			  matrikb[i][j]=Integer.parseInt(input.readLine());
			 }
		}
		System.out.print("");
		for(int i=0;i<n;i++)
		{
			System.out.print("|");
			for(int j=0;j<n;j++)
			{
			 matrikc[i][j]=matrika[i][j]+matrikb[i][j]; //rumus penjumlahan matriks
			System.out.print(matrikc[i][j]+" ");
			
			}
			System.out.println("|");
			
		}
		System.out.print("]");
	}
}
