"""
Gauss method for linear system equation
"""
import numpy as np
import os 

def clear():
    """clear terminal """
    
    try:
        os.system('clear')
    except:
        os.system('cls')


#First, how many "Xs"
shape = int(input("How many Xs?: "))

arr = np.zeros((shape,1))
arr2 = np.zeros((shape,shape))
M = np.matrix(arr2)
M = np.column_stack((M, arr))
for i in range(shape):
    for j in range(shape+1):
        print(M)
        num = int(input("Insert in [" +str(i+1) +str( j+1)+"]: "))
        M[i, j] = num 
    pass

print(M)



