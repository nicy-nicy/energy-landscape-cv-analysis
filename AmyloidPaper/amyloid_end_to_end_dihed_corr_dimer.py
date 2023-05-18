#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator)
import matplotlib.ticker as tck
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

nfgailc=np.genfromtxt('dimer_nfgail_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
nagailc=np.genfromtxt('dimer_nagail_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
nlgpvlc=np.genfromtxt('dimer_nlgpvl_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
liagfnc=np.genfromtxt('dimer_liagfn_99idps_cap_endtoend_dihed_full.dat', delimiter=',')

vqivykc=np.genfromtxt('dimer_vqivyk_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
vqivekc=np.genfromtxt('dimer_vqivek_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
naevykc=np.genfromtxt('dimer_naevyk_99idps_cap_endtoend_dihed_full.dat', delimiter=',')


llyytec=np.genfromtxt('dimer_llyyte_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
yyteftc=np.genfromtxt('dimer_yyteft_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
lyqlenc=np.genfromtxt('dimer_lyqlen_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
yqlenyc=np.genfromtxt('dimer_yqleny_99idps_cap_endtoend_dihed_full.dat', delimiter=',')


stviiec=np.genfromtxt('dimer_stviie_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
stviipc=np.genfromtxt('dimer_stviip_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
spviiec=np.genfromtxt('dimer_spviie_99idps_cap_endtoend_dihed_full.dat', delimiter=',')
stvviec=np.genfromtxt('dimer_stvvie_99idps_cap_endtoend_dihed_full.dat', delimiter=',')



dnfgailc={'x':nfgailc[:,0], 'y':nfgailc[:,1], 'dof':297, 'name':'NFGAIL', 'color':'magenta' , 'm':'s', 'p':111}
dnagailc={'x':nagailc[:,0], 'y':nagailc[:,1], 'dof':267, 'name':'NAGAIL', 'color':'k' , 'm':'d','p':113}
dliagfnc={'x':liagfnc[:,0], 'y':liagfnc[:,1], 'dof':297, 'name':'LIAGFN', 'color':'gray' , 'm':'^', 'p':119}
dnlgpvlc={'x':nlgpvlc[:,0], 'y':nlgpvlc[:,1], 'dof':297, 'name':'NLGPVL', 'color':'olive' , 'm':'o', 'p':117}

dvqivykc={'x':vqivykc[:,0], 'y':vqivykc[:,1], 'dof':363, 'name':'VQIVYK', 'color':'magenta' , 'm':'s','p':111}
dvqivekc={'x':vqivekc[:,0], 'y':vqivekc[:,1], 'dof':345, 'name':'VQIVEK', 'color':'k' , 'm':'d','p':113}
dnaevykc={'x':naevykc[:,0], 'y':naevykc[:,1], 'dof':324, 'name':'NAEVYK', 'color':'gray' , 'm':'o','p':117}


dllyytec={'x':llyytec[:,0], 'y':llyytec[:,1], 'dof':357, 'name':'LLYYTE', 'color':'magenta' , 'm':'s','p':111}
dyyteftc={'x':yyteftc[:,0], 'y':yyteftc[:,1], 'dof':345, 'name':'YYTEFT', 'color':'k' , 'm':'o','p':113}
dlyqlenc={'x':lyqlenc[:,0], 'y':lyqlenc[:,1], 'dof':345, 'name':'LYQLEN', 'color':'r' , 'm':'s','p':117}
dyqlenyc={'x':yqlenyc[:,0], 'y':yqlenyc[:,1], 'dof':351, 'name':'YQLENY', 'color':'gray' , 'm':'d','p':126}


dstviiec={'x':stviiec[:,0], 'y':stviiec[:,1], 'dof':312, 'name':'STVIIE', 'color':'magenta' , 'm':'s','p':111}
dstviipc={'x':stviipc[:,0], 'y':stviipc[:,1], 'dof':309, 'name':'STVIIP', 'color':'k' , 'm':'d','p':113}
dstvviec={'x':stvviec[:,0], 'y':stvviec[:,1], 'dof':303, 'name':'STVVIE', 'color':'gray' , 'm':'o','p':117}
dspviiec={'x':spviiec[:,0], 'y':spviiec[:,1], 'dof':312, 'name':'SPVIIE', 'color':'olive' , 'm':'^','p':126}


cm = 1/2.54
mylist=[
        ['nfgail','nagail','liagfn','nlgpvl'],
        ['vqivyk','vqivek','naevyk'],
        ['llyyte','yyteft','lyqlen','yqleny'],
        ['stviie','stviip','spviie','stvvie']
        ]
myplotlist=[(0,0),(0,1),(1,0),(1,1)]
fig, axs = plt.subplots(2, 2, figsize=(4, 4), sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j]+'c')
        axs[myplotlist[i]].scatter(cap['x'], 
                cap['y'], s=66,
                #linestyle='-', 
                color=cap['color'], 
                #marker='s', 
                #markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                #linewidth=2.6,
                label=cap['name'])
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(2))
        axs[myplotlist[i]].yaxis.set_major_locator(MultipleLocator(50))
        #axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        #axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(1))
        axs[myplotlist[i]].yaxis.set_minor_locator(MultipleLocator(25))
        #axs[myplotlist[i]].set_ylim(0.99,1.15)
        #axs[myplotlist[i]].set_xlim(0.0,0.92)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=24)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=26)
fig.supxlabel('End-to-end distance ($\AA$)', fontsize=26)
fig.supylabel('Dihedral angle', fontsize=26)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("dist_dihedamyloiddimer.pdf",dpi=720)
