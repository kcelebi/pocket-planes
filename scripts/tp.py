#get important cities
fs = open("data/city.txt","r")

imp_city = []

jp = fs.readline()
while(jp):
	spl = jp.split("	")
	imp_city.append(spl[0]) #give city
	#print(spl[0])
	jp = fs.readline()
fs.close()

file = open("data/citiesloc.txt","r")
file2 = open("data/loc.txt","w")

jp = file.readline()
while(jp):
	spl = jp.split(" ")
	if spl[0] in imp_city:
		file2.write(jp)
		print(spl[0])
	jp=file.readline()