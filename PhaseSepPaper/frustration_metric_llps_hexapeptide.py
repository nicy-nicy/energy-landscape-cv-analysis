#!/usr/bin/python

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import (MultipleLocator)
import matplotlib.ticker as tck
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

f2gfc=np.genfromtxt('gfggfg_99idps_cap_frustrationindex.dat', delimiter=',')
y2gyc=np.genfromtxt('gyggyg_99idps_cap_frustrationindex.dat', delimiter=',')
f2gyc=np.genfromtxt('gfggyg_99idps_cap_frustrationindex.dat', delimiter=',')
y2gfc=np.genfromtxt('gyggfg_99idps_cap_frustrationindex.dat', delimiter=',')
r2gyc=np.genfromtxt('grggyg_99idps_cap_frustrationindex.dat', delimiter=',')
y2grc=np.genfromtxt('gyggrg_99idps_cap_frustrationindex.dat', delimiter=',')
k2gyc=np.genfromtxt('gkggyg_99idps_cap_frustrationindex.dat', delimiter=',')
y2gkc=np.genfromtxt('gyggkg_99idps_cap_frustrationindex.dat', delimiter=',')
r2gfc=np.genfromtxt('grggfg_99idps_cap_frustrationindex.dat', delimiter=',')
f2grc=np.genfromtxt('gfggrg_99idps_cap_frustrationindex.dat', delimiter=',')
k2gfc=np.genfromtxt('gkggfg_99idps_cap_frustrationindex.dat', delimiter=',')
f2gkc=np.genfromtxt('gfggkg_99idps_cap_frustrationindex.dat', delimiter=',')
df2gfcap = {'x':f2gfc[:,0], 'y':f2gfc[:,1], 'dof':234, 'name':'GFGGFG', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dy2gycap = {'x':y2gyc[:,0], 'y':y2gyc[:,1], 'dof':240, 'name':'GYGGYG', 'style':'-', 'color':'c', 'm':'D', 'p':11}
df2gycap = {'x':f2gyc[:,0], 'y':f2gyc[:,1], 'dof':237, 'name':'GFGGYG', 'style':'-', 'color':'gray', 'm':'X', 'p':13}
dy2gfcap = {'x':y2gfc[:,0], 'y':y2gfc[:,1], 'dof':237, 'name':'GYGGFG', 'style':'-', 'color':'magenta', 'm':'p', 'p':19}
dr2gycap = {'x':r2gyc[:,0], 'y':r2gyc[:,1], 'dof':249, 'name':'GRGGYG', 'style':'-', 'color':'k', 'm':'o', 'p':17}
dk2gycap = {'x':k2gyc[:,0], 'y':k2gyc[:,1], 'dof':243, 'name':'GKGGYG', 'style':'-', 'color':'b', 'm':'s', 'p':11}
dy2grcap = {'x':y2grc[:,0], 'y':y2grc[:,1], 'dof':249, 'name':'GYGGRG', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dy2gkcap = {'x':y2gkc[:,0], 'y':y2gkc[:,1], 'dof':243, 'name':'GYGGKG', 'style':'-', 'color':'green', 'm':'<', 'p':19}
dr2gfcap = {'x':r2gfc[:,0], 'y':r2gfc[:,1], 'dof':246, 'name':'GRGGFG', 'style':'-', 'color':'orange', 'm':'X', 'p':17}
dk2gfcap = {'x':k2gfc[:,0], 'y':k2gfc[:,1], 'dof':240, 'name':'GKGGFG', 'style':'-', 'color':'magenta', 'm':'d', 'p':11}
df2grcap = {'x':f2grc[:,0], 'y':f2grc[:,1], 'dof':246, 'name':'GFGGRG', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
df2gkcap = {'x':f2gkc[:,0], 'y':f2gkc[:,1], 'dof':240, 'name':'GFGGKG', 'style':'-', 'color':'green', 'm':'<', 'p':19}
f4gfc=np.genfromtxt('fggggf_99idps_cap_frustrationindex.dat', delimiter=',')
y4gyc=np.genfromtxt('yggggy_99idps_cap_frustrationindex.dat', delimiter=',')
f4gyc=np.genfromtxt('fggggy_99idps_cap_frustrationindex.dat', delimiter=',')
y4gfc=np.genfromtxt('yggggf_99idps_cap_frustrationindex.dat', delimiter=',')
r4gyc=np.genfromtxt('rggggy_99idps_cap_frustrationindex.dat', delimiter=',')
y4grc=np.genfromtxt('yggggr_99idps_cap_frustrationindex.dat', delimiter=',')
k4gyc=np.genfromtxt('kggggy_99idps_cap_frustrationindex.dat', delimiter=',')
y4gkc=np.genfromtxt('yggggk_99idps_cap_frustrationindex.dat', delimiter=',')
r4gfc=np.genfromtxt('rggggf_99idps_cap_frustrationindex.dat', delimiter=',')
f4grc=np.genfromtxt('fggggr_99idps_cap_frustrationindex.dat', delimiter=',')
k4gfc=np.genfromtxt('kggggf_99idps_cap_frustrationindex.dat', delimiter=',')
f4gkc=np.genfromtxt('fggggk_99idps_cap_frustrationindex.dat', delimiter=',')
df4gfcap = {'x':f4gfc[:,0], 'y':f4gfc[:,1], 'dof':234, 'name':'FGGGGF', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dy4gycap = {'x':y4gyc[:,0], 'y':y4gyc[:,1], 'dof':240, 'name':'YGGGGY', 'style':'-', 'color':'c', 'm':'D', 'p':11}
df4gycap = {'x':f4gyc[:,0], 'y':f4gyc[:,1], 'dof':237, 'name':'FGGGGY', 'style':'-', 'color':'gray', 'm':'X', 'p':13}
dy4gfcap = {'x':y4gfc[:,0], 'y':y4gfc[:,1], 'dof':237, 'name':'YGGGGF', 'style':'-', 'color':'magenta', 'm':'p', 'p':19}
dr4gycap = {'x':r4gyc[:,0], 'y':r4gyc[:,1], 'dof':249, 'name':'RGGGGY', 'style':'-', 'color':'k', 'm':'o', 'p':17}
dk4gycap = {'x':k4gyc[:,0], 'y':k4gyc[:,1], 'dof':243, 'name':'KGGGGY', 'style':'-', 'color':'b', 'm':'s', 'p':11}
dy4grcap = {'x':y4grc[:,0], 'y':y4grc[:,1], 'dof':249, 'name':'YGGGGR', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dy4gkcap = {'x':y4gkc[:,0], 'y':y4gkc[:,1], 'dof':243, 'name':'YGGGGK', 'style':'-', 'color':'green', 'm':'<', 'p':19}
dr4gfcap = {'x':r4gfc[:,0], 'y':r4gfc[:,1], 'dof':246, 'name':'RGGGGF', 'style':'-', 'color':'orange', 'm':'X', 'p':17}
dk4gfcap = {'x':k4gfc[:,0], 'y':k4gfc[:,1], 'dof':240, 'name':'KGGGGF', 'style':'-', 'color':'magenta', 'm':'d', 'p':11}
df4grcap = {'x':f4grc[:,0], 'y':f4grc[:,1], 'dof':246, 'name':'FGGGGR', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
df4gkcap = {'x':f4gkc[:,0], 'y':f4gkc[:,1], 'dof':240, 'name':'FGGGGK', 'style':'-', 'color':'green', 'm':'<', 'p':19}
ff=np.genfromtxt('ffggff_99idps_nocap_frustrationindex.dat', delimiter=',')
ffc=np.genfromtxt('ffggff_99idps_cap_frustrationindex.dat', delimiter=',')
yy=np.genfromtxt('yyggyy_99idps_nocap_frustrationindex.dat', delimiter=',')
yyc=np.genfromtxt('yyggyy_99idps_cap_frustrationindex.dat', delimiter=',')
lf=np.genfromtxt('lfggfl_99idps_nocap_frustrationindex.dat', delimiter=',')
lfc=np.genfromtxt('lfggfl_99idps_cap_frustrationindex.dat', delimiter=',')
fl=np.genfromtxt('flgglf_99idps_nocap_frustrationindex.dat', delimiter=',')
flc=np.genfromtxt('flgglf_99idps_cap_frustrationindex.dat', delimiter=',')
ry=np.genfromtxt('ryggyr_99idps_nocap_frustrationindex.dat', delimiter=',')
ryc=np.genfromtxt('ryggyr_99idps_cap_frustrationindex.dat', delimiter=',')
yr=np.genfromtxt('yrggry_99idps_nocap_frustrationindex.dat', delimiter=',')
yrc=np.genfromtxt('yrggry_99idps_cap_frustrationindex.dat', delimiter=',')
ky=np.genfromtxt('kyggyk_99idps_nocap_frustrationindex.dat', delimiter=',')
kyc=np.genfromtxt('kyggyk_99idps_cap_frustrationindex.dat', delimiter=',')
yk=np.genfromtxt('ykggky_99idps_nocap_frustrationindex.dat', delimiter=',')
ykc=np.genfromtxt('ykggky_99idps_cap_frustrationindex.dat', delimiter=',')
re=np.genfromtxt('regger_99idps_nocap_frustrationindex.dat', delimiter=',')
rec=np.genfromtxt('regger_99idps_cap_frustrationindex.dat', delimiter=',')
ke=np.genfromtxt('keggek_99idps_nocap_frustrationindex.dat', delimiter=',')
kec=np.genfromtxt('keggek_99idps_cap_frustrationindex.dat', delimiter=',')
aa=np.genfromtxt('aaggaa_99idps_nocap_frustrationindex.dat', delimiter=',')
aac=np.genfromtxt('aaggaa_99idps_cap_frustrationindex.dat', delimiter=',')
ll=np.genfromtxt('llggll_99idps_nocap_frustrationindex.dat', delimiter=',')
llc=np.genfromtxt('llggll_99idps_cap_frustrationindex.dat', delimiter=',')
dffc = {'x':ffc[:,0], 'y':ffc[:,1], 'dof':312, 'name':'FFGGFF', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dyyc = {'x':yyc[:,0], 'y':yyc[:,1], 'dof':324, 'name':'YYGGYY', 'style':'-', 'color':'c', 'm':'D', 'p':11}
dlfc = {'x':lfc[:,0], 'y':lfc[:,1], 'dof':306, 'name':'LFGGFL', 'style':'-', 'color':'m', 'm':'h', 'p':13}
dflc = {'x':flc[:,0], 'y':flc[:,1], 'dof':306, 'name':'FLGGLF', 'style':'-', 'color':'purple', 'm':'H', 'p':19}
dryc = {'x':ryc[:,0], 'y':ryc[:,1], 'dof':342, 'name':'RYGGYR', 'style':'-', 'color':'k', 'm':'o', 'p':17}
dkyc = {'x':kyc[:,0], 'y':kyc[:,1], 'dof':330, 'name':'KYGGYK', 'style':'-', 'color':'b', 'm':'s', 'p':11}
dyrc = {'x':yrc[:,0], 'y':yrc[:,1], 'dof':342, 'name':'YRGGRY', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dykc = {'x':ykc[:,0], 'y':ykc[:,1], 'dof':330, 'name':'YKGGKY', 'style':'-', 'color':'green', 'm':'<', 'p':19}
drec = {'x':rec[:,0], 'y':rec[:,1], 'dof':306, 'name':'REGGER', 'style':'-', 'color':'brown', 'm':'P', 'p':17}
dkec = {'x':kec[:,0], 'y':kec[:,1], 'dof':294, 'name':'KEGGEK', 'style':'-', 'color':'olive', 'm':'*', 'p':11}
dllc = {'x':llc[:,0], 'y':llc[:,1], 'dof':300, 'name':'LLGGLL', 'style':'-', 'color':'m', 'm':'8', 'p':13}
daac = {'x':aac[:,0], 'y':aac[:,1], 'dof':192, 'name':'AAGGAA', 'style':'-', 'color':'gray', 'm':'v', 'p':19}
dffn = {'x':ff[:,0], 'y':ff[:,1], 'dof':285, 'name':'FFGGFFn', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dyyn = {'x':yy[:,0], 'y':yy[:,1], 'dof':297, 'name':'YYGGYYn', 'style':'-', 'color':'c', 'm':'D', 'p':11}
dlfn = {'x':lf[:,0], 'y':lf[:,1], 'dof':279, 'name':'LFGGFLn', 'style':'-', 'color':'m', 'm':'h', 'p':13}
dfln = {'x':fl[:,0], 'y':fl[:,1], 'dof':279, 'name':'FLGGLFn', 'style':'-', 'color':'purple', 'm':'H', 'p':19}
dryn = {'x':ry[:,0], 'y':ry[:,1], 'dof':315, 'name':'RYGGYRn', 'style':'-', 'color':'k', 'm':'o', 'p':17}     
dkyn = {'x':ky[:,0], 'y':ky[:,1], 'dof':303, 'name':'KYGGYKn', 'style':'-', 'color':'b', 'm':'s', 'p':11}     
dyrn = {'x':yr[:,0], 'y':yr[:,1], 'dof':315, 'name':'YRGGRYn', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dykn = {'x':yk[:,0], 'y':yk[:,1], 'dof':303, 'name':'YKGGKYn', 'style':'-', 'color':'green', 'm':'<', 'p':19}
dren = {'x':re[:,0], 'y':re[:,1], 'dof':279, 'name':'REGGERn', 'style':'-', 'color':'brown', 'm':'P', 'p':17}
dken = {'x':ke[:,0], 'y':ke[:,1], 'dof':267, 'name':'KEGGEKn', 'style':'-', 'color':'olive', 'm':'*', 'p':11}
dlln = {'x':ll[:,0], 'y':ll[:,1], 'dof':273, 'name':'LLGGLLn', 'style':'-', 'color':'m', 'm':'8', 'p':13}
daan = {'x':aa[:,0], 'y':aa[:,1], 'dof':165, 'name':'AAGGAAn', 'style':'-', 'color':'gray', 'm':'v', 'p':19}

zff=np.genfromtxt('ffggff_19sb_nocap_frustrationindex.dat', delimiter=',')
zffc=np.genfromtxt('ffggff_19sb_cap_frustrationindex.dat', delimiter=',')
zyy=np.genfromtxt('yyggyy_19sb_nocap_frustrationindex.dat', delimiter=',')
zyyc=np.genfromtxt('yyggyy_19sb_cap_frustrationindex.dat', delimiter=',')
zlf=np.genfromtxt('lfggfl_19sb_nocap_frustrationindex.dat', delimiter=',')
zlfc=np.genfromtxt('lfggfl_19sb_cap_frustrationindex.dat', delimiter=',')
zfl=np.genfromtxt('flgglf_19sb_nocap_frustrationindex.dat', delimiter=',')
zflc=np.genfromtxt('flgglf_19sb_cap_frustrationindex.dat', delimiter=',')
zry=np.genfromtxt('ryggyr_19sb_nocap_frustrationindex.dat', delimiter=',')
zryc=np.genfromtxt('ryggyr_19sb_cap_frustrationindex.dat', delimiter=',')
zyr=np.genfromtxt('yrggry_19sb_nocap_frustrationindex.dat', delimiter=',')
zyrc=np.genfromtxt('yrggry_19sb_cap_frustrationindex.dat', delimiter=',')
zky=np.genfromtxt('kyggyk_19sb_nocap_frustrationindex.dat', delimiter=',')
zkyc=np.genfromtxt('kyggyk_19sb_cap_frustrationindex.dat', delimiter=',')
zyk=np.genfromtxt('ykggky_19sb_nocap_frustrationindex.dat', delimiter=',')
zykc=np.genfromtxt('ykggky_19sb_cap_frustrationindex.dat', delimiter=',')
zre=np.genfromtxt('regger_19sb_nocap_frustrationindex.dat', delimiter=',')
zrec=np.genfromtxt('regger_19sb_cap_frustrationindex.dat', delimiter=',')
zke=np.genfromtxt('keggek_19sb_nocap_frustrationindex.dat', delimiter=',')
zkec=np.genfromtxt('keggek_19sb_cap_frustrationindex.dat', delimiter=',')
zaa=np.genfromtxt('aaggaa_19sb_nocap_frustrationindex.dat', delimiter=',')
zaac=np.genfromtxt('aaggaa_19sb_cap_frustrationindex.dat', delimiter=',')
zll=np.genfromtxt('llggll_19sb_nocap_frustrationindex.dat', delimiter=',')
zllc=np.genfromtxt('llggll_19sb_cap_frustrationindex.dat', delimiter=',')
dzffc = {'x':zffc[:,0], 'y':zffc[:,1], 'dof':312, 'name':'FFGGFF', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dzyyc = {'x':zyyc[:,0], 'y':zyyc[:,1], 'dof':324, 'name':'YYGGYY', 'style':'-', 'color':'c', 'm':'D', 'p':11}
dzlfc = {'x':zlfc[:,0], 'y':zlfc[:,1], 'dof':306, 'name':'LFGGFL', 'style':'-', 'color':'m', 'm':'h', 'p':13}
dzflc = {'x':zflc[:,0], 'y':zflc[:,1], 'dof':306, 'name':'FLGGLF', 'style':'-', 'color':'purple', 'm':'H', 'p':19}
dzryc = {'x':zryc[:,0], 'y':zryc[:,1], 'dof':342, 'name':'RYGGYR', 'style':'-', 'color':'k', 'm':'o', 'p':17}
dzkyc = {'x':zkyc[:,0], 'y':zkyc[:,1], 'dof':330, 'name':'KYGGYK', 'style':'-', 'color':'b', 'm':'s', 'p':11}
dzyrc = {'x':zyrc[:,0], 'y':zyrc[:,1], 'dof':342, 'name':'YRGGRY', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dzykc = {'x':zykc[:,0], 'y':zykc[:,1], 'dof':330, 'name':'YKGGKY', 'style':'-', 'color':'green', 'm':'<', 'p':19}
dzrec = {'x':zrec[:,0], 'y':zrec[:,1], 'dof':306, 'name':'REGGER', 'style':'-', 'color':'brown', 'm':'P', 'p':17}
dzkec = {'x':zkec[:,0], 'y':zkec[:,1], 'dof':294, 'name':'KEGGEK', 'style':'-', 'color':'olive', 'm':'*', 'p':11}
dzllc = {'x':zllc[:,0], 'y':zllc[:,1], 'dof':300, 'name':'LLGGLL', 'style':'-', 'color':'m', 'm':'8', 'p':13}
dzaac = {'x':zaac[:,0], 'y':zaac[:,1], 'dof':192, 'name':'AAGGAA', 'style':'-', 'color':'gray', 'm':'v', 'p':19}
dzffn = {'x':zff[:,0], 'y':zff[:,1], 'dof':285, 'name':'FFGGFFn', 'style':'-', 'color':'r', 'm':'^', 'p':17}
dzyyn = {'x':zyy[:,0], 'y':zyy[:,1], 'dof':297, 'name':'YYGGYYn', 'style':'-', 'color':'c', 'm':'D', 'p':11}
dzlfn = {'x':zlf[:,0], 'y':zlf[:,1], 'dof':279, 'name':'LFGGFLn', 'style':'-', 'color':'m', 'm':'h', 'p':13}
dzfln = {'x':zfl[:,0], 'y':zfl[:,1], 'dof':279, 'name':'FLGGLFn', 'style':'-', 'color':'purple', 'm':'H', 'p':19}
dzryn = {'x':zry[:,0], 'y':zry[:,1], 'dof':315, 'name':'RYGGYRn', 'style':'-', 'color':'k', 'm':'o', 'p':17}     
dzkyn = {'x':zky[:,0], 'y':zky[:,1], 'dof':303, 'name':'KYGGYKn', 'style':'-', 'color':'b', 'm':'s', 'p':11}     
dzyrn = {'x':zyr[:,0], 'y':zyr[:,1], 'dof':315, 'name':'YRGGRYn', 'style':'-', 'color':'orange', 'm':'d', 'p':13}
dzykn = {'x':zyk[:,0], 'y':zyk[:,1], 'dof':303, 'name':'YKGGKYn', 'style':'-', 'color':'green', 'm':'<', 'p':19}
dzren = {'x':zre[:,0], 'y':zre[:,1], 'dof':279, 'name':'REGGERn', 'style':'-', 'color':'brown', 'm':'P', 'p':17}
dzken = {'x':zke[:,0], 'y':zke[:,1], 'dof':267, 'name':'KEGGEKn', 'style':'-', 'color':'olive', 'm':'*', 'p':11}
dzlln = {'x':zll[:,0], 'y':zll[:,1], 'dof':273, 'name':'LLGGLLn', 'style':'-', 'color':'m', 'm':'8', 'p':13}
dzaan = {'x':zaa[:,0], 'y':zaa[:,1], 'dof':165, 'name':'AAGGAAn', 'style':'-', 'color':'gray', 'm':'v', 'p':19}
#g=np.genfromtxt('gggggg_99idps_nocap_frustrationindex.dat', delimiter=',')
#gc=np.genfromtxt('gggggg_99idps_cap_frustrationindex.dat', delimiter=',')
#a=np.genfromtxt('aaaaaa_99idps_nocap_frustrationindex.dat', delimiter=',')
#ac=np.genfromtxt('aaaaaa_99idps_cap_frustrationindex.dat', delimiter=',')
#v=np.genfromtxt('vvvvvv_99idps_nocap_frustrationindex.dat', delimiter=',')
#vc=np.genfromtxt('vvvvvv_99idps_cap_frustrationindex.dat', delimiter=',')
#r=np.genfromtxt('rrrrrr_99idps_nocap_frustrationindex.dat', delimiter=',')
#rc=np.genfromtxt('rrrrrr_99idps_cap_frustrationindex.dat', delimiter=',')
#k=np.genfromtxt('kkkkkk_99idps_nocap_frustrationindex.dat', delimiter=',')
#kc=np.genfromtxt('kkkkkk_99idps_cap_frustrationindex.dat', delimiter=',')
#e=np.genfromtxt('eeeeee_99idps_nocap_frustrationindex.dat', delimiter=',')
#ec=np.genfromtxt('eeeeee_99idps_cap_frustrationindex.dat', delimiter=',')
#dgc = {'x':gc[:,0], 'y':gc[:,1], 'dof':156, 'name':'Gc', 'style':'-', 'color':'olive', 'm':'*', 'p':100}
#dac = {'x':ac[:,0], 'y':ac[:,1], 'dof':210, 'name':'Ac', 'style':'-', 'color':'r', 'm':'v', 'p':100}
#dvc = {'x':vc[:,0], 'y':vc[:,1], 'dof':318, 'name':'Vc', 'style':'-', 'color':'b', 'm':'s', 'p':100}
#drc = {'x':rc[:,0], 'y':rc[:,1], 'dof':462, 'name':'Rc', 'style':'-', 'color':'c', 'm':'D', 'p':100}
#dkc = {'x':kc[:,0], 'y':kc[:,1], 'dof':426, 'name':'Kc', 'style':'-', 'color':'m', 'm':'P', 'p':100}
#dec = {'x':ec[:,0], 'y':ec[:,1], 'dof':300, 'name':'Ec', 'style':'-', 'color':'y', 'm':'x', 'p':100}
#dgn = {'x':g[:,0], 'y':g[:,1], 'dof':129, 'name':'Gn', 'style':'-', 'color':'k', 'm':'o', 'p':100}
#dan = {'x':a[:,0], 'y':a[:,1], 'dof':183, 'name':'An', 'style':'-', 'color':'r', 'm':'v', 'p':100}
#dvn = {'x':v[:,0], 'y':v[:,1], 'dof':291, 'name':'Vn', 'style':'-', 'color':'b', 'm':'s', 'p':100}
#drn = {'x':r[:,0], 'y':r[:,1], 'dof':435, 'name':'Rn', 'style':'-', 'color':'c', 'm':'D', 'p':100}
#dkn = {'x':k[:,0], 'y':k[:,1], 'dof':399, 'name':'Kn', 'style':'-', 'color':'m', 'm':'P', 'p':100}
#den = {'x':e[:,0], 'y':e[:,1], 'dof':273, 'name':'En', 'style':'-', 'color':'y', 'm':'x', 'p':100}
cm = 1/2.54
mylist=[['y2gycap','f2gfcap'],['r2gycap','k2gycap'],['r2gfcap','k2gfcap'],['y4gycap','f4gfcap'],['r4gycap','k4gycap'],['r4gfcap','k4gfcap'],['yyc','ffc','flc'],['ryc','kyc','ykc'],
['rec','kec','aac']]
myplotlist=[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2),(2,0),(2,1),(2,2)]
fig, axs = plt.subplots(3, 3, figsize=(18*cm, 15*cm), sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j])
        axs[myplotlist[i]].set_yscale('log')
        axs[myplotlist[i]].plot(cap['x'], cap['y'],
                linestyle=cap['style'], color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.2))
        #axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.05))
        #axs[myplotlist[i]].set_ylim(0.99,1.15)
        axs[myplotlist[i]].set_xlim(0.0,0.62)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=14)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=14)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', y=0.04, fontsize=18)
fig.supylabel('Frustration metric',x=0.04, fontsize=18)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("ALLFR1.pdf",dpi=720)
cm = 1/2.54
mylist=[
        ['f2gycap','y2gfcap'],
        ['y2grcap','y2gkcap'],
        ['f2grcap','f2gkcap'],
        ['f4gycap','y4gfcap'],
        ['y4grcap','y4gkcap'],
        ['f4grcap','f4gkcap']
        ]
myplotlist=[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
fig, axs = plt.subplots(2, 3, figsize=(18*cm, 16*cm), sharex=True, sharey=True, gridspec_kw = {'wspace':0, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j])
        axs[myplotlist[i]].set_yscale('log')
        axs[myplotlist[i]].plot(cap['x'], cap['y'],
                linestyle=cap['style'], color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        ###axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.2))
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.05))
        axs[myplotlist[i]].set_xlim(0.01,0.62)
        #axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.1))
        #axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        #axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.01))
        #axs[myplotlist[i]].set_xlim(0.38,0.62)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=14)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=14)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', y=0.04, fontsize=18)
fig.supylabel('Frustration metric',x=0.04, fontsize=18)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("ALLFR2.pdf",dpi=720)

mylist=[
        ['yyc','ffc','flc','lfc'],
        ['ryc','kyc','yrc','ykc'],
        ['rec','kec','llc','aac'],
        ['yyn','ffn','fln','lfn'],
        ['ryn','kyn','yrn','ykn'],
        ['ren','ken','lln','aan'],
        ]
myplotlist=[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
fig, axs = plt.subplots(2, 3, figsize=(18*cm, 26*cm), sharex=True, gridspec_kw = {'wspace':0.16, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j])
        axs[myplotlist[i]].set_yscale('log')
        axs[myplotlist[i]].plot(cap['x'], cap['y'],
                linestyle=cap['style'], color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        ###axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.2))
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.05))
        axs[myplotlist[i]].set_xlim(0.01,0.62)
        #axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.1))
        #axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        #axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.01))
        #axs[myplotlist[i]].set_xlim(0.38,0.62)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=14)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=14)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', y=0.04, fontsize=18)
fig.supylabel('Frustration metric',x=0.04, fontsize=18)
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("ALLFR3.pdf",dpi=720)
mylist=[
        ['zyyc','zffc','zflc','zlfc'],
        ['zryc','zkyc','zyrc','zykc'],
        ['zrec','zkec','zllc','zaac'],
        ['zyyn','zffn','zfln','zlfn'],
        ['zryn','zkyn','zyrn','zykn'],
        ['zren','zken','zlln','zaan']
        ]
myplotlist=[(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
fig, axs = plt.subplots(2, 3, figsize=(18*cm, 26*cm), sharex=True, gridspec_kw = {'wspace':0.16, 'hspace':0})
for i in range(len(mylist)):
    for j in range(len(mylist[i])):
        cap=eval('d'+mylist[i][j])
        axs[myplotlist[i]].set_yscale('log')
        axs[myplotlist[i]].plot(cap['x'], cap['y'],
                linestyle=cap['style'], color=cap['color'], 
                #marker=cap['m'], markevery=(2,cap['p']), markersize=8,
                #markeredgecolor='black', 
                linewidth=2.6,
                label=cap['name'])
        ###axs[myplotlist[i]].yaxis.set_minor_locator(tck.AutoMinorLocator())
        axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.2))
        axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.05))
        axs[myplotlist[i]].set_xlim(0.01,0.62)
        #axs[myplotlist[i]].xaxis.set_major_locator(MultipleLocator(0.1))
        #axs[myplotlist[i]].xaxis.set_major_formatter('{x:.1f}')
        #axs[myplotlist[i]].xaxis.set_minor_locator(MultipleLocator(0.01))
        #axs[myplotlist[i]].set_xlim(0.38,0.62)
        axs[myplotlist[i]].legend(prop={'size': 16})
        axs[myplotlist[i]].tick_params(axis='x', labelsize=14)
        axs[myplotlist[i]].tick_params(axis='y', labelsize=14)
fig.supxlabel('Temperature (kcal mol$^{-1}$)', y=0.04, fontsize=18)
fig.supylabel('Frustration metric',x=0.04, fontsize=18)
#fig.suptitle('Peptide modelled using FF19 force field in AMBER20')
plt.subplots_adjust(left=0.1,
                    bottom=0.1, 
                    right=0.9, 
                    top=0.9, 
                    wspace=0.4, 
                    hspace=0.4)
plt.show()
fig.savefig("ALLFR4.pdf",dpi=720)
