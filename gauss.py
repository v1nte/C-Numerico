"""
Gauss method for linear system equation
"""
import numpy as np
from os import system as sys
from platform import system as os


def clear():
    """clear terminal """

    if os == 'Windows':
        sys('cls')
    else:
        sys('clear')


#First, how many "Xs"
shape = int(input("How many Xs?: "))

arr = np.zeros((shape,1)) #a null vector
arr2 = np.zeros((shape,shape))#a zero cuadratic array 
M = np.matrix(arr2) #a zero matrix
M = np.column_stack((M, arr))# append vector to Matrix

for i in range(shape):
    for j in range(shape+1):
        #fill the matrix
        clear()
        print(M)
        num = int(input("Insert in [" +str(i+1) +str( j+1)+"]: "))
        M[i, j] = num 

print(M)


print("triu")
print(np.triu(M))


for k in range(1, shape):
    for i in range(k+1, shape+1):
        for j in range(1, shape+1):
            M[i,j] = M[i,j] - ( (M[k,j] * M[i,j]) / M[k,k]  )

print("My try")
print(M)

