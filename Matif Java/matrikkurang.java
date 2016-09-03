public class matrikkurang{
	public static void main(String[]args){
		System.out.println("Matriks A : \n");
int baris=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Masukan Banyak Baris Untuk Matrik : ","2"));
int kolom=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Masukan Banyak Kolom Untuk Matrik: ","2"));
		int A[][]=new int[baris][kolom];
		for(int i=0;i<baris;i++){
			System.out.print("|");
			for(int j=0;j<kolom;j++){
A[i][j]=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Nilai A Baris Ke-"+(i+1)+", Kolom Ke-"+(j+1)+" = ","0"));
				System.out.print(" "+A[i][j]+" ");
				}
				System.out.println("|");
				}
		System.out.println("\n");
		System.out.println("Matriks B : \n");
		int B[][]=new int[baris][kolom];
		for(int i=0;i<baris;i++){
				System.out.print("|");
			for(int j=0;j<kolom;j++){
B[i][j]=Integer.parseInt(javax.swing.JOptionPane.showInputDialog(null,"Nilai B Baris Ke-"+(i+1)+", Kolom Ke-"+(j+1)+" = ","0"));
				System.out.print(" "+B[i][j]+" ");
			}
				System.out.println("|");
		}
		System.out.println("\n");
		System.out.println("=============================");
		System.out.println("Operasi Matrik  Pengurangan :");
		System.out.println("=============================");
		for(int i=0;i<baris;i++){
				System.out.print("|");
			for(int j=0;j<kolom;j++){
				System.out.print(" "+(A[i][j]-B[i][j])+" ");
			}
				System.out.println("|");
		}		
	}
}
	