
def codechange(ADcode):
	if ADcode <= 35:
		return 704
	elif ADcode <= 47:
		return int(704 - 43.33*(ADcode - 35))
	elif ADcode <= 71:
		return int(184-3.833*(ADcode - 47))
	else:
		return 92

f = open('out.txt', 'w')
for index in range (1, 256):
	freqcode = codechange(index)
	print  >> f, "\t\twhen x" + '"' + "{0:#0{1}x}".format(index, 4)[2:] + '"' + " => dout12bit <= x" + '"' + "{0:#0{1}x}".format(freqcode, 5)[2:] + '";'

f.close()

