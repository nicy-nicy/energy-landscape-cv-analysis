#!/usr/bin/env python

'''Order Parameter analysis for IDPs

Make sure you first run 

create_general_input.sh
create_peptide_specific_input.sh PEPTIDEnocap
does_prelim_input_exist.sh

These scripts ensure you have all the input files
Input files required are minima.mdcrd, old_mol.pdb, peptidename,
minnoIMP, minnoenergyIMP, minenergyIMP
and input_order_parameter.
'''

import sys
import math
import csv
import numpy as np
from orderparamdef import *
from more_itertools import sliced
original_stdout = sys.stdout

def main():
    global ringresidue, ringatoms, pairsofinterest, pairofinterest, ringindices
    global full_list_array, energies, backboneresidue, backboneresidueatom 
    global backboneindices, minnoenergies, lineno
    global cationpiresidues, cationcationresidues, cationindices
    global PEPTIDE
    INPUTFILE = "input_order_parameter"
    PEPTIDENAME = "peptidename"
    FILEPDB = "old_mol.pdb"
    FILEMDCRD = "minima.mdcrd"
    MINDATAENERGIES = "minenergyIMP"
    MINNOENERGY = 'minnoenergyIMP'
    # ATOMID, ATOMNAME, RESID correspond to column number in pdb file
    # column number starts from zero for usage with python
    ATOMID = 1
    ATOMNAME = 2
    RESID = 4
    PEPTIDE = None
    energies = []
    minnoenergies = []

    # note that last residue NME for capped peptide
    # does not have carbonyl group (CO)
    # The difference between PAIR and PAIRS is that in a way the properties 
    # calculates for PAIR are commutative and the properties calculated for
    # PAIRS are non-commutative. For example, you will have
    # PAIR 1 2
    # But, for PAIRS you will have both
    # PAIRS 1 2
    # PAIRS 2 1
    ringresidue = []
    backboneresidue = []
    backboneresidueatom = {}
    ringatoms = {}
    pairsofinterest = []
    pairofinterest = []
    cationpiresidues = []
    cationcationresidues = []
    TOTALATOMS = None

    with open(MINDATAENERGIES, 'r') as m:
        for line in m:
            stripped = line.strip()
            splitted = stripped.split()
            energies.append(round(float(splitted[0]), 2))

    with open(MINNOENERGY, 'r') as m:
        for line in m:
            stripped = line.strip()
            splitted = stripped.split()
            minnoenergies.append(splitted)

    with open(PEPTIDENAME) as p:
        for line in p:
            stripped = line.strip()
            splitted = stripped.split()
            PEPTIDE = splitted[0]

    with open(INPUTFILE) as i:
        for line in i:
            stripped = line.strip()
            splitted = stripped.split()
            if splitted[0] == PEPTIDE:
                if splitted[1] == 'PLANERESIDUE':
                    ringresidue.append(splitted[2])
                    ringatoms[splitted[2]] = splitted[3:]
                elif splitted[1] == 'PAIRS':
                    pairsofinterest.append(splitted[2:])
                elif splitted[1] == 'PAIR':
                    pairofinterest.append(splitted[2:])
                elif splitted[1] == 'TOTALATOMS':
                    TOTALATOMS = int(splitted[2])
                elif splitted[1] == 'BACKBONE':
                    backboneresidue.append(splitted[2])
                    backboneresidueatom[splitted[2]] = splitted[3:]
                elif splitted[1] == 'CATIONPI':
                    cationpiresidues.append(splitted[2:])
                elif splitted[1] == 'CATIONCATION':
                    cationcationresidues.append(splitted[2:])
                else:
                    pass
            else:
                pass
    
    # extract lines from the pdb file which have the atom of interest
    # the aim is to know the index of atom of interest from the pdb file

    # From residue number ---> atom name ---> atom index

    # The hierarchy in which data is stored is as follows:
    # ringresidue ---> residue numbers which have rings
    # ringatoms ---> the atom names for atoms in the ring
    # ringindices ---> a dictionary where each key is residue number
    #                  and each value is a list containing atomids for
    #                  atoms defined in ringatoms file
    # Similar definitions hold for backbone as well.

    list_of_list_pdb = []
    with open(FILEPDB) as pdb:
        for line in pdb:
            stripped = line.strip()
            splitted = stripped.split()
            if splitted[0] == 'ATOM':
                list_of_list_pdb.append(splitted)
            else:
                pass

    ringindices = {}
    for i in ringresidue:
        ringindices[i] = []
    for line_in_pdb in list_of_list_pdb:
        if line_in_pdb[RESID] in ringresidue:
            if line_in_pdb[ATOMNAME] in ringatoms[line_in_pdb[RESID]]:
                ringindices[line_in_pdb[RESID]].append(line_in_pdb[ATOMID])

    backboneindices = {}
    for i in backboneresidue:
        backboneindices[i] = []
    for line_in_pdb in list_of_list_pdb:
        if line_in_pdb[RESID] in backboneresidue:
            if line_in_pdb[ATOMNAME] in backboneresidueatom[line_in_pdb[RESID]]:
                backboneindices[line_in_pdb[RESID]].append(line_in_pdb[ATOMID])

    # The line below is used to add a particular atom index
    for i in backboneresidue:
        backboneindices[i].append(str(int(backboneindices[i][1])+1))
    
    cation_resindices = []
    cationindices = {}

    # Note that j corresponds to pi residue and k corresponds to cation residue

    for i in cationpiresidues:
        j, k = i
        cation_resindices.append(k)
        cationindices[int(k)] = None

    for line_in_pdb in list_of_list_pdb:
        if line_in_pdb[RESID] in cation_resindices:
            if line_in_pdb[ATOMNAME] in ['CZ','NZ']:
                cationindices[int(line_in_pdb[RESID])] = line_in_pdb[ATOMID]

    # convert mdcrd file into one long list
    # convert that long list into list of list
    # the sublist contains coordinates of all atoms in one minimum
    # the outer list is for various minima
    list_of_lists_mdcrd = []
    with open(FILEMDCRD) as m:
        m.readline()
        for line in m:
            stripped = line.rstrip()
            splitted = list(sliced(stripped,8))
            list_of_lists_mdcrd.append(splitted)
    coords_min_all_string = flatten(list_of_lists_mdcrd)
    coords_min = list(map(float, coords_min_all_string))
    dof = 3*TOTALATOMS
    full_list = [coords_min[i:i + dof] for i in range(0, len(coords_min), dof)]
    full_list_array = np.array(full_list)

# Output file creation. These files are made using dictionaries
# Output files are in csv format
# The keys have the following meaning
# 1.      bb:backbone
# 2. centd1_2:centroid-centroid distance between rings in residues 1 and 2
# 3.   dpn1_2:dot-product of normals of rings in residues 1 and 2
# 4.  pdpn1c1_2:angle between normal of residue 1 and vector pointing
#            from centroid of ring 1 to ring 2, the normal is taken such 
#            that the dot product of normal and centroid to centroid vector
#            is positive.
# 5.   pl1c2:distance between plane of ring 1 and centroid of ring 2 
# 6.  pdpn1_2:offset distance between rings 1 and 2, calculated using normals
#            to ring such that their dot product is positive. The normal to ring
#            1 is considered and centroid-centroid vector from 1 to 2 is taken.


    if PEPTIDE in ("YYGGYYnocap", "FFGGFFnocap", "YRGGRYnocap", "RYGGYRnocap",
            "KYGGYKnocap", "YKGGKYnocap",
            "YYGGYYcap", 
            "FFGGFFcap", 
            "YRGGRYcap", 
            "RYGGYRcap", 
            "KYGGYKcap", 
            "YKGGKYcap",
            "YGGGGYcap", 
            "FGGGGFcap", 
            "YGGGGFcap", 
            "FGGGGYcap", 
            "YGGGGRcap", 
            "RGGGGYcap", 
            "KGGGGYcap", 
            "YGGGGKcap",
            "FGGGGRcap", 
            "RGGGGFcap", 
            "KGGGGFcap", 
            "FGGGGKcap",
            "GYGGYGcap", 
            "GFGGFGcap", 
            "GYGGFGcap", 
            "GFGGYGcap", 
            "GYGGRGcap", 
            "GRGGYGcap", 
            "GKGGYGcap", 
            "GYGGKGcap",
            "GFGGRGcap", 
            "GRGGFGcap", 
            "GKGGFGcap", 
            "GFGGKGcap"
            ):
        with open("backbone_pi_interaction.csv", 'a') as f0:
            bbkeys = ['minimum','energy','no_of_bb_interactions']
            bbwriter = csv.DictWriter(f0, fieldnames = bbkeys)
            bbwriter.writeheader()
        with open("centroid_to_centroid_dist.csv", 'a') as f1:
            c2ckeys = ['minimum', 'energy' ]
            for i in pairofinterest:
                j, k = i
                c2ckeys.append('centd'+j+'_'+k)
            c2cwriter = csv.DictWriter(f1, fieldnames = c2ckeys)
            c2cwriter.writeheader()
        with open("two_rings_normal_dotprod.csv", 'a') as f2:
            dotpronkeys = ['minimum','energy']
            for i in pairofinterest:
                j, k = i
                dotpronkeys.append('dpn'+j+'_'+k)
            dotpronwriter = csv.DictWriter(f2, fieldnames = dotpronkeys)
            dotpronwriter.writeheader()
        with open("ang_posnorm_cent.csv", 'a') as f3:
            apnormcentkeys = ['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                apnormcentkeys.append('pdpn'+j+'c'+j+'_'+k)
            apnormcentwriter = csv.DictWriter(f3, fieldnames = apnormcentkeys)
            apnormcentwriter.writeheader()
        with open("dist_centroid_ring_plane.csv", 'a') as f5:
            dcrpkeys = ['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                dcrpkeys.append('pl'+j+'c'+k)
            dcrpwriter = csv.DictWriter(f5, fieldnames = dcrpkeys)
            dcrpwriter.writeheader()
        with open("offset_dist_dotprod_pos.csv", 'a') as f6:
            offdotpkeys =['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                offdotpkeys.append('pdpn'+j+'_'+k)
            offdotpwriter = csv.DictWriter(f6, fieldnames = offdotpkeys)
            offdotpwriter.writeheader()

        if PEPTIDE in ("YRGGRYnocap","RYGGYRnocap", "KYGGYKnocap", "YKGGKYnocap",
                "YRGGRYcap",
                "RYGGYRcap",
                "KYGGYKcap",
                "YKGGKYcap",
                "YGGGGRcap",
                "RGGGGYcap",
                "KGGGGYcap",
                "YGGGGKcap",
                "FGGGGRcap",
                "RGGGGFcap",
                "KGGGGFcap",
                "FGGGGKcap",
                "GYGGRGcap",
                "GRGGYGcap",
                "GKGGYGcap",
                "GYGGKGcap",
                "GFGGRGcap",
                "GRGGFGcap",
                "GKGGFGcap",
                "GFGGKGcap",
                ):
            with open("cation_pi_distance.csv", 'a') as f59:
                 cpkeys = ['minimum', 'energy'] 
                 for i in cationpiresidues:
                     j, k = i
                     cpkeys.append('distCP'+j+'_'+k)
                 cpwriter = csv.DictWriter(f59, fieldnames = cpkeys)
                 cpwriter.writeheader()
            with open("cation_cation_distance.csv", 'a') as f26:
                 cckeys = ['minimum', 'energy']
                 for i in cationcationresidues:
                     j, k = i
                     cckeys.append('distCC'+j+'_'+k)
                 ccwriter = csv.DictWriter(f26, fieldnames = cckeys)
                 ccwriter.writeheader()

        with open("minnoIMP", "r") as a_file:
            for lineno,line in enumerate(a_file):
                stripped_line = line.strip()
                i = int(stripped_line)
                op_yyggyy(i,lineno)

    else:
        pass

# CODE WILL DIFFER from here depending on the PEPTIDE

# dummy here stands for the minima number

def op_yyggyy(dummy,linenumber):


    coordsid = {}
    final_coords = {}
    for i in ringresidue:
        coordsid[i] = []
        final_coords[i] = []
        for j in ringindices[i]:
            coordsid[i].append(atomid_to_coordsid(j))
        for k in coordsid[i]:
            coordinates = coordsids_to_coords(k, full_list_array, dummy)
            final_coords[i].append(coordinates)
            # ****** we want to substitue minima number with DUMMY *********
    # print("ringresidue:", ringresidue)
    # print("ringindices:", ringindices)
    # print("coordsid:", coordsid)
    # print("final_coords", final_coords)
    bbcoordsid = {}
    bbfinal_coords = {}
    for i in backboneresidue:
        bbcoordsid[i] = []
        bbfinal_coords[i] = []
        for j in backboneindices[i]:
            bbcoordsid[i].append(atomid_to_coordsid(j))
        for k in bbcoordsid[i]:
            bbcoordinates = coordsids_to_coords(k, full_list_array, dummy)
            bbfinal_coords[i].append(bbcoordinates)
            # to obtain coords for various minima
    # print("backboneresidue:", backboneresidue)
    # print("backboneindices:", backboneindices)
    # print("bbcoordsid:", bbcoordsid)
    # print("bbfinal_coords:", bbfinal_coords)
    # centroid of rings

    # Calculation of centroid of each ring within a residue in a peptide
    # Calculation of average of edges of a ring

    ring_centroids = {}
    ring_edge_avg = {}
    for i in ringresidue:
        ring_centroids[i] = list(centroid_of_6atomring(final_coords[i]))
        ring_edge_avg[i] = ring_edge_midpt(final_coords[i])
    # print("ring_centroids", ring_centroids)
    # print("ring_edge_avg:", ring_edge_avg)

    # Calculation of normal of CO groups for each residue in a peptide
    # Calculation of midpoint of CO groups for each residue in a peptide

    con_normal = {}
    carbonyl_midpoint = {}
    for i in backboneresidue:
        fourcoeff = plane_equation_from3points(bbfinal_coords[i])
        con_normal[i] = fourcoeff[:3]
        # print("bbfinal_coords[i]:", bbfinal_coords[i])
        carbonyl_midpoint[i] = co_midpt(bbfinal_coords[i])
    # print("con_normal:", con_normal)
    # print("carbonyl_midpoint", carbonyl_midpoint)
    
    # Calculation of plane equation for each ring within a peptide
    # From the plane equation, the coefficients of x, y and z gives
    # the normal to the plane
    # A plane can have two normals. In positive and negative direction

    ring_planes = {}
    normal_eq = {}
    normal_negeq = {}
    for i in ringresidue:
        three_points_in_a_plane = []
        three_points_in_a_plane.append(ring_centroids[i])
        three_points_in_a_plane.append(final_coords[i][0])
        three_points_in_a_plane.append(final_coords[i][1])
        ring_planes[i] = plane_equation_from3points(three_points_in_a_plane)
        normal_eq[i] = ring_planes[i][:3]
        normal_negeq[i] = list(np.array(ring_planes[i][:3])*(-1))
    # print("ring_planes", ring_planes)
    # print("normal_eq coeff", normal_eq)
    # print("normal_negeq coeff", normal_negeq)

    # This is important to understand
    # The backbone_pi is a dictionary with the value being dictionary as well
    # backbone_pi = {res1:{CO1:[dist bw CO1 and edges of ring in res1 (first 6
    #                    items in the list, dot prod normal of CO and ring)]}}
    # backbone_pi_analyse = {res1:[list of no fixed length, list items are
    #                              the residues the CO of which interacts with
    #                           ring of residue 1 (backbone-pi interaction)]}

    backbone_pi = {}
    backbone_pi_analyse = {}
    for i in ringresidue:
        backbone_pi[i]={}
        backbone_pi_analyse[i]=[]
        for j in backboneresidue:
            backbone_pi[i][j]=listvecs_samevec(ring_edge_avg[i],carbonyl_midpoint[j])
            orientation = normalised_dot(normal_eq[i], con_normal[j])
            backbone_pi[i][j].append(orientation)
            if (backbone_pi[i][j][6]>=0.8 or backbone_pi[i][j][6]<=-0.8):
                count=0
                for k in backbone_pi[i][j][:6]:
                    if (k <= 5.0 and count<=1.0):
                        count+=0.5
                if count==1.0:
                    backbone_pi_analyse[i].append(j)
    # print("backbone_pi:", backbone_pi)
    # print("backbone_pi_analyse:", backbone_pi_analyse)

    # Meanings of all dictionaries given below are explained here
    # centroid_dist = {centdj_k : distance between centroids of rings in
    #                             residues j and k}
    # centroid_vecs = {centroidvj_k : vector pointing from centroid of ring in
    #                  residue j to centroid of ring of residue k}
    # dist_centroidringM_plN = {pljck : distance between plane of ring in 
    #                           residue j and centroid of ring in residue k}
    # interplanar_dotpro = {dpnj_k : normalised dot product between normal
    #                         of rings in residues j and k} 
    # ang_normN_centNM = {pdpnjcj_k : angle between normal of ring in residue
    #                    j and vector pointing from centroid of ring in residue
    #                    j to centroid of ring in residue k. The normal to the
    # ring is taken such that its dot product with the centroid to centroid 
    # vector is positive}
    # offsetdistsp = {pdpnj_k : offset distance between ring j and ring k. Here
    # the normal to ring j is considered such that its dot product with vector
    # pointing from centroid of ring in residue j to centroid of ring in residue
    # k is positive}

    # Note that PAIR is used for centroid-centroid distance and interplanar 
    # dot product of normals of rings
    # PAIRS is used while calculating distance between point and a plane,
    # angle between normal to plane and centroid-centroid vector and
    # for offset distances.

    # somevariable = {key : round(keyvalue, 1) for key in somedict}
    # The above line is used to create dictionary with rounded-off values
    
    centroid_d = {}
    centroid_vecs = {}
    dist_centroidringM_plN = {}
    interplanar_dotpro = {}
    ang_normN_centNM = {}
    offsetdistsp = {}
    for i in pairofinterest:
        j, k =i
        centvecjk = np.array(ring_centroids[k]) - np.array(ring_centroids[j])
        centroid_vecs["centroidv" + j + k] = centvecjk
        centroid_d["centd" + j+'_' + k] = np.linalg.norm(centvecjk)
        centroid_dist = {key : round(centroid_d[key], 1) for key in centroid_d}

        num1 = np.dot(normal_eq[j], normal_eq[k])
        denom1 = (np.linalg.norm(normal_eq[j]) * np.linalg.norm(normal_eq[k]))
        interplanar_dotpro["dpn" + j +'_'+ k] = num1 / denom1
        interplanar_dotprod = {key : round(interplanar_dotpro[key], 1) for key in interplanar_dotpro}

    for i in pairsofinterest:
        j, k = i
        centvecjk = np.array(ring_centroids[k]) - np.array(ring_centroids[j])
        centroid_vecs["centroidv" + j + k] = centvecjk
    
        dist_pt_plane = dist_pt2plane(ring_planes[j], ring_centroids[k])
        dist_centroidringM_plN["pl" + j + "c" + k] = dist_pt_plane
        dist_centroidringM_planeN = {key : round(dist_centroidringM_plN[key], 1) for key in dist_centroidringM_plN}

        if np.dot(centvecjk, normal_eq[j]) >= 0:
            normalp = normal_eq[j] / np.linalg.norm(normal_eq[j])
        else:
            normalp = normal_negeq[j] / np.linalg.norm(normal_negeq[j])
        projectionp = np.dot(centvecjk, normalp)
        offsetvecp = centvecjk - projectionp
        offsetdistp = np.linalg.norm(offsetvecp)
        offsetdistsp["pdpn" + j+'_' + k] = offsetdistp
        offsetdistspfull = {key : round(offsetdistsp[key], 1) for key in offsetdistsp}
        normp2 = np.linalg.norm(centroid_vecs["centroidv" + j + k])
        anglep = math.degrees(math.acos(projectionp / normp2))
        ang_normN_centNM["pdpn" + j + "c" + j+'_' + k] = anglep
        ang_normN_centNMfull = {key : round(ang_normN_centNM[key], 1) for key in ang_normN_centNM}


    
    bbdict={}
    bbdict["minimum"]=dummy
    roundedenergy=round(float(minnoenergies[linenumber][1]),2)
    bbdict["energy"]= roundedenergy
    bbdict["no_of_bb_interactions"] = len_key_values(backbone_pi_analyse)
    with open("backbone_pi_interaction.csv", 'a') as f0:
        bbkeys = ['minimum','energy','no_of_bb_interactions']
        bbwriter = csv.DictWriter(f0, fieldnames = bbkeys)
        bbwriter.writerow(bbdict)


    if PEPTIDE in ("YYGGYYnocap", "FFGGFFnocap", "YRGGRYnocap", "RYGGYRnocap",
            "KYGGYKnocap", "YKGGKYnocap",
            "YYGGYYcap", 
            "FFGGFFcap", 
            "YRGGRYcap", 
            "RYGGYRcap", 
            "KYGGYKcap", 
            "YKGGKYcap",
            "YGGGGYcap", 
            "FGGGGFcap", 
            "YGGGGFcap", 
            "FGGGGYcap", 
            "GYGGYGcap", 
            "GFGGFGcap", 
            "GYGGFGcap", 
            "GFGGYGcap" 
            ):
        centroid_dist["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        centroid_dist["energy"] = roundedenergy
        with open("centroid_to_centroid_dist.csv", 'a') as f1:
            c2ckeys = ['minimum', 'energy' ]
            for i in pairofinterest:
                j, k = i
                c2ckeys.append('centd'+j+'_'+k)
            c2cwriter = csv.DictWriter(f1, fieldnames = c2ckeys)
            c2cwriter.writerow(centroid_dist)

        interplanar_dotprod["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        interplanar_dotprod["energy"] = roundedenergy
        with open("two_rings_normal_dotprod.csv", 'a') as f2:
            dotpronkeys = ['minimum','energy']
            for i in pairofinterest:
                j, k = i
                dotpronkeys.append('dpn'+j+'_'+k)
            dotpronwriter = csv.DictWriter(f2, fieldnames = dotpronkeys)
            dotpronwriter.writerow(interplanar_dotprod)

        ang_normN_centNMfull["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        ang_normN_centNMfull["energy"] = roundedenergy
        with open("ang_posnorm_cent.csv", 'a') as f3:
            apnormcentkeys = ['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                apnormcentkeys.append('pdpn'+j+'c'+j+'_'+k)
            apnormcentwriter = csv.DictWriter(f3, fieldnames = apnormcentkeys)
            apnormcentwriter.writerow(ang_normN_centNMfull)

        dist_centroidringM_planeN["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        dist_centroidringM_planeN["energy"] = roundedenergy
        with open("dist_centroid_ring_plane.csv", 'a') as f5:
            dcrpkeys = ['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                dcrpkeys.append('pl'+j+'c'+k)
            dcrpwriter = csv.DictWriter(f5, fieldnames = dcrpkeys)
            dcrpwriter.writerow(dist_centroidringM_planeN)

        offsetdistspfull["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        offsetdistspfull["energy"] = roundedenergy
        with open("offset_dist_dotprod_pos.csv", 'a') as f6:
            offdotpkeys =['minimum','energy']
            for i in pairsofinterest:
                j, k = i
                offdotpkeys.append('pdpn'+j+'_'+k)
            offdotpwriter = csv.DictWriter(f6, fieldnames = offdotpkeys)
            offdotpwriter.writerow(offsetdistspfull)

    # cpfinal_coords = {resid : coordinates of CZ atom }

    if PEPTIDE in ("YRGGRYnocap","RYGGYRnocap", "KYGGYKnocap", "YKGGKYnocap",
                "YRGGRYcap",
                "RYGGYRcap",
                "KYGGYKcap",
                "YKGGKYcap",
                "YGGGGRcap",
                "RGGGGYcap",
                "KGGGGYcap",
                "YGGGGKcap",
                "FGGGGRcap",
                "RGGGGFcap",
                "KGGGGFcap",
                "FGGGGKcap",
                "GYGGRGcap",
                "GRGGYGcap",
                "GKGGYGcap",
                "GYGGKGcap",
                "GFGGRGcap",
                "GRGGFGcap",
                "GKGGFGcap",
                "GFGGKGcap",
                ):
        cpcoordsid = {}
        cpfinal_coords = {}
        for i,l in cationindices.items():
            cpcoordsid[i] = []
            cpfinal_coords[i] = []
            cpcoordsid[i].append(atomid_to_coordsid(l))
            for k in cpcoordsid[i]:
                cpcoordinates = coordsids_to_coords(k, full_list_array, dummy)
                cpfinal_coords[i].append(cpcoordinates)
                # to obtain coords for various minima
        # print("coordsid", coordsid)
        # print()
        # print("final_coords", final_coords)
        # print()
        # centroid of rings

        cation_pi_interaction = {}
        for i in cationpiresidues:
             j, k = i
             ring = ring_centroids[j]
             cation = cpfinal_coords[int(k)]
             distance = dist_bw_2pts(ring, cation)
             cation_pi_interaction["distCP"+j+'_'+k] = distance
        cation_pi_dist = {key : round(cation_pi_interaction[key], 1) for key 
                in cation_pi_interaction}
        
        cation_cation_repulsion = {}
        for i in cationcationresidues:
            j, k = i
            cation1 = cpfinal_coords[int(j)]
            cation2 = cpfinal_coords[int(k)]
            distance = dist_bw_2pts(cation1, cation2)
            cation_cation_repulsion['distCC'+j+'_'+k] = distance
        cation_cation_dist = {key : round(cation_cation_repulsion[key], 1) for key 
                in cation_cation_repulsion}

        cpdict = cation_pi_dist
        cpdict["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        cpdict["energy"] = roundedenergy
        with open("cation_pi_distance.csv", 'a') as f59:
            cpkeys = ['minimum', 'energy'] 
            for i in cationpiresidues:
                j, k = i
                cpkeys.append('distCP'+j+'_'+k)
            cpwriter = csv.DictWriter(f59, fieldnames = cpkeys) 
            cpwriter.writerow(cpdict)
        ccdict = cation_cation_dist
        ccdict["minimum"] = dummy
        roundedenergy=round(float(minnoenergies[linenumber][1]),2)
        ccdict["energy"] = roundedenergy
        with open("cation_cation_distance.csv", 'a') as f26:
            cckeys = ['minimum', 'energy']
            for i in cationcationresidues:
                j, k = i
                cckeys.append('distCC'+j+'_'+k)
            ccwriter = csv.DictWriter(f26, fieldnames = cckeys) 
            ccwriter.writerow(ccdict)

if __name__ == "__main__":
    main()
