import java.util.Scanner;
class jajargenjang{
	public static void main(String[]args){
		Scanner input = new Scanner(System.in);
		System.out.print("Masukan tinggi jajar genjang : ");
		int tinggi = input.nextInt();
		int i,j,k;
		for(i=1; i<=tinggi; i++){
			for(j=tinggi; j>i; j--){
				System.out.print(" ");
			}
			for(k=1; k<=tinggi; k++){
				System.out.print("* ");
			}
			System.out.println("");
		}
	}
}