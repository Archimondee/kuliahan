import java.util.Scanner;
class menuDeterminan{
	Scanner input = new Scanner(System.in);
	int [][] matrika = new int[3][3];
	public void inputElement(){
		for(int i=0;i<3;i++){
			for (int j=0;j<3;j++){
				System.out.print("Elemen [ "+(i+1)+","+(j+1)+" ] = ");
				matrika[i][j] = input.nextInt();
			}
		}
	}

	public void ordox(){
		System.out.println("\nDeterminan 2x2");
		System.out.println();
		for (int i = 0;i<2;i++){
			System.out.print(" | ");
			for(int j=0;j<2;j++){
				System.out.print(matrika[i][j]+" ");
			}
			System.out.println(" | ");
		}
		int dtr=(matrika[1][1] * matrika[0][0])-(matrika[0][1]*matrika[1][0]);
		System.out.println("Determinan = "+dtr);
	}

	public void ordoxx(){
		System.out.println("\nDeterminan 3x3");
		System.out.println("");
		for(int i=0;i<3;i++){
			System.out.print(" | ");
			for(int j=0;j<3;j++){
				System.out.print(matrika[i][j]+" ");
			}
			System.out.println(" | ");
		}
		int dtr=((matrika[0][0]*matrika[1][1]*matrika[2][2])+(matrika[0][1]*matrika[1][2]*matrika[2][0])+
			(matrika[0][2]*matrika[1][0]*matrika[2][1])-(matrika[0][2]*matrika[1][1]*matrika[2][0])+
			(matrika[0][0]*matrika[1][2]*matrika[2][1]) + (matrika[0][1]*matrika[1][0]*matrika[2][2]));
		System.out.println("Determinan = "+dtr);
	}
	public void menu(){
		System.out.println();
		System.out.println("#################################");
		System.out.println("####### 	Menu Utama	 ########");
		System.out.println("#################################");
		System.out.println("###                             #");
		System.out.println("###     1. Input                #");
		System.out.println("###     2. Determinan Ordo 2x2  #");
		System.out.println("### 	3. Determinan Ordo 3x3  #");
		System.out.println("### 	4. Exit  				#");
		System.out.println("###								#");
		System.out.println("#################################");
		System.out.println();
		System.out.print("Masukan pilihan anda : ");
		int pil = input.nextInt();
		if(pil == 1){
			inputElement();
			menu();
		}
		if (pil == 2){
			ordox();
			menu();
		}
		if(pil == 3){
			ordoxx();
			menu();
		}
		if(pil == 4){
			System.out.println();
			System.out.println("I am out");
		}
	}
	public static void main(String[]args){
		menuDeterminan Determinan = new menuDeterminan();
		Determinan.menu();
	}

}