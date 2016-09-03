import java.util.Scanner;
class ini_menu{
  public static void main(String[]args){
    Scanner input = new Scanner (System.in);
    int pilih;
    System.out.println("============ Menu Makanan ===========");
    System.out.println("1. Ayam Goreng");
    System.out.println("2. Bebek Goreng");
    System.out.println("3. Soto Ayam");
    System.out.println("4. Soto babat");
    System.out.println("");
    System.out.print("Silahkan pilih menu makanannya : ");
    pilih = input.nextInt();

    switch(pilih){
      case (1):
      System.out.print("Anda memilih ayam goreng");
      break;
      case (2):
      System.out.print("Anda memilih bebek goreng");
      break;
      case (3):
      System.out.print("Anda memilih soto ayam");
      break;
      case (4):
      System.out.print("Anda memilih soto babat");
      break;
      default:
      System.out.print("Tidak ada di daftar menu");
      break;
    }
  }
}
