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

arr = np.zeros((shape,1)) #a zero vector
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
    pass

print(M)


for k in range(shape):
    for i in range(k+1, shape+1):
        for j in range(shape+1):
            print(M)
            M[i,j] = M[i,j] - ( (M[k,j] * M[i,j]) / M[k,k]  )
        pass
    pass
print(M)

