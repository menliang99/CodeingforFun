
def codechange(ADcode):
	if ADcode <= 48:
		return 76667 / 135
	elif ADcode <= 76:
		return int(76667 / (167.57 - 19 * ADcode / 28) )
	elif ADcode <= 95:
		return int(76667 / (160 - 11 * ADcode / 19) )
	elif ADcode <= 108:
		return int(76667 / (178.08 - 10 * ADcode / 13) )
	elif ADcode <= 152:
		return int(76667 / (144.1 -  5 * ADcode / 11) )
	else:
		return 76667 / 75

f = open('out.txt', 'w')
for index in range (0, 256):
	freqcode = codechange(index)
	print  >> f, "\t\twhen x" + '"' + "{0:#0{1}x}".format(index, 4)[2:] + '"' + " => dout12bit <= x" + '"' + "{0:#0{1}x}".format(freqcode, 5)[2:] + '";'

f.close()

