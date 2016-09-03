public class matrikskalar{
	public static void main(String[]args){
		System.out.print("Nilai Skalar : ");
int A;
{
A=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null, "Nilai Skalar"));
		System.out.print(A);
		}

int baris=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Masukan Banyak Baris Untuk Matrik : ","2"));
int kolom=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Masukan Banyak Kolom Untuk Matrik: ","2"));
		
		System.out.println("\n");
		System.out.println("Nilai Matriks : \n");
		int B[][]=new int[baris][kolom];
		for(int i=0;i<baris;i++){
				System.out.print("|");
			for(int j=0;j<kolom;j++){
B[i][j]=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Nilai Matriks Baris Ke-"+(i+1)+", Kolom Ke-"+(j+1)+" = ","0"));
				System.out.print(" "+B[i][j]+" ");
			}
				System.out.println("|");
		}
		System.out.println("\n");

		System.out.println("=============================");
		System.out.println("Hasil Operasi Perkalian Matriks :");
		System.out.println("=============================");
		for(int i=0;i<baris;i++){
				System.out.print("|");
			for(int j=0;j<kolom;j++){
				System.out.print(" "+(A*B[i][j])+" ");
			}
			System.out.println("|\n");
		}		
	}
}
	
