import java.util.Scanner;
public class Relasi{
       Scanner input = new Scanner(System.in);
       int[] himpunanA= new int[10];
       int[] himpunanB= new int[10];
       int[] himpunanHasil = new int[10];
       int jumlahAnggotaA;
       int jumlahAnggotaB;
       int jumlahRelasi;

       public static void main(String args[]){
           Relasi A = new Relasi();
           A.inputAnggota();
           A.inputRelasi();
           A.cetakRelasi();
       }
       
 public void inputAnggota(){
              System.out.print("Masukkan Jumlah Anggota Z : ");
              jumlahAnggotaA = input.nextInt();

              System.out.println("Anggota Himpunan Z");
              for(int i=1;i<=jumlahAnggotaA;i++){
                      System.out.print("Anggota "+i+" : ");
                      himpunanA[i]=input.nextInt();
              }

              System.out.print("Masukkan Jumlah Anggota Himpunan X : ");
              jumlahAnggotaB = input.nextInt();

              System.out.println("Anggota Himpunan X");
               for(int i=1;i<=jumlahAnggotaB;i++){
                      System.out.print("Anggota "+i+" : ");
                      himpunanB[i]=input.nextInt();
              }
       }


       public void inputRelasi(){
              int jmlRelasiMaks = jumlahAnggotaA*jumlahAnggotaB;
              System.out.println("Banyak Relasi maksimal yang terjadi Adalah : "+ jmlRelasiMaks);

              do{
                 System.out.print("Masukkan Jumlah Relasi terjadi : ");
                 jumlahRelasi = input.nextInt();
              }while(jumlahRelasi>jmlRelasiMaks);

              System.out.println("Masukkan Relasi yang Terjadi :");
              for(int i=1; i<=jumlahRelasi;i++){
                 int temp[] = new int[10];
                 int temp2[] = new int[10];
                 boolean SamaA = false;
                 boolean SamaB = false;
				System.out.println("Relasi ke "+i+" : ");
                    do{
                    System.out.print("Masukkan Asal A : ");
                    temp[i]=input.nextInt();
                    System.out.print("Masukkan Tujuan B: ");
                    temp2[i]=input.nextInt();

                    for (int j= 1; j<=jumlahAnggotaA;j++){
                        if(temp[i]==himpunanA[j]){
                           SamaA=true;
                        }
                    }

                    for (int k= 1; k<=jumlahAnggotaB;k++){
                        if(temp2[i]==himpunanB[k]){
                           SamaB=true;
                        }
                    }
                    if(SamaA==false || SamaB==false){
                        System.out.println("Anggota Himpunan Tidak terdapat dihimpunan A atau B");
                    }

                   if(SamaA==true && SamaB==true){
                        himpunanHasil[i]=temp2[i];
                    }

                 }while(SamaA==false || SamaB==false);
                 }
       }
       public void cetakRelasi(){
              System.out.print("Daerah Domain = { ");
              for(int i=1;i<=jumlahAnggotaA;i++){
                System.out.print(himpunanA[i]+" ");
              }
              System.out.println("}");

              System.out.print("Daerah Kodomain { ");
              for(int i=1;i<=jumlahAnggotaB;i++){
                System.out.print(himpunanB[i]+ " ");
              }
              System.out.println("}");
              System.out.print("Daerah range adalah : { ");
              for(int i= 1;i<= jumlahRelasi;i++){
                   System.out.print(himpunanHasil[i]+ " ");
              }
              System.out.println("}");
				 
			 }
       }
