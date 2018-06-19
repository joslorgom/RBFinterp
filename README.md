# Radial Basis Functions Interpolation

This is a set of Matlab functions to interpolate scattered data with Radial Basis Functions (RBF),

<p align="center">
  <img src="https://latex.codecogs.com/gif.latex?F%20%5Cleft%28%20%5Cmathbf%7Bx%7D%20%5Cright%29%20%3D%20%5Csum_%7Bj%3D1%7D%5EN%20%5Cgamma_j%20%5Cvarphi%20%5Cleft%28%20%5C%7C%20%5Cmathbf%7Bx%7D%20-%20%5Cmathbf%7Bx%7D_%7Bs%2C%20j%7D%20%5C%7C_%7B%5Cmathbb%7BR%7D%5Ed%7D%20%5Cright%29%20&plus;%20p%20%5Cleft%28%20%5Cmathbf%7Bx%7D%20%5Cright%29">
</p>


## Getting Started

```Matlab
y = RBFinterp(xs, ys, x, RBFtype, R)
```
interpolates to find y, the values of the function y=f(x) at the points x.

Xs must be a matrix of size [N,Dx], with N the number of data points and Dx the dimension of the points in xs and x.

Ys must be a matrix of size [N,Dy], with N the number of known values at points in Xs, and Dy the dimension of the y values.

X must be a matrix of size [M,Dx], with M the number of query points.

RBFtype specifies the radial basis functions (RBF) to be used. 

* The available global support RBFs are:
	* 'R1'    - linear spline
	* 'R3'    - cubic spline
	* 'TPS2'  - thin plate spline
	* 'Q'     - quadric
	* 'MQ'    - multiquadric
	* 'IMQ'   - inverse multiquadric
	* 'IQ'    - inverse quadric
	* 'GS'    - Gauss
	
| RBF name | Abbreviation | <img src = "https://latex.codecogs.com/gif.latex?%5Cvarphi%20%5Cleft%28%20r%20%5Cright%29"> |
| :---: | :---: | :---: |
| Linear spline | R1 | <img src = "https://latex.codecogs.com/gif.latex?%5Cepsilon%20r"> |
| Cubic splie | R3 | <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%5E3"> |
| Thin plate spline | TPS2| <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%5E2%20%5Clog%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%24"> |
| Quadric | Q | <img src = "https://latex.codecogs.com/gif.latex?1%20&plus;%20%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%5E2"> |
| Multiquadric | MQ | <img src = "https://latex.codecogs.com/gif.latex?%5Csqrt%7B1%20&plus;%20%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%20%5E2%7D"> |
| Inverse multiquadric | IMQ | <img src = "https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B%5Csqrt%7B1%20&plus;%20%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%20%5E2%7D%7D"> |
| Inverse quadric | IQ | <img src = "https://latex.codecogs.com/gif.latex?%5Cfrac%7B1%7D%7B%201%20&plus;%20%5Cleft%28%20%5Cepsilon%20r%20%5Cright%29%20%5E2%20%7D"> |
| Gauss | GS | <img src = "https://latex.codecogs.com/gif.latex?e%5E%7B-%5Cleft%28%5Cepsilon%20r%20%5Cright%29%5E2%7D"> |

* The available compact support RBFs are (see Wendland H., Konstruktion und Untersuchung radialer Basisfunktionen mit kompaktem Träger. PhD  thesis, Göttingen, Georg-August-Universität zu Göttingen, Diss, 1996):
	* 'CP_C0'
	* 'CP_C2'
	* 'CP_C4'
	* 'CP_C6'
	* 'CTPS_C0'
	* 'CTPS_C1'
	* 'CTPS_C2a'
	* 'CTPS_C2b'

Compact support functions have the form

<p align="center">
	<img src = "https://latex.codecogs.com/gif.latex?%5Cvarphi%20%5Cleft%28%20%5Cxi%20%3D%20%5Cfrac%7Br%7D%7BR%7D%20%5Cright%29%20%3D%20%5Cbegin%7Bcases%7D%20f%20%5Cleft%28%20%5Cxi%20%5Cright%29%2C%20%26%200%20%5Cleq%20%5Cxi%20%5Cleq%201%20%5C%5C%200%2C%20%26%20%5Cxi%20%3E%201%20%5Cend%7Bcases%7D">
</p>

| RBF name | <img src = "https://latex.codecogs.com/gif.latex?%5Cvarphi%20%5Cleft%28%20%5Cxi%20%5Cright%29"> |
| :---: | :---: |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCP%20%7D%20%5Cmathcal%7BC%7D%5E0"> | <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%201%20-%20%5Cxi%20%5Cright%29%5E2"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCP%20%7D%20%5Cmathcal%7BC%7D%5E2"> | <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%201%20-%20%5Cxi%20%5Cright%29%5E4%20%5Cleft%28%204%20%5Cxi%20&plus;%201%20%5Cright%29"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCP%20%7D%20%5Cmathcal%7BC%7D%5E4">| <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%201%20-%20%5Cxi%20%5Cright%29%5E6%20%5Cleft%28%20%5Cfrac%7B35%7D%7B3%7D%20%5Cxi%5E2%20&plus;%206%20%5Cxi%20&plus;%201%20%5Cright%29"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCP%20%7D%20%5Cmathcal%7BC%7D%5E6"> | <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%201%20-%20%5Cxi%20%5Cright%29%5E8%20%5Cleft%28%2032%20%5Cxi%5E3%20&plus;%2025%20%5Cxi%5E2%20&plus;%208%20%5Cxi%20&plus;%201%20%5Cright%29"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCTPS%20%7D%20%5Cmathcal%7BC%7D%5E0"> | <img src = "https://latex.codecogs.com/gif.latex?%5Cleft%28%201%20-%20%5Cxi%20%5Cright%29%5E5"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCTPS%20%7D%20%5Cmathcal%7BC%7D%5E1"> | <img src = "https://latex.codecogs.com/gif.latex?1%20&plus;%20%5Cfrac%7B80%7D%7B3%7D%20%5Cxi%5E2%20-%2040%20%5Cxi%5E3%20&plus;%2015%20%5Cxi%5E4%20-%20%5Cfrac%7B8%7D%7B3%7D%20%5Cxi%5E5%20&plus;%2020%20%5Cxi%5E2%20%5Clog%20%5Cxi"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCTPS%20%7D%20%5Cmathcal%7BC%7D%5E2_a"> | <img src = "https://latex.codecogs.com/gif.latex?1%20-%2030%20%5Cxi%5E2%20-%2010%20%5Cxi%5E3%20&plus;%2045%20%5Cxi%5E4%20-%206%20%5Cxi%5E5%20-%2060%20%5Cxi%5E3%20%5Clog%20%5Cxi"> |
| <img src = "https://latex.codecogs.com/gif.latex?%5Ctext%7BCTPS%20%7D%20%5Cmathcal%7BC%7D%5E2_b"> | <img src = "https://latex.codecogs.com/gif.latex?1%20-%2020%20%5Cxi%5E2%20&plus;%2080%20%5Cxi%5E3%20-%2045%20%5Cxi%5E4%20-%2016%20%5Cxi%5E5%20&plus;%2060%20%5Cxi%5E4%20%5Clog%20%5Cxi"> |

R is either the support radius for the compact support RBFs or a parameter to make the distance values dimensionless for the global support RBFs.

```Matlab
[fPar, M] = RBFparam(xs, ys, RBFtype, R)
```

returns the weights in the RBF summation and the polynomial coefficients in a column vector fPar by solving a linear system

<p align="center">
    <img src="https://latex.codecogs.com/gif.latex?%5Cbegin%7Bpmatrix%7D%20%5Cmathbf%7BM%7D%20%26%20%5Cmathbf%7BP%7D_s%20%5C%5C%20%5Cmathbf%7BP%7D_s%5ET%20%26%20%5Cmathbf%7B0%7D%20%5Cend%7Bpmatrix%7D%20%5Cbegin%7Bpmatrix%7D%20%5Cmathbf%7B%5Cgamma%7D%20%5C%5C%20%5Cmathbf%7B%5Cbeta%7D%20%5Cend%7Bpmatrix%7D%20%3D%20%5Cbegin%7Bpmatrix%7D%20%5Cmathbf%7Bf%7D_s%20%5C%5C%20%5Cmathbf%7B0%7D%20%5Cend%7Bpmatrix%7D">
</p>

```Matlab
[y] = RBFeval(xs, x, fPar, RBFtype, R)
```

returns the values of the interpolation weighted function at points x by performing the matrix-vector product

<p align="center">
    <img src="https://latex.codecogs.com/gif.latex?%5Cmathbf%7Bf%7D%20%3D%20%5Cbegin%7Bpmatrix%7D%20%5Cmathbf%7B%5Chat%7BM%7D%7D%20%26%20%5Cmathbf%7B%5Chat%7BP%7D%7D%20%5Cend%7Bpmatrix%7D%20%5Cbegin%7Bpmatrix%7D%20%5Cmathbf%7B%5Cgamma%7D%20%5C%5C%20%5Cmathbf%7B%5Cbeta%7D%20%5Cend%7Bpmatrix%7D">
</p>

## Running the example

An example case can be run just by typing in the Matlab command line

```Matlab
test
```

![](test.png)

<p align="center">
  <img src="test2.png">
</p>

## References

* Beckert, Armin and Wendland, Holger. Multivariate interpolation for fluid-structure-interaction problems using radial basis functions. _Aerospace Science and Technology_, 5 (2), p. 125-134, 2001.
* Wendland, Holger. _Konstruktion und Untersuchung radialer Basisfunktionen mit kompaktem Träger}_. PhD thesis, Göttingen, Georg-August-Universität zu Göttingen, Diss, 1996.
* De Boer, A and Van der Schoot, MS and Bijl, Hester. Mesh deformation based on radial basis function interpolation. _Computers & structures_, 85 (11-14), p. 784-795, 2007.
* Biancolini, Marco Evangelos. _Fast Radial Basis Functions for Engineering Applications_. Springer, 2018.
