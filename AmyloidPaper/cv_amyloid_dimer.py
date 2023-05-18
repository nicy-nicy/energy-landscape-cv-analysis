#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator)
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

nfgailc=np.genfromtxt('dimer_nfgail_99idps_cap_cv.dat', delimiter=',')
nagailc=np.genfromtxt('dimer_nagail_99idps_cap_cv.dat', delimiter=',')
nlgpvlc=np.genfromtxt('dimer_nlgpvl_99idps_cap_cv.dat', delimiter=',')
liagfnc=np.genfromtxt('dimer_liagfn_99idps_cap_cv.dat', delimiter=',')
stviiec=np.genfromtxt('dimer_stviie_99idps_cap_cv.dat', delimiter=',')
stviipc=np.genfromtxt('dimer_stviip_99idps_cap_cv.dat', delimiter=',')
stvviec=np.genfromtxt('dimer_stvvie_99idps_cap_cv.dat', delimiter=',')
spviiec=np.genfromtxt('dimer_spviie_99idps_cap_cv.dat', delimiter=',')
vqivykc=np.genfromtxt('dimer_vqivyk_99idps_cap_cv.dat', delimiter=',')
vqivekc=np.genfromtxt('dimer_vqivek_99idps_cap_cv.dat', delimiter=',')
naevykc=np.genfromtxt('dimer_naevyk_99idps_cap_cv.dat', delimiter=',')
lyqlenc=np.genfromtxt('dimer_lyqlen_99idps_cap_cv.dat', delimiter=',')
yqlenyc=np.genfromtxt('dimer_yqleny_99idps_cap_cv.dat', delimiter=',')
llyytec=np.genfromtxt('dimer_llyyte_99idps_cap_cv.dat', delimiter=',')
yyteftc=np.genfromtxt('dimer_yyteft_99idps_cap_cv.dat', delimiter=',')


dnfgailcap={'x':nfgailc[:,0], 'y':nfgailc[:,1], 'dof':600, 'name':'NFGAIL', 'color':'magenta' , 'm':'s', 'p':111}
dnagailcap={'x':nagailc[:,0], 'y':nagailc[:,1], 'dof':540, 'name':'NAGAIL', 'color':'k' , 'm':'d','p':113}
dnlgpvlcap={'x':nlgpvlc[:,0], 'y':nlgpvlc[:,1], 'dof':600, 'name':'NLGPVL', 'color':'gray' , 'm':'^', 'p':119}
dliagfncap={'x':liagfnc[:,0], 'y':liagfnc[:,1], 'dof':600, 'name':'LIAGFN', 'color':'olive' , 'm':'o', 'p':117}

dstviiecap={'x':stviiec[:,0], 'y':stviiec[:,1], 'dof':630, 'name':'STVIIE', 'color':'magenta' , 'm':'s','p':111}
dstviipcap={'x':stviipc[:,0], 'y':stviipc[:,1], 'dof':624, 'name':'STVIIP', 'color':'k' , 'm':'d','p':113}
dstvviecap={'x':stvviec[:,0], 'y':stvviec[:,1], 'dof':612, 'name':'STVVIE', 'color':'gray' , 'm':'o','p':117}
dspviiecap={'x':spviiec[:,0], 'y':spviiec[:,1], 'dof':630, 'name':'SPVIIE', 'color':'olive' , 'm':'^','p':126}

dvqivykcap={'x':vqivykc[:,0], 'y':vqivykc[:,1], 'dof':732, 'name':'VQIVYK', 'color':'magenta' , 'm':'s','p':111}
dvqivekcap={'x':vqivekc[:,0], 'y':vqivekc[:,1], 'dof':696, 'name':'VQIVEK', 'color':'k' , 'm':'d','p':113}
dnaevykcap={'x':naevykc[:,0], 'y':naevykc[:,1], 'dof':654, 'name':'NAEVYK', 'color':'gray' , 'm':'o','p':117}

dllyytecap={'x':llyytec[:,0], 'y':llyytec[:,1], 'dof':720, 'name':'LLYYTE', 'color':'magenta' , 'm':'s','p':111}
dyyteftcap={'x':yyteftc[:,0], 'y':yyteftc[:,1], 'dof':696, 'name':'YYTEFT', 'color':'k' , 'm':'o','p':113}
dlyqlencap={'x':lyqlenc[:,0], 'y':lyqlenc[:,1], 'dof':696, 'name':'LYQLEN', 'color':'r' , 'm':'s','p':117}
dyqlenycap={'x':yqlenyc[:,0], 'y':yqlenyc[:,1], 'dof':708, 'name':'YQLENY', 'color':'gray' , 'm':'d','p':126}


mylist=[['nfgail','nagail','liagfn','nlgpvl'],['vqivyk','vqivek','naevyk'],['stviie','stviip','spviie','stvvie'],
        ['llyyte','yyteft','lyqlen','yqleny']]
myplotlist=[(0,0),(0,1),(1,0),(1,1)]
fig, axs = plt.subplots(2, 2, figsize=(4, 4),sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j]+'cap')
        axs[myplotlist[i]].plot(cap['x'], cap['y']/cap['dof'], color=cap['color'], linestyle='-',
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8, markeredgecolor='black',
                linewidth=2.6,
                label=cap['name'])
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.4))
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.2))
        #axs[myplotlist[i]].set_ylim(0.998,1.11)
        axs[myplotlist[i]].set_xlim(0.0,0.92)
        axs[myplotlist[i]].legend(prop={'size': 22})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=24)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=26)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', fontsize=26)
fig.supylabel('$C_v/(3N-6)$', fontsize=26)
plt.show()
fig.savefig("dimerAmyloidCV.pdf",dpi=720)
