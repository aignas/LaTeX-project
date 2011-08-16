#!/usr/bin/python2

# Initiate the environment
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.collections as collections

# Initiate the x range and the different functions
x = np.linspace(-4*np.pi,4*np.pi,250)
y1 = np.sin(x)/x
y2 = y1**2

# Plot the 1st graph
fig = plt.figure(frameon=False,figsize=(6,4.5))
fig.figurePatch.set_alpha(0.0)
ax = fig.add_subplot(111)
ax.autoscale(tight=True)
ax.plot(x,y1)
ax.plot(x,y2)
plt.savefig('figs/plot1.eps', bbox_inches='tight')
#plt.savefig('figs/plot1.pdf', bbox_inches='tight')


# vim: tw=80
