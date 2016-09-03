import java.util.*;

public class Fungsi {
	Scanner input = new Scanner (System.in);
	int [] HimpunanA;
	int [] HimpunanB;
	int [] HimpunanRelasi;
	int [] HimpunanAsal;
	int jmlHimpunanA, jmlHimpunanB, jmlRelasi;
	
public static void main (String[]args){
System.out.println();
System.out.println ("======= PROGRAM FUNGSI SATU-SATU =======");
System.out.println();
	Fungsi jonpie = new Fungsi();
	jonpie.inputAnggota();
	jonpie.cetakHimpunan();
	jonpie.inputRelasi();
	jonpie.cekFungsi();
	jonpie.cetakRelasi();
	}
	
public void inputAnggota(){
	System.out.print ("Masukkan Jumlah Himpunan A = ");
	jmlHimpunanA = input.nextInt();
	
	HimpunanA = new int [jmlHimpunanA];
	for (int i=0 ; i<=(jmlHimpunanA-1) ; i++) {
		System.out.print ("Himpunan A yang ke "+(i+1)+" : ");
		HimpunanA[i] = input.nextInt();
		}
		
System.out.println();
	
	System.out.print ("Masukkan Jumlah Himpunan B = ");
	jmlHimpunanB = input.nextInt();
	
	HimpunanB = new int [jmlHimpunanB];
	for (int i=0 ; i<=(jmlHimpunanB-1) ; i++) {
		System.out.print ("Himpunan B yang ke "+(i+1)+" : ");
		HimpunanB[i] = input.nextInt();
		}
		}
		
public void cetakHimpunan(){
System.out.println();
	System.out.print ("Anggota Himpunan A = { ");
	for (int i=0 ; i<=(jmlHimpunanA-1) ; i++){
	System.out.print (HimpunanA[i]+ " ");
	}
	System.out.println("} ");
	
	System.out.print ("Anggota Himpunan B = { ");
	for (int i=0 ; i<=(jmlHimpunanB-1) ; i++){
	System.out.print (HimpunanB[i]+ " ");
	}
	System.out.println("} ");
	}
	
public void inputRelasi(){
System.out.println();
	int jmlRelasiMaks = jmlHimpunanA * jmlHimpunanB;
	System.out.println ("RELASI MAKSIMAL adalah " +jmlRelasiMaks);

	
	do{
	System.out.print ("Masukkan Jumlah Relasi terjadi : ");
	jmlRelasi = input.nextInt();
	}
	while (jmlRelasi>jmlRelasiMaks);
	System.out.println();
	System.out.println ("Masukkan Relasi yang terjadi : ");
			HimpunanRelasi = new int [jmlRelasi];
			HimpunanAsal = new int [jmlRelasi];
		for (int i=0 ; i<=(jmlRelasi-1) ; i++){
	
		int [] temp = new int [jmlRelasi];
		int [] temp2 = new int [jmlRelasi];
		boolean SamaA = false;
		boolean SamaB = false;
		System.out.println();
		System.out.println ("Relasi ke "+(i+1)+" : ");
		
	do{
	System.out.print ("Masukkan Asal A 	: ");
	temp[i] = input.nextInt();
	System.out.print ("Masukkan Tujuan B 	: ");
	temp2[i] = input.nextInt();
	System.out.println();
	
	for (int j=0 ; j<=(jmlHimpunanA-1) ; j++){
	if (temp[i] == HimpunanA[j]){
	SamaA = true;
	}
	}
	
	for (int k=0 ; k<=(jmlHimpunanB-1) ; k++){
	if (temp2[i] == HimpunanB[k]){
	SamaB = true;
	}
	}
	
	if (SamaA == false || SamaB == false){
		System.out.println ("Anggota Himpunan tidak terdapat di himpunan A atau B");
		}
	if (SamaA == true && SamaB == true){
		HimpunanRelasi[i] = temp2[i];
		HimpunanAsal[i] = temp[i];
		}
		}
	while (SamaA == false || SamaB == false);
	}
	}
	
public void cekFungsi(){
	int jumlahAnggota = 0;
	boolean adaSama = false;
	
	for (int i=0 ; i<=(jmlHimpunanA-1) ; i++){
	for (int j=0 ; j<=(jmlRelasi-1) ; j++){
		if (HimpunanA[i]==HimpunanAsal[j]){
		jumlahAnggota++;
		}
		}
		}
		
	for (int i=0 ; i<=(jmlRelasi-1) ; i++){
	for (int j=i+1 ; j<=(jmlRelasi-1) ; j++){
		if (HimpunanA[i]==HimpunanAsal[j]){
		adaSama=true;
		}
		}
		}
		
	if (jumlahAnggota==jmlHimpunanA&&adaSama == false){
		System.out.println("Relasi yang di input adalah Fungsi");
		jumlahAnggota=0;
		
	for (int i=0 ; i<=(jmlHimpunanB-1);i++){
	for (int j=0 ; j<=(jmlRelasi-1) ; j++){
		if (HimpunanB[i] == HimpunanRelasi[j]){
		jumlahAnggota++;
		}
		}
		}
		
	for (int i=0 ; i<=(jmlRelasi-1) ; i++){
	for (int j=i+1 ; j<=(jmlRelasi-1) ; j++){
		if (HimpunanRelasi[i] == HimpunanRelasi[j]){
		adaSama = true;
		}
		}
		}
		
	if (jumlahAnggota==jmlHimpunanB && adaSama == false){
			System.out.println ("Fungsi yang di input adalah fungsi satu-satu");
		}
		}
	else{
		System.out.println ("Fungsi yang di input bukan fungsi, hanya Relasi biasa" +jumlahAnggota);
		}
		}
		
public void cetakRelasi(){
	System.out.print ("Daerah Domain 		= { ");
		for (int i=0 ; i<= jmlHimpunanA-1 ; i++){
		System.out.print(HimpunanA[i]+" ");
		}
		System.out.println("}");
		
	System.out.print ("Daerah Kodomain 	= { ");
		for (int i=0 ; i<= jmlHimpunanB-1 ;
		i++){
		System.out.print(HimpunanB[i]+" ");
		}
		System.out.println("}");
		
	System.out.print ("Daerah Range 		= { ");
		for (int i=0 ; i<= jmlRelasi-1 ; i++){
		boolean adaSama = false;
		for (int j=i+1 ; j <= jmlRelasi-1 ; j++){
		if (HimpunanRelasi[i] == HimpunanRelasi[j])
		adaSama = true;
		}
		if (adaSama = true)
		System.out.print (HimpunanRelasi[i]+" ");
		}
		System.out.println("}");
		}
		}
		