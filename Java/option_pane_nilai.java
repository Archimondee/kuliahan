import javax.swing.*;
public class option_pane_nilai{
  public static void main(String[]args){
    String nilai1 = " ";
    nilai1 = JOptionPane.showInputDialog("Masukan nilai pertama : ");
    String nilai2 = " ";
    nilai2 = JOptionPane.showInputDialog("Masukan nilai kedua : ");
    String nilai3 = " ";
    nilai3 = JOptionPane.showInputDialog("Masukan nilai ketiga : ");
    int akhir = (Integer.parseInt(nilai1)+(Integer.parseInt(nilai2)+(Integer.parseInt(nilai3))))/3;
    String ini = "Nilai rata rata anda : "+akhir;
    if(akhir>=60){
      JOptionPane.showMessageDialog(null, ini+" anda mendapat :-) ");
    }else{
      JOptionPane.showMessageDialog(null, ini+" anda mendapat (-: ");    
    }
  }
}
