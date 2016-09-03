# 1 2 2
# 2 1 2
# 2 2 1
# Jika perulangan pertama adalah angka 1 maka cetak angka 1
# 
tinggi = 10
for i in range(0,tinggi,1):
	for j in range(0,tinggi,1):
		#if i == 0 or i == tinggi - 1 or j == 0 or j == tinggi - 1:
			#print ('*',end='')
		#else:
			#print (end=' ')
		##print ('*',end=' ')
		if i == i and j==i:
			print ('  ',end='')
		else:
			print (' 2 ',end='')
	print (' ')