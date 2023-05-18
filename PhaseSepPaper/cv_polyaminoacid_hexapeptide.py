#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator)
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

g=np.genfromtxt('gggggg_99idps_nocap_cv.dat', delimiter=',')
gc=np.genfromtxt('gggggg_99idps_cap_cv.dat', delimiter=',')
a=np.genfromtxt('aaaaaa_99idps_nocap_cv.dat', delimiter=',')
ac=np.genfromtxt('aaaaaa_99idps_cap_cv.dat', delimiter=',')
v=np.genfromtxt('vvvvvv_99idps_nocap_cv.dat', delimiter=',')
vc=np.genfromtxt('vvvvvv_99idps_cap_cv.dat', delimiter=',')
r=np.genfromtxt('rrrrrr_99idps_nocap_cv.dat', delimiter=',')
rc=np.genfromtxt('rrrrrr_99idps_cap_cv.dat', delimiter=',')
k=np.genfromtxt('kkkkkk_99idps_nocap_cv.dat', delimiter=',')
kc=np.genfromtxt('kkkkkk_99idps_cap_cv.dat', delimiter=',')
e=np.genfromtxt('eeeeee_99idps_nocap_cv.dat', delimiter=',')
ec=np.genfromtxt('eeeeee_99idps_cap_cv.dat', delimiter=',')
dgc = {'x':gc[:,0], 'y':gc[:,1], 'dof':156, 'name':'GGGGGG', 'style':'-', 'color':'k', 'm':'o', 'p':71}
dac = {'x':ac[:,0], 'y':ac[:,1], 'dof':210, 'name':'AAAAAA', 'style':'-', 'color':'r', 'm':'v', 'p':79}
dvc = {'x':vc[:,0], 'y':vc[:,1], 'dof':318, 'name':'VVVVVV', 'style':'-', 'color':'b', 'm':'s', 'p':89}
drc = {'x':rc[:,0], 'y':rc[:,1], 'dof':462, 'name':'RRRRRR', 'style':'-', 'color':'c', 'm':'D', 'p':71}
dkc = {'x':kc[:,0], 'y':kc[:,1], 'dof':426, 'name':'KKKKKK', 'style':'-', 'color':'m', 'm':'P', 'p':79}
dec = {'x':ec[:,0], 'y':ec[:,1], 'dof':300, 'name':'EEEEEE', 'style':'-', 'color':'y', 'm':'x', 'p':89}
dgn = {'x':g[:,0], 'y':g[:,1], 'dof':129, 'name':'GGGGGGn', 'style':'-', 'color':'k', 'm':'o', 'p':71}
dan = {'x':a[:,0], 'y':a[:,1], 'dof':183, 'name':'AAAAAAn', 'style':'-', 'color':'r', 'm':'v', 'p':79}
dvn = {'x':v[:,0], 'y':v[:,1], 'dof':291, 'name':'VVVVVVn', 'style':'-', 'color':'b', 'm':'s', 'p':89}
drn = {'x':r[:,0], 'y':r[:,1], 'dof':435, 'name':'RRRRRRn', 'style':'-', 'color':'c', 'm':'D', 'p':71}
dkn = {'x':k[:,0], 'y':k[:,1], 'dof':399, 'name':'KKKKKKn', 'style':'-', 'color':'m', 'm':'P', 'p':79}
den = {'x':e[:,0], 'y':e[:,1], 'dof':273, 'name':'EEEEEEn', 'style':'-', 'color':'y', 'm':'x', 'p':89}
cm = 1/2.54
mylist=[['gc','ac','vc'],['ec','rc','kc'],['gn','an','vn'],['en','rn','kn']]
myplotlist=[(0,0),(0,1),(1,0),(1,1)]
fig, axs = plt.subplots(2, 2, figsize=(18*cm, 15*cm), sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j])
        axs[myplotlist[i]].plot(cap['x'], cap['y']/cap['dof'],
                linestyle=cap['style'], color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.2))
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.05))
        axs[myplotlist[i]].set_ylim(0.99,1.206)
        axs[myplotlist[i]].set_xlim(0.0,0.92)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=14)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=14)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', y=0.04, fontsize=18)
fig.supylabel('$C_v/(3N-6)$',x=0.04, fontsize=18)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("PAAcv.pdf",dpi=720)
