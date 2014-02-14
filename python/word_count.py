import sys
try:
    file = open(sys.argv[1], 'r')
except:
    print "error file not found"
    sys.exit()
text = file.read()
word_list = text.split()
archive = {}
count = 0
for word in word_list:
    if not word in archive:
        archive[word] = 1;
        count+=1
    else:
        archive[word]+=1
for key in archive.keys():
    print str(key)+" "+str(archive[key])

