#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator)
import matplotlib.ticker as tck
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

nfgailc=np.genfromtxt('nfgail_99idps_cap_cv.dat', delimiter=',')
nagailc=np.genfromtxt('nagail_99idps_cap_cv.dat', delimiter=',')
nlgpvlc=np.genfromtxt('nlgpvl_99idps_cap_cv.dat', delimiter=',')
liagfnc=np.genfromtxt('liagfn_99idps_cap_cv.dat', delimiter=',')

vqivykc=np.genfromtxt('vqivyk_99idps_cap_cv.dat', delimiter=',')
vqivekc=np.genfromtxt('vqivek_99idps_cap_cv.dat', delimiter=',')
naevykc=np.genfromtxt('naevyk_99idps_cap_cv.dat', delimiter=',')

klvffac=np.genfromtxt('klvffa_99idps_cap_cv.dat', delimiter=',')
gaiiglc=np.genfromtxt('gaiigl_99idps_cap_cv.dat', delimiter=',')
mvggvvc=np.genfromtxt('mvggvv_99idps_cap_cv.dat', delimiter=',')
ggvviac=np.genfromtxt('ggvvia_99idps_cap_cv.dat', delimiter=',')

llyytec=np.genfromtxt('llyyte_99idps_cap_cv.dat', delimiter=',')
yyteftc=np.genfromtxt('yyteft_99idps_cap_cv.dat', delimiter=',')
lyqlenc=np.genfromtxt('lyqlen_99idps_cap_cv.dat', delimiter=',')
yqlenyc=np.genfromtxt('yqleny_99idps_cap_cv.dat', delimiter=',')

evdllkc=np.genfromtxt('evdllk_99idps_cap_cv.dat', delimiter=',')
lsfskdc=np.genfromtxt('lsfskd_99idps_cap_cv.dat', delimiter=',')
ngeriec=np.genfromtxt('ngerie_99idps_cap_cv.dat', delimiter=',')

stviiec=np.genfromtxt('stviie_99idps_cap_cv.dat', delimiter=',')
stviipc=np.genfromtxt('stviip_99idps_cap_cv.dat', delimiter=',')
spviiec=np.genfromtxt('spviie_99idps_cap_cv.dat', delimiter=',')
stvviec=np.genfromtxt('stvvie_99idps_cap_cv.dat', delimiter=',')

gailssc=np.genfromtxt('gailss_99idps_cap_cv.dat', delimiter=',')
sstnvgc=np.genfromtxt('sstnvg_99idps_cap_cv.dat', delimiter=',')
svsssyc=np.genfromtxt('svsssy_99idps_cap_cv.dat', delimiter=',')
ssqvtqc=np.genfromtxt('ssqvtq_99idps_cap_cv.dat', delimiter=',')

snqnnfc=np.genfromtxt('snqnnf_99idps_cap_cv.dat', delimiter=',')
gyviikc=np.genfromtxt('gyviik_99idps_cap_cv.dat', delimiter=',')
kafiiqc=np.genfromtxt('kafiiq_99idps_cap_cv.dat', delimiter=',')
kailflc=np.genfromtxt('kailfl_99idps_cap_cv.dat', delimiter=',')

dnfgailc={'x':nfgailc[:,0], 'y':nfgailc[:,1], 'dof':297, 'name':'NFGAIL', 'color':'magenta' , 'm':'s', 'p':111}
dnagailc={'x':nagailc[:,0], 'y':nagailc[:,1], 'dof':267, 'name':'NAGAIL', 'color':'k' , 'm':'d','p':113}
dliagfnc={'x':liagfnc[:,0], 'y':liagfnc[:,1], 'dof':297, 'name':'LIAGFN', 'color':'gray' , 'm':'^', 'p':119}
dnlgpvlc={'x':nlgpvlc[:,0], 'y':nlgpvlc[:,1], 'dof':297, 'name':'NLGPVL', 'color':'olive' , 'm':'o', 'p':117}

dvqivykc={'x':vqivykc[:,0], 'y':vqivykc[:,1], 'dof':363, 'name':'VQIVYK', 'color':'magenta' , 'm':'s','p':111}
dvqivekc={'x':vqivekc[:,0], 'y':vqivekc[:,1], 'dof':345, 'name':'VQIVEK', 'color':'k' , 'm':'d','p':113}
dnaevykc={'x':naevykc[:,0], 'y':naevykc[:,1], 'dof':324, 'name':'NAEVYK', 'color':'gray' , 'm':'o','p':117}

dklvffac={'x':klvffac[:,0], 'y':klvffac[:,1], 'dof':351, 'name':'KLVFFA', 'color':'b', 'm':'s', 'p':111}
dgaiiglc={'x':gaiiglc[:,0], 'y':gaiiglc[:,1], 'dof':273, 'name':'GAIIGL', 'color':'r', 'm':'^', 'p':113}
dmvggvvc={'x':mvggvvc[:,0], 'y':mvggvvc[:,1], 'dof':267, 'name':'MVGGVV', 'color':'orange', 'm':'D', 'p':117}
dggvviac={'x':ggvviac[:,0], 'y':ggvviac[:,1], 'dof':255, 'name':'GGVVIA', 'color':'magenta', 'm':'o', 'p':126}

dllyytec={'x':llyytec[:,0], 'y':llyytec[:,1], 'dof':357, 'name':'LLYYTE', 'color':'magenta' , 'm':'s','p':111}
dyyteftc={'x':yyteftc[:,0], 'y':yyteftc[:,1], 'dof':345, 'name':'YYTEFT', 'color':'k' , 'm':'o','p':113}
dlyqlenc={'x':lyqlenc[:,0], 'y':lyqlenc[:,1], 'dof':345, 'name':'LYQLEN', 'color':'r' , 'm':'s','p':117}
dyqlenyc={'x':yqlenyc[:,0], 'y':yqlenyc[:,1], 'dof':351, 'name':'YQLENY', 'color':'gray' , 'm':'d','p':126}

devdllkc={'x':evdllkc[:,0], 'y':evdllkc[:,1], 'dof':339, 'name':'EVDLLK', 'color':'k' , 'm':'d','p':111}
dlsfskdc={'x':lsfskdc[:,0], 'y':lsfskdc[:,1], 'dof':315, 'name':'LSFSKD', 'color':'gray' , 'm':'d','p':113}
dngeriec={'x':ngeriec[:,0], 'y':ngeriec[:,1], 'dof':312, 'name':'NGERIE', 'color':'olive' , 'm':'d','p':117}

dstviiec={'x':stviiec[:,0], 'y':stviiec[:,1], 'dof':312, 'name':'STVIIE', 'color':'magenta' , 'm':'s','p':111}
dstviipc={'x':stviipc[:,0], 'y':stviipc[:,1], 'dof':309, 'name':'STVIIP', 'color':'k' , 'm':'d','p':113}
dstvviec={'x':stvviec[:,0], 'y':stvviec[:,1], 'dof':303, 'name':'STVVIE', 'color':'gray' , 'm':'o','p':117}
dspviiec={'x':spviiec[:,0], 'y':spviiec[:,1], 'dof':312, 'name':'SPVIIE', 'color':'olive' , 'm':'^','p':126}

dgailssc={'x':gailssc[:,0], 'y':gailssc[:,1], 'dof':261, 'name':'GAILSS', 'color':'magenta', 'm':'X', 'p':111}
dsstnvgc={'x':sstnvgc[:,0], 'y':sstnvgc[:,1], 'dof':249, 'name':'SSTNVG', 'color':'orange', 'm':'h', 'p':113}
dsvsssyc={'x':svsssyc[:,0], 'y':svsssyc[:,1], 'dof':273, 'name':'SVSSSY', 'color':'r', 'm':'v', 'p':117}
dssqvtqc={'x':ssqvtqc[:,0], 'y':ssqvtqc[:,1], 'dof':288, 'name':'SSQVTQ', 'color':'c', 'm':'P', 'p':126}

dsnqnnfc={'x':snqnnfc[:,0], 'y':snqnnfc[:,1], 'dof':300, 'name':'SNQNNF', 'color':'purple', 'm':'d', 'p':111}
dgyviikc={'x':gyviikc[:,0], 'y':gyviikc[:,1], 'dof':342, 'name':'GYVIIK', 'color':'green', 'm':'<', 'p':113}
dkafiiqc={'x':kafiiqc[:,0], 'y':kafiiqc[:,1], 'dof':351, 'name':'KAFIIQ', 'color':'b', 'm':'<', 'p':117}
dkailflc={'x':kailflc[:,0], 'y':kailflc[:,1], 'dof':357, 'name':'KAILFL', 'color':'k', 'm':'<', 'p':126}

cm = 1/2.54
mylist=[
        ['nfgail','nagail','liagfn','nlgpvl'],
        ['vqivyk','vqivek','naevyk'],
        ['klvffa','gaiigl','mvggvv','ggvvia'],
        ['llyyte','yyteft','lyqlen','yqleny'],
        ['evdllk','lsfskd','ngerie'],
        ['stviie','stviip','spviie','stvvie'],
        ['gailss','sstnvg','svsssy','ssqvtq'],
        ['snqnnf','gyviik','kafiiq','kailfl'],
        ]
myplotlist=[(0,0),(0,1),(0,2),(0,3),(1,0),(1,1),(1,2),(1,3)]
fig, axs = plt.subplots(2, 4, figsize=(4, 4), sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j]+'c')
        axs[myplotlist[i]].plot(cap['x'], cap['y']/cap['dof'],
                linestyle='-', color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.4))
        #axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.2))
        #axs[myplotlist[i]].set_ylim(0.99,1.15)
        axs[myplotlist[i]].set_xlim(0.0,0.92)
        axs[myplotlist[i]].legend(prop={'size': 22})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=24)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=26)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', fontsize=26)
fig.supylabel('$C_v/(3N-6)$', fontsize=26)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("FINALCVamyloid.pdf",dpi=720)
