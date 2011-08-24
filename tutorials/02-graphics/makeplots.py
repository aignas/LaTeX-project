#!/usr/bin/python2

# Set some matplotlib settings:
from matplotlib import rc

font = {'family' : 'serif',
        'weight' : 'medium',
        'size'   : '10.0'}

preamble = {'preamble' : '\usepackage{lmodern'}

rc('font', **font)
rc('text', usetex=True)
#mpl.rc('text.latex', **preamble)

# Initiate the environment
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.collections as collections

# Initiate the x range and the different functions
x = np.linspace(-4*np.pi,4*np.pi,250)
y1 = np.sin(x) - 5*np.exp(-(x-2*np.pi)**2)
y2 = x*np.sin(x)

# Plot the 1st graph
fig = plt.figure(frameon=False,figsize=(5,3.75))
fig.figurePatch.set_alpha(0.0)
ax = fig.add_subplot(111)
ax.autoscale(tight=True)
ax.plot(x,y1)
ax.plot(x,y2)
ax.set_title(r"Native \LaTeX{} with Matplotlib Python Library")
plt.savefig('figs/plot1.eps', bbox_inches='tight')
plt.savefig('figs/plot1.png', bbox_inches='tight')

# vim: tw=80
