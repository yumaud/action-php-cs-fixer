import sys
import re

flg = False
for line in sys.stdin:
    if re.search('---------- begin diff ----------', line):
        flg = True
        continue
    elif re.search('----------- end diff -----------', line):
        flg = False

    if flg:
        sys.stdout.write(line)
        continue
