import java.util.*;
class tugas_firda{
	void himpunan(){
		int jumA, jumB, i, j;
		Scanner ini_himpunan = new Scanner(System.in);
		int himpA[] = new int[100];
		int himpB[] = new int[100];

		System.out.print("Masukan banyak nya A = ");
		jumA = ini_himpunan.nextInt();
		for (i=1;i<=jumA;i++){
			System.out.print("Anggota A ke - "+i+" = ");
			himpA[i]=ini_himpunan.nextInt();
		}

		System.out.print("Masukan banyaknya B = ");
		jumB = ini_himpunan.nextInt();
		for(j=1; j<=jumB; j++){
			System.out.print("Anggota B ke - "+j+" = ");
			himpB[j]=ini_himpunan.nextInt();
		}
		System.out.println();
		System.out.println();
		int k,l;

		System.out.println("======= Diketahui bahwa =======");
		System.out.print("Himpunan A = { ");
		for(k=1;k<=jumA;k++){
			System.out.print(himpA[k]+", ");
		}
		System.out.println(" } ");

		System.out.print("Himpunan B = { ");
		for (l=1; l<=jumB;l++){
			System.out.print(himpB[l]+" ,");
		}
		System.out.println(" } ");

		//Gabungan
		System.out.println("======== Dengan Hasil =========");
		System.out.print("Gabungan = { ");
		for (i=1; i<=jumA;i++){
			System.out.print(himpA[i]+" ,");
		}
		boolean b = false;
		for(j=1; j<=jumB;j++){
			for(i=0;i<=jumA;i++){
				if(himpB[j]==himpA[i]){
					b = true;
					break;
				}
			}
			if(b==false){
				System.out.print(himpB[j]+" ,");
			}
			b=false;
		}
		System.out.println("}");
		//Irisan
		System.out.print("Irisan = { ");
		for(i=1;i<=jumA;i++){
			for(j=1;j<=jumB;j++){
				if(himpA[i]==himpB[j]){
					System.out.print(himpA[i]+" ,");
				}
			}
		}
		System.out.println(" }");
		System.out.println();
	}
	public static void main(String[]args){
		System.out.println("====== Menu Matif ======");
		System.out.println("");
		tugas_firda ini = new tugas_firda();
		ini.himpunan();

	}
}
