# -*- coding: utf-8 -*-
"""
Created on Sun Jun  6 14:27:38 2021

@author: user
"""
import numpy as np
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics.cluster import adjusted_rand_score
from sklearn.metrics.cluster import silhouette_score
from KD_ARStream import KDARStream # import class KDARStream from same directory
import scipy.io
from IPython import get_ipython
import warnings
warnings.filterwarnings("ignore")
get_ipython().magic('reset -sf')
get_ipython().magic('clear all -sf')

            
plotFigure=0 # 1 for plotting clusters 

   
dataset = np.loadtxt("Datasets/DatasetNew.txt", dtype=float,delimiter=',')
X=dataset[:,1:3]
labels_true=dataset[:,3]
dataset_name="2_ExclaStar"
N= 14
TN= 50
r= 0.30
r_threshold= 0.10
r_max= 0.45
 
####MinMaxNormalization#######################################################
scaler = MinMaxScaler()
scaler.fit(X)
MinMaxScaler()
X=scaler.transform(X)

kds=KDARStream(N,TN,r,r_threshold,r_max,d=X.shape[1])
for i in range(len(X)):  
    kds.addNode(X[i])
    kds.NewClusterAppear()
    kds.findandAddClosestCluster()
    kds.splitClusters()
    kds.mergeClusters()
    kds.updateRadius()
    kds.updateCenters()
    kds.flagActiveClusters()
    if plotFigure==1 and kds.d==2:
            kds.plotData()
#Cluster validation with Purity, Silhouette Index and ARI
data=np.append(kds.deleted_data[:,3:],kds.buffered_data[:,3:],axis=0)
labels=np.append(kds.deleted_data[:,1],kds.buffered_data[:,1],axis=0)
ARI_values=np.empty((len(labels),1),float)
Purity_values=np.empty((len(labels),1),float)
Silhouette_values=np.empty((len(labels),1),float)
labels=labels.reshape(len(labels),1)
labels_true=labels_true.reshape(len(labels),1)
A=0;
count=0

for j in range(0,len(labels)):
    ARI_values[j]=adjusted_rand_score(labels_true[0:j+1,0], labels[0:j+1,0])
    Purity_values[j]=kds.purity_score(labels_true[0:j+1,0], labels[0:j+1,0])
        
print("Avg. ARI=%f"%np.mean(ARI_values))
print("Avg. Purity=%f"%np.mean(Purity_values))
