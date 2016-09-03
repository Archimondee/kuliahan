import java.io.*;
class ini_buffered{
  public static void main(String[]args){
    BufferedReader ini = new BufferedReader(new InputStreamReader(System.in));
    String nilai1 = " ", nilai2 = " ", nilai3 = " ";
    try{
      System.out.print("Masukan nilai pertama : ");
      nilai1=ini.readLine();
      System.out.print("Masukan nilai kedua : ");
      nilai2 = ini.readLine();
      System.out.print("Masukan nilai ketiga : ");
      nilai3 = ini.readLine();
    }catch(Exception e){
      System.out.print("Error");
    }
    int akhir = (Integer.parseInt(nilai1)+(Integer.parseInt(nilai2)+(Integer.parseInt(nilai3))))/3;
    System.out.println("Nilai rata rata ujian : "+akhir);
    if (akhir>=60){
      System.out.println(":-)");
    }else{
      System.out.println("(-:");
    }
    }
  }
