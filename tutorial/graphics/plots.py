#!/usr/bin/python2

# Initiate the environment
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.collections as collections

# Initiate the x range and the different functions
x = np.arange(0,8,.01)
y1 = x*2 +1
y2 = np.sin(x)
y3 = np.sqrt(x)
y4 = np.e**(-x**2)

# Plot the 1st graph
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(x,y1)
plt.savefig('figs/plot1.eps')

# Plot the 2nd graph
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(x,y2)
plt.savefig('figs/plot2.eps')

# Plot the 3rd graph
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(x,y2)
ax.plot(x,y3)
plt.savefig('figs/plot3.eps')

# Plot the 4th graph
fig = plt.figure()
ax = fig.add_subplot(111)
ax.plot(x,y2)
ax.plot(x,y3)
ax.plot(x,y4)
plt.savefig('figs/plot4.eps')

# vim: tw=80
