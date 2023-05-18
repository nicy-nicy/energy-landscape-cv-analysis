#!/usr/bin/env python

import sys
import math
import csv
import numpy as np
import pandas as pd

def flatten(list_of_list):
    '''Converts list of lists into a single list

    Argument is a list of list
    '''
    return [item for sublist in list_of_list for item in sublist]


def atomid_to_coordsid(atomid):
    '''Converts atom index to list of x, y, z coordinate indices
    The coordinate indices start from zero since python index starts
    from zero.

    Argument is atom index
    '''
    coords = []
    xcoord = 3*(int(atomid) - 1)
    ycoord = 3*(int(atomid) - 1) + 1
    zcoord = 3*(int(atomid) - 1) + 2
    coords.append(xcoord)
    coords.append(ycoord)
    coords.append(zcoord)
    return coords


def coordsids_to_coords(coordsids, list_of_lists, minimum):
    '''Extracts corresponding coordinates for atoms using coordinate indices
    Once you have obtained x,y,z coordinate ids (coordsid) for an atomid using
    atomid_to_coordsid function, you need to extract the exact x, y, and z
    coordinates for the structure. Here, minima.mdcrd contains the x, y, and z
    coordinates of all the atoms in all the minima.

    The function coordsids_to_coords extracts x, y, and z coordinates 
    corresponding to coordsids for a particular minimum from the list_of_list
    list made from minima.mdcrd.

    Arguments are coordinate ids, minima.mdcrd list, minimum number
    '''
    xcoord, ycoord, zcoord = coordsids
    coords = []
    coords.append(list_of_lists[int(minimum) - 1][xcoord])
    coords.append(list_of_lists[int(minimum) - 1][ycoord])
    coords.append(list_of_lists[int(minimum) - 1][zcoord])
    return coords


def centroid_of_6atomring(list_of_list):
    '''Calculates centroid of six membered ring

    Argument is a list containing coordinate vectors of 6 atoms in the ring
    '''
    centroid = np.average(np.array(list_of_list), axis=0)
    return centroid


def plane_equation_from3points(list_of_list):
    '''Gives the equation of plane containing three points

    Argument is a list containing coordinate vectors for 3 points in a plane
    '''
    point0, point1, point2 = np.array(list_of_list)
    vec01 = point1 - point0
    vec02 = point2 - point0
    crossprod = np.cross(vec01, vec02)
    acoeff, bcoeff, ccoeff = crossprod
    dcoeff = -(np.dot(crossprod, point0))
    # The equation is {0}x + {1}y + {2}z + {3}=0 '.format(a, b, c, d)
    return [acoeff, bcoeff, ccoeff, dcoeff]


def dist_pt2plane(plane, point):
    '''Gives the perpendicular distance between a point and a plane

    Argument required is plane equation constants i.e., a, b, c, and d,
    and vector of the point
    '''
    acoeff, bcoeff, ccoeff, dcoeff = plane
    xcoord, ycoord, zcoord = point
    num = abs((acoeff*xcoord + bcoeff*ycoord + ccoeff*zcoord + dcoeff))
    denom = (math.sqrt(acoeff*acoeff + bcoeff*bcoeff + ccoeff*ccoeff))
    # Perpendicular distance is num/denom
    return num/denom

def ring_edge_midpt(t):
    ''' Gives the midpoints of edges of a six-membered ring

    The input argument t is a list of list with 6 sublists. Each sublist
    contains 3 elements corresponding to x, y, and z coordinates.
    '''
    mylist=[]                                                                   
    first=(np.array(t[0])+np.array(t[1]))/2                                     
    second=(np.array(t[1])+np.array(t[2]))/2                                    
    third=(np.array(t[2])+np.array(t[3]))/2                                     
    fourth=(np.array(t[3])+np.array(t[4]))/2                                    
    fifth=(np.array(t[4])+np.array(t[5]))/2                                     
    sixth=(np.array(t[5])+np.array(t[0]))/2                                     
    mylist.append(list(first))                                                  
    mylist.append(list(second))                                                 
    mylist.append(list(third))                                                  
    mylist.append(list(fourth))                                                 
    mylist.append(list(fifth))                                                  
    mylist.append(list(sixth))                                                  
    return mylist          

def co_midpt(t):
    ''' This function takes in a list of list and calculates
    the average of the first two elements
    '''
    avg = list((np.array(t[0]) + np.array(t[1]))/2)
    return avg


def normalised_dot(p,q):
    '''
    Calculates normalised dot product of two vectors
    '''
    a = np.dot(p,q)
    b = np.linalg.norm(p)
    c = np.linalg.norm(q)
    return a/(b*c)

def listvecs_samevec(t,p):                                                      
    '''
    This function subtracts the vector p from all 6 vectors in the list of list
    t and returns the magnitude of the resulting vector.
    '''
    mylist=[]                                                                   
    first=np.linalg.norm(np.array(t[0])-np.array(p))                            
    second=np.linalg.norm(np.array(t[1])-np.array(p))                           
    third=np.linalg.norm(np.array(t[2])-np.array(p))                            
    fourth=np.linalg.norm(np.array(t[3])-np.array(p))                           
    fifth=np.linalg.norm(np.array(t[4])-np.array(p))                            
    sixth=np.linalg.norm(np.array(t[5])-np.array(p))                            
    mylist.append(first)                                                        
    mylist.append(second)                                                       
    mylist.append(third)                                                        
    mylist.append(fourth)                                                       
    mylist.append(fifth)                                                        
    mylist.append(sixth)                                                        
    return mylist

def dist_bw_2pts(a,b):
    '''
    Calculates distance between two points whose vectors are given.
    '''
    c = np.array(a) - np.array(b)
    d = np.linalg.norm(c)
    return d

def len_key_values(k):
    '''
    Calculates the length of key values.

    WHERE IS THIS FUNCTION USED? I'm curious.

    '''
    count=0
    for i in k.keys():
        count+=len(k[i])
    return count
