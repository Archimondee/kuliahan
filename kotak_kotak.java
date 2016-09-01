public class kotak_kotak{
	public static void main(String[]args){
		int i;
		int j;
		int tinggi = 3;
		// Proof of Concept
		// 0 2 2
		// 2 0 2
		// 2 2 0
		// Jika i = i dan j = i maka akan cetak angka 0
		// selain itu angka 2
		// j > tinggi print new line
		for (i=0;i<tinggi;i++){
			for (j=0;j<tinggi;j++){
				if (i == i && j==i){
					//jika i = i print 0
					//jika j = i print 0
					System.out.print(" 0 ");
				}else{
					System.out.print(" 2 ");
				}
			}
			System.out.println("");
		}
	}
}