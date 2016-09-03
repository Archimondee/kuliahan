import javax.swing.*;
public class inioptionpane{
	public static void main(String[]args){
		String word1 = "";
		word1 = JOptionPane.showInputDialog("Masukan kata pertama :");
		String word2 = " ";
		word2 = JOptionPane.showInputDialog("Masukan kata kedua : ");
		String word3 = " ";
		word3 = JOptionPane.showInputDialog("Masukan kata ketiga : ");
		JOptionPane.showMessageDialog(null, +" "+word2+" "+word3);
	}
}
