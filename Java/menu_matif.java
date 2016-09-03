import java.util.*;
class menu_matif{
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
	void relasi_fix(){
		Scanner relasi1 = new Scanner(System.in);
		int jumA, jumB, i, j;
		int rel1A[] = new int[100];
		int rel1B[] = new int[100];

		System.out.print("Masukan banyak nya A = ");
		jumA = relasi1.nextInt();
		for (i=1;i<=jumA;i++){
			System.out.print("Anggota A ke - "+i+" = ");
			rel1A[i]=relasi1.nextInt();
		}

		System.out.println();
		System.out.println();
		System.out.print("Relasi Reflektif = { ");
		for (i=1;i<=jumA;i++){
			for(j=1; j<=jumA;j++){
				if (rel1A[i]== rel1A[j]){
					System.out.print("("+rel1A[i]+","+rel1A[j]+")");
				if(j != jumA-1)
					System.out.print(",");
				}
			}
		}
		System.out.println("}");
		System.out.print("Relasi simetris = { ");
		for(i=1;i<=jumA;i++){
			for(j=1;j<=jumA;j++){
				if(rel1A[i]!=rel1A[j]){
					System.out.print("("+rel1A[i]+","+rel1A[j]+")");
					if(j != jumA-1)
						System.out.print(",");
				}
			}
		}
		System.out.println("}");
		System.out.print("Relasi Transitif = { ");
		for(i=1;i<=jumA;i++){
			for(j=1;j<=jumA;j++){
				if(rel1A[i] != rel1A[j]){
					if(i%2!=0){
						if(j%2==0){
							System.out.print("("+rel1A[i]+","+rel1A[j]+")");
							if(j != jumA-1)
								System.out.print(",");
						}else{
							if(j%2 != 0){
								if(j%2 != 0){
									System.out.print("("+rel1A[i]+","+rel1A[j]+")");
									if(j != jumA-1)
										System.out.print(",");
								}
							}
						}
					}
				}
			}
		}
		System.out.print("}");
	}
	void relasi2(){
		Scanner itu_relasi = new Scanner (System.in);
		int[]himpunA = new int[10];
		int[]himpunB = new int[10];
		int jumA;
		int jumB;
		int jumR;
		int jumRel;

		System.out.print("Masukan jumlah A : ");
		jumA = itu_relasi.nextInt();

		System.out.println("Anggota himpunan A");
			for(int i=1; i<=jumA; i++){
				System.out.print("Anggota "+i+" : ");
					himpunA[i]=itu_relasi.nextInt();
			}

		System.out.print("Masukan jumlah B : ");
		jumB = itu_relasi.nextInt();

		System.out.println("Anggota himpunan B : ");
			for(int j=1; j<=jumB; j++){
				System.out.print("Anggota "+j+" : ");
					himpunB[j]= itu_relasi.nextInt();
			}
		int jmlMax = jumA*jumB;
			System.out.println("Banyak relasi maksimal yang terjadi adalah "+jmlMax);
			System.out.print("Anggota A = { ");
		int a = 1;
		do{
			System.out.print(+himpunA[a]+" ");
			a++;
		}while(a<=jumA);
			System.out.println("}");
		int b = 1;
		System.out.print("Anggota B = { ");
		do{
			System.out.print(+himpunB[b]+" ");
			b++;
		}while(b<=jumB);
			System.out.println("}");
			System.out.println("NOTE : Untuk penginputan relasi pastikan berada pada anggota A dan B");
		do{
			System.out.print("Masukan jumlah relasi yang terjadi : ");
			jumRel = itu_relasi.nextInt();
		}while(jumRel>jmlMax);

	System.out.println("Masukan relasi yang terjadi : ");
		int relA[] = new int[10];
		int relB[] = new int[10];
		int z;
		int y;
		int f;
		int g;
		int h;
		int p;
	for(z=1; z<=jumRel; z++){
		System.out.println("Relasi ke "+z+" : ");
			System.out.print("Masukan asal A : ");
			relA[z]=itu_relasi.nextInt();
			System.out.print("Masukan asal B : ");
			relB[z]=itu_relasi.nextInt();
	}
	System.out.print("Daerah domain = { ");
	for(g=1; g<z; g++){
		System.out.print(himpunA[g]+" ");
	}
	System.out.println("}");

	System.out.print("Daerah Kodomain = { ");
	for(h=1; h<z; h++){
		System.out.print(himpunB[h]+" ");
	}
	System.out.println("}");

	System.out.print("Daerah range = { ");
	for (p=1; p<z; p++){
		System.out.print(relB[p]+" ");
	}
	System.out.println("}");

	System.out.print("Relasi yg terjadi = {");
	for (y=1; y<z; y++){
	System.out.print("( "+relA[y]+" , "+relB[y]+" )");
	}
	System.out.println("}");
}
public void fungsi(){
	Scanner input = new Scanner(System.in);
	int [] fungsiA;
	int [] fungsiB;
	int jmlFungsi;

	System.out.print("Masukan anggota A dan B = ");
	jmlFungsi = input.nextInt();

	fungsiA = new int [100];
	fungsiB = new int [100];
	for(int i=1; i<=jmlFungsi; i++){
		System.out.print("Masukan anggota A ke " +i+ " = ");
		fungsiA[i] = input.nextInt();
	}
	System.out.println("");
	for(int j=1; j<=jmlFungsi;j++){
		System.out.print("Masukan anggota B ke "+j+"= ");
		fungsiB[j] = input.nextInt();
	}
	System.out.println("Kemungkinan fungsi yang dapat terjadi "+jmlFungsi);

	System.out.print("Fungsi kodomain A = { ");
	for(int a=1;a<=jmlFungsi;a++){
		System.out.print(fungsiA[a]+" ");
	}
	System.out.println("}");

	System.out.print("Fungsi kodomain B = { ");
	for(int b=1;b<=jmlFungsi;b++){
		System.out.print(fungsiB[b]+" ");
	}
	System.out.println("}");

	System.out.print("Fungsi A untuk B adalah = {");
	for(int k=1; k<=jmlFungsi;k++){
		System.out.print("("+fungsiA[k]+","+fungsiB[k]+")");
	}
	System.out.println("}");
	System.out.println("Fungsi ini termasuk fungsi satu satu");
}
	public static void main(String[]args){
		System.out.println("====== Menu Matif ======");
		System.out.println("");
		menu_matif ini = new menu_matif();
		ini.relasi_fix();

	}
}
