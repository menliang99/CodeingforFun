
def codechange(DAcode):

	return int(194.03 - 0.09715 * DAcode)  # matchin 1V for 100kHz


f = open('out.txt', 'w')
for index in range (515, 1463):
	freqcode = codechange(index)
	print  >> f,  "\t\twhen x" + '"' + "{0:#0{1}x}".format(index, 5)[2:] + '"' + " => dout(11 downto 4) <= x" + '"' + "{0:#0{1}x}".format(freqcode, 4)[2:] + '";'

f.close()

