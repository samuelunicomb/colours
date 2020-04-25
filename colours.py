#!/usr/bin/python

import sys
import seaborn as sns
import matplotlib.pyplot as plt

a=int(sys.argv[1])
b=float(sys.argv[2])
c=float(sys.argv[3])

b=3 * b / 100.0
c=-1 + 2 * c / 100.0

# filename
name=sys.argv[1]+'-'+sys.argv[2]+'-'+sys.argv[3]

# create palette
pal = sns.cubehelix_palette(a, start=b, rot=c, light=.95, dark=.2)

# create plot
sns.palplot(pal)

# save figure, comment out if necessary
plt.title(name)
plt.savefig('%s.pdf' % name, bbox_inches='tight')

# output figure, comment out if necessary
#plt.show ()

print (pal.as_hex ())
