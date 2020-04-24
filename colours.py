#!/usr/bin/python

import sys
import seaborn as sns
import matplotlib.pyplot as plt

a=int(sys.argv[1])
b=float(sys.argv[2])
c=float(sys.argv[3])

b=3 * b / 100.0
c=-1 + 2 * c / 100.0

bname=sys.argv[2]
cname=sys.argv[3]
name=sys.argv[1]+'-'+bname+'-'+cname

# create palette
pal = sns.cubehelix_palette(a, start=b, rot=c, light=.95, dark=.2)

# create plot
sns.palplot(pal)

# save figure
plt.title(name)
plt.savefig('%s.pdf' % name, bbox_inches='tight')

# output figure
#plt.show ()

print (pal.as_hex ())
