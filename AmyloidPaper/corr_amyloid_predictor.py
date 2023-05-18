#!/usr/bin/python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import (MultipleLocator)
import matplotlib.ticker as tck
import seaborn as sns
from scipy import stats
plt.rcParams.update({
    "text.usetex": True,
    "font.family": "sans-serif",
    "font.sans-serif": ["Helvetica"]})

alldata=pd.read_csv('may6amyloid.csv')
#print(stats.pearsonr(alldata['CamSol'], alldata['Aggrescan']))
#print(stats.pearsonr(alldata['Cvtemp'], alldata['Aggrescan']))
#print(stats.pearsonr(alldata['Cvtemp'], alldata['CamSol']))

ax=alldata.plot(kind='scatter', x='Cvtemp', y='Aggrescan',c='proteincategory',s=60,marker='x',figsize=(8,8))

for idx, row in alldata.iterrows():
    ax.set_xlim(0,0.30)
    ax.set_xlabel('Low temperature C$_\mathrm{V}$ feature (kcal mol$^{-1}$)',fontsize=26)
    ax.set_ylabel('Amyloid propensity (Aggrescan)',fontsize=26)
    ax.tick_params(axis='x', labelsize=16)
    ax.tick_params(axis='y', labelsize=16)
    ax.xaxis.set_major_locator(MultipleLocator(0.1))
    ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
    ax.xaxis.set_major_formatter('{x:.1f}')
    ax.xaxis.set_minor_locator(MultipleLocator(0.01))
    ax.annotate(row['Peptide'], (row['Cvtemp'], row['Aggrescan']),xytext=(5,-2.5),textcoords='offset points', family='sans-serif', fontsize=12)
plt.savefig("tempaggrescan.pdf")
plt.show()
plt.clf()
ax=alldata.plot(kind='scatter', x='Cvtemp', y='CamSol',c='proteincategory',s=60,marker='x',figsize=(8,8))
for idx, row in alldata.iterrows():
    ax.set_xlim(0,0.30)
    ax.set_xlabel('Low temperature C$_\mathrm{V}$ feature (kcal mol$^{-1}$)',fontsize=26)
    ax.set_ylabel('Intrinsic solubility (CamSol)',fontsize=26)
    ax.tick_params(axis='x', labelsize=16)
    ax.tick_params(axis='y', labelsize=16)
    ax.xaxis.set_major_locator(MultipleLocator(0.1))
    ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
    ax.xaxis.set_major_formatter('{x:.1f}')
    ax.xaxis.set_minor_locator(MultipleLocator(0.01))
    ax.annotate(row['Peptide'], (row['Cvtemp'], row['CamSol']), xytext=(4,-2.5),textcoords='offset points', family='sans-serif', fontsize=12)
plt.savefig("tempcamsol.pdf")
plt.show()
plt.clf()
ax=alldata.plot(kind='scatter', x='Aggrescan', y='CamSol',c='proteincategory',s=60,marker='x',figsize=(8,8))
for idx, row in alldata.iterrows():
    ax.set_xlim(-100,100)
    ax.set_xlabel('Amyloid propensity (Aggrescan)',fontsize=26)
    ax.set_ylabel('Intrinsic solubility (CamSol)',fontsize=26)
    ax.tick_params(axis='x', labelsize=16)
    ax.tick_params(axis='y', labelsize=16)
    ax.xaxis.set_major_locator(MultipleLocator(25))
    ax.yaxis.set_minor_locator(tck.AutoMinorLocator())
    ax.xaxis.set_major_formatter('{x:.1f}')
    ax.xaxis.set_minor_locator(MultipleLocator(5))
    ax.annotate(row['Peptide'], (row['Aggrescan'], row['CamSol']), xytext=(5,-2.5),textcoords='offset points', family='sans-serif', fontsize=12)
plt.savefig("aggrescancamsol.pdf")
plt.show()
