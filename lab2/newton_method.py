from math import log 


def newton(x=3.5):
    """
    Return solution of x^x = 100

    input:
        float: aproximation of x^x = 100
    """

    x = float(x)
    
    for i in range(1001):
        x = x - ( (x**x - 100) / (x**x*(1+log(x))) )
        
        print(f'iteracion {i}: {x}')


    return x

if __name__ == "__main__":
    newton(2) 
