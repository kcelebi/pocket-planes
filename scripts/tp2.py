file = open("data/prices.txt")


#run to find out last city prices to figure out
line = file.readline()
#pp = set()
#cities = set()

while line != "":
	sp = line.split("\t\t")
	#print("{} : {}".format(sp[2],sp[2] == "--\n"))
	if sp[2] == "--\n" or sp[2] == "--":
		print("|".join([sp[0],sp[1]]))
	#print("|".join([sp[0],sp[1]]))
	#if "|".join([sp[0],sp[1]]) not in pp and "|".join([sp[1],sp[0]]) not in pp:
	#	pp.add("|".join([sp[0],sp[1]]))
	#	cities.add(sp[0])
	#	cities.add(sp[1])

	line = file.readline()
'''
print(len(pp))
full_combs = set()
for c in cities:
	for j in cities:
		if c != j and ("|".join([c,j]) not in full_combs and "|".join([j,c]) not in full_combs):
			full_combs.add("|".join([c,j]))

print(len(full_combs))
for fc in full_combs:
	if fc not in pp and "|".join([fc.split("|")[1],fc.split("|")[0]]) not in pp:
		print(fc)'''