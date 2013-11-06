#!/usr/bin/python
from sys import argv

if argv[1] == 'gengar':
    f=open("/home/hep/sch11/scripts/ascii/gengar.txt")
    print '\033[1;35m'
    for line in f: print line[:-1]
    print '\033[0m'
elif argv[1] == 'monalisa':
    f=open("/home/hep/sch11/scripts/ascii/monalisa.txt")
    print '\033[1;33m'
    for line in f: print line[:-1]
    print '\033[0m'
elif argv[1] == 'bender':
    f=open("/home/hep/sch11/scripts/ascii/bender.txt")
    print '\033[1;37m'
    for line in f: print line[:-1]
    print '\033[0m'
else: 
    f=open(argv[1])
    for line in f: print line[:-1]
