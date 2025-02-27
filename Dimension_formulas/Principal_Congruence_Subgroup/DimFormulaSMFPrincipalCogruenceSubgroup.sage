"""
We implement the dimension formulas for modular forms on the 
principal congruence subgroup of level N of Sp(4,Z)
For regular wieghts i.e. j=0 and k>=4 or j>=1 and k>=5, 
we use the dimension formula due to Tsushima (see the note).
"""


def dim_cusp_form_GammaN(k,j,N):
    """
    Compute the dimension of S_{k,j}(Gamma[N]) for
     N>=3 and  
    j=0 and k>=4 or j>=1 and k>=5
    """
    L = divisors(N)
    LP = [x for x in L if x.is_prime() == true]
    V = [(1-x^(-2))*(1-x^(-4)) for x in LP]
    mu = prod(V)
    """
    Notice that mu*N^10 is the index of Gamma[N] in Sp(4,Z)
    """
    A = (j+1)*(j+k-1)*(j+2*k-3)*(k-2)*N^10/34560
    B = (j+1)*(j+2*k-3)*N^8/576
    C = (j+1)*N^7/96
    d = (A-B+C)*mu
    """
    d1 = (j+1)*(8*(j+k-1)*(j+2*k-3)*(k-2)+15*(6-(j+2*k-3)*N)/N^3)*mu*N^10/8640 
    d1 = d (see the note)
    """
    return d

"""
For N=2, we use the paper of Berström, Faber and van der Geer.
The conjectures there are now proved thanks to the work of Rösner (see his PhD)    
"""

def dim_cusp_form_Gamma2(k,j):
    """
    Compute the dimension of S_{k,j}(Gamma[2]) for
    j=0 and k>=4 or j>=1 and k>=5
    and j even otherwise this is zero since -1 belongs to Gamma[2]
    """
    A = (k-2)*j^3
    B = 3*(k^2-3*k-3)*j^2
    C = (2*k^3-6*k^2+(15*(-1)^k-27)*k+77+75*(-1)^(k+1))*j
    D = 2*k^3+(15*(-1)^k-9)*k^2+(135*(-1)^(k+1)-17)*k+84+300*(-1)^k
    d = (A+B+C+D)/24
    return d

"""
Dimension of spaces of scalar-valued modular forms on Gamma[2]
"""

def Dim_Scalar_Valued_P_2(k):
    """
    Compute the dimension of M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    k = ZZ(k)
    num = 1+t^5-t^8-t^13
    denom = (1-t^2)^5
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s6_SV(k):
    """
    Compute the multiplicity of the trivial rep. of S_6 in  M_{k}(Gamma[2]).
    This is the same as the dimension of M_{k}(Sp(4,Z)).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = 1+t^35
    denom = (1-t^4) * (1-t^6) * (1-t^10) * (1-t^12)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s51_SV(k):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^11*(1+t)
    denom = ((1-t^4) * (1-t^6))^2
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s42_SV(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^4*(1+t^15)
    denom = (1-t^2)*((1-t^4)^2)*(1-t^10)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s411_SV(k):
    """
    Compute the multiplicity of the rep. s[4,1,1] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^11*(1+t^4)
    denom = (1-t) * (1-t^4) * (1-t^6) * (1-t^12)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s33_SV(k):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^7*(1+t^13)
    denom = (1-t^2)*(1-t^4)*(1-t^6)*(1-t^12)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s321_SV(k):
    """
    Compute the multiplicity of the rep. s[3,2,1] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^8*(1-t^8)
    denom = ((1-t^2)^2)*(1-t^5)*((1-t^6))^2
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s3111_SV(k):
    """
    Compute the multiplicity of the rep. s[3,1,1,1] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^6*(1+t^4+t^11+t^15)
    denom = (1-t^2)*(1-t^4)*(1-t^6)*(1-t^12)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s222_SV(k):
    """
    Compute the multiplicity of the rep. s[2,2,2] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^2*(1+t^23)
    denom = (1-t^2)*(1-t^4)*(1-t^6)*(1-t^12)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s2211_SV(k):
    """
    Compute the multiplicity of the rep. s[2,2,1,1] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^9
    denom = (1-t^2)*((1-t^4)^2)*(1-t^5)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s21111_SV(k):
    """
    Compute the multiplicity of the rep. s[2,1,1,1,1] of S_6 in  M_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^6*(1+t^11)
    denom = ((1-t^4)^2)*((1-t^6)^2)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s111111_SV(k):
    """
    Compute the multiplicity of the rep. s[1,1,1,1,1,1] of S_6 in  M_{k}(Gamma[2]).
    This is the same as the dimension of M_{0,k}(Sp(4,Z),eps).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^5*(1+t^25)
    denom = (1-t^4)*(1-t^6)*(1-t^10)*(1-t^12)
    f = num / denom
    d = f.list()[k]
    return d


def List_Mult_Irrep_SV(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in M_{k}(Gamma[2]) as a list.
    """
    s6 = Mult_s6_SV(k)
    s51 = Mult_s51_SV(k)
    s42 = Mult_s42_SV(k)
    s411 = Mult_s411_SV(k)
    s33 = Mult_s33_SV(k)
    s321 = Mult_s321_SV(k)
    s3111 = Mult_s3111_SV(k)
    s222 = Mult_s222_SV(k)
    s2211 = Mult_s2211_SV(k)
    s21111 = Mult_s21111_SV(k)
    s111111 = Mult_s111111_SV(k)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Dim_Total_SV(k):
    """
    Return the dimension of M_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_SV(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d



"""
Scalar-valued, odd weight.
"""


"""
Dimension of spaces of scalar-valued modular forms on Gamma[2]
for odd weights. For odd weight i.e. k odd, we only have cusp forms
so 
dim M_{k}(Gamma[2])=dim S_{k}(Gamma[2]) and it's given by
Dim_Scalar_Valued_P_2(k) for k>=0.
The space S_{k}(Gamma[2]) decomposes as 
S_{k}(Gamma[2])=S^{SK}_{k}(Gamma[2]) + S^{gen}_{k}(Gamma[2])  
where 
S^{SK}_{k}(Gamma[2]) denotes the subspace of Saito-Kurokawa lifts 
and 
S^{gen}_{k}(Gamma[2]) denotes the space of genuine cusp forms.
"""


"""
Saito-Kurokawa lifts, odd weight 
"""


def Mult_s51_SK_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^11
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d


def Mult_s33_SK_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^7
    denom = (1-t^2)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d


def Mult_s111111_SK_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[1^6] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^5
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d



def List_Mult_Irrep_SK_SV_odd(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S^{SK}_{k}(Gamma[2]) as a list.
    """
    s6 = 0
    s51 = Mult_s51_SK_SV_odd(k)
    s42 = 0
    s411 = 0
    s33 = Mult_s33_SK_SV_odd(k)
    s321 = 0
    s3111 = 0
    s222 = 0
    s2211 = 0
    s21111 = 0
    s111111 = Mult_s111111_SK_SV_odd(k)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Dim_SK_Total_SV_odd(k):
    """
    Return the dimension of the subspace S^{SK}_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_SK_SV_odd(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d


"""
Genuine cusp forms odd weight
"""


def Mult_s51_gen_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s51_SV(k)
    b = Mult_s51_SK_SV_odd(k)
    d = a-b
    return d


def Mult_s33_gen_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s33_SV(k)
    b = Mult_s33_SK_SV_odd(k)
    d = a-b
    return d


def Mult_s111111_gen_SV_odd(k):
    """
    Compute the multiplicity of the rep. s[1^6] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s111111_SV(k)
    b = Mult_s111111_SK_SV_odd(k)
    d = a-b
    return d


def List_Mult_Irrep_gen_SV_odd(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S^{gen}_{k}(Gamma[2]) as a list.
    """
    s6 = Mult_s6_SV(k)
    s51 = Mult_s51_gen_SV_odd(k)
    s42 = Mult_s42_SV(k)
    s411 = Mult_s411_SV(k)
    s33 = Mult_s33_gen_SV_odd(k)
    s321 = Mult_s321_SV(k)
    s3111 = Mult_s3111_SV(k)
    s222 = Mult_s222_SV(k)
    s2211 = Mult_s2211_SV(k)
    s21111 = Mult_s21111_SV(k)
    s111111 = Mult_s111111_gen_SV_odd(k)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L

def Dim_gen_Total_SV_odd(k):
    """
    Return the dimension of the subspace S^{gen}_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_gen_SV_odd(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d




"""
Scalar-valued, even weight. 
"""


"""
Dimension of spaces of scalar-valued modular forms on Gamma[2]
for even weights. For even weight i.e. k even, there are non-cusp forms.
We decompose M_{k}(Gamma[2]) as
M_{k}(Gamma[2])=E_{k}(Gamma[2]) + S_{k}(Gamma[2])
with 
E_{k}(Gamma[2]) space of non-cusp forms of weight k
S_{k}(Gamma[2]) space of cusp forms of weight k
We even further decompose M_{2k}(Gamma[2]) by decomposing 

E_{k}(Gamma[2]) and S_{k}(Gamma[2]).
E_{k}(Gamma[2])=Eis_{k}(Gamma[2])+KE_{k}(Gamma[2])
(Eis_{k}(Gamma[2]) type F, KE_{k}(Gamma[2]) type Q)

and for the cusp forms

S_{k}(Gamma[2])=S^{SK}_{k}(Gamma[2]) + S^{gen}_{k}(Gamma[2])  
where 
S^{SK}_{k}(Gamma[2]) denotes the subspace of Saito-Kurokawa lifts 
and 
S^{gen}_{k}(Gamma[2]) denotes the space of genuine cusp forms.
"""

"""
Non-cups forms part of type F 
"""

def Mult_s6_Eis_SV_even(k):
    """
    Compute the multiplicity of the rep. s[6] of S_6 in Eis_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = 1-t^2+t^4
    denom = (1-t^2)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s42_Eis_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in Eis_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^4
    denom = (1-t^2)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s222_Eis_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^3] of S_6 in Eis_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^2
    denom = (1-t^2)
    f = num / denom
    d = f.list()[k]
    return d


def List_Mult_Irrep_Eis_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in Eis_{k}(Gamma[2]) as a list.
    """
    s6 = Mult_s6_Eis_SV_even(k)
    s51 = 0
    s42 = Mult_s42_Eis_SV_even(k)
    s411 = 0
    s33 = 0
    s321 = 0
    s3111 = 0
    s222 = Mult_s222_Eis_SV_even(k)
    s2211 = 0
    s21111 = 0
    s111111 = Mult_s111111_SK_SV_odd(k)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Dim_Eis_Total_SV_even(k):
    """
    Return the dimension of the subspace Eis_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_Eis_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d

"""
Non-cups forms part of type Q
"""

def Mult_s6_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[6] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^12
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s51_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^12
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d


def Mult_s42_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^8
    denom = (1-t^2)*(1-t^4)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s321_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[3,2,1] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^8
    denom = (1-t^2)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s3111_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[3,1^3] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^6
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d


def Mult_s222_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^3] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^8
    denom = (1-t^2)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s21111_KE_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2,1^4] of S_6 in KE_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^6
    denom = (1-t^4)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d



def List_Mult_Irrep_KE_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in Eis_{k}(Gamma[2]) as a list.
    """
    s6 = Mult_s6_KE_SV_even(k)
    s51 = Mult_s51_KE_SV_even(k)
    s42 = Mult_s42_KE_SV_even(k)
    s411 = 0
    s33 = 0
    s321 = Mult_s321_KE_SV_even(k)
    s3111 = Mult_s3111_KE_SV_even(k)
    s222 = Mult_s222_KE_SV_even(k)
    s2211 = 0
    s21111 = Mult_s21111_KE_SV_even(k)
    s111111 = 0
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Dim_KE_Total_SV_even(k):
    """
    Return the dimension of the subspace Eis_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_KE_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d


def List_Mult_Irrep_E_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in E_{k}(Gamma[2]) as a list.
    """
    Eis = List_Mult_Irrep_Eis_SV_even(k)
    KE = List_Mult_Irrep_KE_SV_even(k)
    L = [Eis[a]+KE[a] for a in range(11)]
    return L

def Dim_E_Total_SV_even(k):
    """
    Return the dimension of the subspace Eis_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_E_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d


"""
Cusp forms
"""

def List_Mult_Irrep_Cusp_Form_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S_{k}(Gamma[2]) as a list.
    """
    M = List_Mult_Irrep_SV(k)
    E = List_Mult_Irrep_E_SV_even(k)
    L = [M[a]-E[a] for a in range(11)]
    return L

def Dim_Cusp_Form_Total_SV_even(k):
    """
    Return the dimension of the subspace S_{k}(Gamma[2])
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d

def Mult_s6_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[6] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[0]
    return m

def Mult_s51_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[1]
    return m

def Mult_s42_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[2]
    return m


def Mult_s411_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,1,1] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[3]
    return m


def Mult_s33_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[4]
    return m  

def Mult_s321_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[3,2,1] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[5]
    return m  

def Mult_s3111_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[3,1^3] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[6]
    return m  

def Mult_s222_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^3] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[7]
    return m  

def Mult_s2211_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^2,1^2] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[8]
    return m 


def Mult_s21111_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2,1^4] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[9]
    return m 

def Mult_s111111_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[1^6] of S_6 in S_{k}(Gamma[2]).
    """
    L = List_Mult_Irrep_Cusp_Form_SV_even(k)
    m = L[10]
    return m 


"""
Saito-Kurokawa lifts, even weight 
"""

def Mult_s6_SK_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[6] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^10
    denom = (1-t^2)*(1-t^6)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s42_SK_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^8
    denom = (1-t^2)*(1-t^4)
    f = num / denom
    d = f.list()[k]
    return d

def Mult_s222_SK_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^3] of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=2*k+1)
    num = t^6
    denom = (1-t^2)*(1-t^4)
    f = num / denom
    d = f.list()[k]
    return d


def List_Mult_Irrep_SK_Cusp_Form_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S^{SK}_{k}(Gamma[2]).
    """
    s6 = Mult_s6_SK_Cusp_Form_SV_even(k)
    s51 = 0
    s42 = Mult_s42_SK_Cusp_Form_SV_even(k)
    s411 = 0
    s33 = 0
    s321 = 0
    s3111 = 0
    s222 = Mult_s222_SK_Cusp_Form_SV_even(k)
    s2211 = 0
    s21111 = 0
    s111111 = 0
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Dim_SK_Cusp_Form_Total_SV_even(k):
    """
    Return the dimension of the subspace S^{SK}_{k}(Gamma[2]).
    """
    L = List_Mult_SK_Cusp_Form_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d


"""
Genuine cusp forms even weight
"""


def Mult_s6_gen_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[6] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s6_Cusp_Form_SV_even(k)
    b = Mult_s6_SK_Cusp_Form_SV_even(k)
    d = a-b
    return d

def Mult_s42_gen_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s42_Cusp_Form_SV_even(k)
    b = Mult_s42_SK_Cusp_Form_SV_even(k)
    d = a-b
    return d

def Mult_s222_gen_Cusp_Form_SV_even(k):
    """
    Compute the multiplicity of the rep. s[2^3] of S_6 in S^{gen}_{k}(Gamma[2]).
    """
    a = Mult_s222_Cusp_Form_SV_even(k)
    b = Mult_s222_SK_Cusp_Form_SV_even(k)
    d = a-b
    return d



def List_Mult_Irrep_gen_Cusp_Form_SV_even(k):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S^{gen}_{k}(Gamma[2]) as a list.
    """
    s6 = Mult_s6_gen_Cusp_Form_SV_even(k)
    s51 = Mult_s51_Cusp_Form_SV_even(k)
    s42 = Mult_s42_gen_Cusp_Form_SV_even(k)
    s411 = Mult_s411_Cusp_Form_SV_even(k)
    s33 = Mult_s33_Cusp_Form_SV_even(k)
    s321 = Mult_s321_Cusp_Form_SV_even(k)
    s3111 = Mult_s3111_Cusp_Form_SV_even(k)
    s222 = Mult_s222_gen_Cusp_Form_SV_even(k)
    s2211 = Mult_s2211_Cusp_Form_SV_even(k)
    s21111 = Mult_s21111_Cusp_Form_SV_even(k)
    s111111 = Mult_s111111_Cusp_Form_SV_even(k)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L

def Dim_gen_Cusp_Form_Total_SV_even(k):
    """
    Return the dimension of the subspace S^{gen}_{k}(Gamma[2])
    """
    L = List_Mult_gen_Cusp_Form_SV_even(k)
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d

def Dim_List(L):
    """
    Return the dimension of the space whose isotypical decomposition is given by L
    """
    d = 1*L[0]+ 5*L[1] + 9*L[2] + 10*L[3] + 5*L[4]+ 16*L[5] + 10*L[6] + 5*L[7] + 9*L[8] + 5*L[9]+ 1*L[10]
    return d


def List_Mult_Irrep_SV_odd(k):
    """
    Return for k odd the list of the isotypical decomposition of 
    Total space,
    Total cusp space
    E (Eisenstein),
    Eis (type F),
    KE (type Q),
    Saito-Kurokawa (type P)
    Yosh (type Y)
    Genuine (type G)
    The output is a list of 8 lists with 12 elements.
    """
    Total = List_Mult_Irrep_SV(k)
    Totalwd = [Total, Dim_List(Total)]
    Total_Cusp = List_Mult_Irrep_SV(k)
    Total_Cuspwd = [Total_Cusp,Dim_List(Total_Cusp)]
    E = [0,0,0,0,0,0,0,0,0,0,0]
    Ewd = [E,Dim_List(E)]
    Eis = [0,0,0,0,0,0,0,0,0,0,0]
    Eiswd = [Eis,Dim_List(Eis)]
    KE = [0,0,0,0,0,0,0,0,0,0,0]
    KEwd = [KE,Dim_List(KE)]
    SK = List_Mult_Irrep_SK_SV_odd(k)
    SKwd = [SK,Dim_List(SK)]
    Yosh = [0,0,0,0,0,0,0,0,0,0,0]
    Yoshwd = [Yosh,Dim_List(Yosh)]
    Gen = List_Mult_Irrep_gen_SV_odd(k)
    Genwd = [Gen,Dim_List(Gen)]
    L = [Totalwd, Total_Cuspwd, Ewd, Eiswd, KEwd, SKwd, Yoshwd, Genwd]
    return L


def List_Mult_Irrep_SV_even(k):
    """
    Return for k even the list of the isotypical decomposition of 
    Total space,
    Total cusp space
    E (Eisenstein),
    Eis (type F),
    KE (type Q),
    Saito-Kurokawa (type P)
    Yosh (type Y)
    Genuine (type G)
    The output is a list of 8 lists with 11 elements.
    """
    Total = List_Mult_Irrep_SV(k)
    Totalwd = [Total, Dim_List(Total)]
    Total_Cusp = List_Mult_Irrep_Cusp_Form_SV_even(k)
    Total_Cuspwd = [Total_Cusp,Dim_List(Total_Cusp)]
    E = List_Mult_Irrep_E_SV_even(k)
    Ewd = [E,Dim_List(E)]
    Eis = List_Mult_Irrep_Eis_SV_even(k)
    Eiswd = [Eis,Dim_List(Eis)]
    KE = List_Mult_Irrep_KE_SV_even(k)
    KEwd = [KE,Dim_List(KE)]
    SK = List_Mult_Irrep_SK_Cusp_Form_SV_even(k)
    SKwd = [SK,Dim_List(SK)]
    Yosh = [0,0,0,0,0,0,0,0,0,0,0]
    Yoshwd = [Yosh,Dim_List(Yosh)]
    Gen = List_Mult_Irrep_gen_Cusp_Form_SV_even(k)
    Genwd = [Gen,Dim_List(Gen)]
    L = [Totalwd, Total_Cuspwd, Ewd, Eiswd, KEwd, SKwd, Yoshwd, Genwd]
    return L

  
def All_List_Mult_Irrep_SV(k):
    """
    Put everything together
    """
    k = ZZ(k)
    
    if k % 2 == 1: 
      return List_Mult_Irrep_SV_odd(k)
    else:
      return List_Mult_Irrep_SV_even(k)

"""
The vector-valued case 
"""
load('Generating_Series_Cusp_Forms_j_2_to_50.sage')
load('Generating_Series_Mod_Forms_j_2_to_50.sage')

LC = [LC2,LC4,LC6,LC8,LC10,LC12,LC14,LC16,LC18,LC20,LC22,LC24,LC26,LC28,LC30,LC32,LC34,LC36,LC38,LC40,LC42,LC44,LC46,LC48,LC50]
LM = [LM2,LM4,LM6,LM8,LM10,LM12,LM14,LM16,LM18,LM20,LM22,LM24,LM26,LM28,LM30,LM32,LM34,LM36,LM38,LM40,LM42,LM44,LM46,LM48,LM50]


def Pick_j(j,L):
    """
    Return the list of the m
    """
    if j % 2 == 1:
      return [0,0,0,0,0,0,0,0,0,0,0]
    else:
      return L[j/2-1][1]


def Mult_s6_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the trivial rep. of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[0]
    d = f.list()[k]
    return d

def Mult_s51_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[1]
    d = f.list()[k]
    return d

def Mult_s42_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[2]
    d = f.list()[k]
    return d

def Mult_s411_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[4,1,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[3]
    d = f.list()[k]
    return d

def Mult_s33_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[4]
    d = f.list()[k]
    return d

def Mult_s321_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,2,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[5]
    d = f.list()[k]
    return d

def Mult_s3111_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,1,1,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[6]
    d = f.list()[k]
    return d

def Mult_s222_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,2,2] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[7]
    d = f.list()[k]
    return d

def Mult_s2211_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,2,1,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[8]
    d = f.list()[k]
    return d

def Mult_s21111_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,1,1,1,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[9]
    d = f.list()[k]
    return d

def Mult_s111111_Cusp_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[1,1,1,1,1,1] of S_6 in S_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LC)
    f = L[10]
    d = f.list()[k]
    return d

def List_Mult_Irrep_Cusp_Form_VV(k,j):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S_{k,j}(Gamma[2]) as a list, k>=3.
    """
    s6 = Mult_s6_Cusp_Form_VV(k,j)
    s51 = Mult_s51_Cusp_Form_VV(k,j)
    s42 = Mult_s42_Cusp_Form_VV(k,j)
    s411 = Mult_s411_Cusp_Form_VV(k,j)
    s33 = Mult_s33_Cusp_Form_VV(k,j)
    s321 = Mult_s321_Cusp_Form_VV(k,j)
    s3111 = Mult_s3111_Cusp_Form_VV(k,j)
    s222 = Mult_s222_Cusp_Form_VV(k,j)
    s2211 = Mult_s2211_Cusp_Form_VV(k,j)
    s21111 = Mult_s21111_Cusp_Form_VV(k,j)
    s111111 = Mult_s111111_Cusp_Form_VV(k,j)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L


def Mult_s6_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the trivial rep. of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[0]
    d = f.list()[k]
    return d

def Mult_s51_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[5,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[1]
    d = f.list()[k]
    return d

def Mult_s42_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[4,2] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[2]
    d = f.list()[k]
    return d

def Mult_s411_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[4,1,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[3]
    d = f.list()[k]
    return d

def Mult_s33_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,3] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[4]
    d = f.list()[k]
    return d

def Mult_s321_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,2,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[5]
    d = f.list()[k]
    return d

def Mult_s3111_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[3,1,1,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[6]
    d = f.list()[k]
    return d

def Mult_s222_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,2,2] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[7]
    d = f.list()[k]
    return d

def Mult_s2211_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,2,1,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[8]
    d = f.list()[k]
    return d

def Mult_s21111_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[2,1,1,1,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[9]
    d = f.list()[k]
    return d

def Mult_s111111_Mod_Form_VV(k,j):
    """
    Compute the multiplicity of the rep. s[1,1,1,1,1,1] of S_6 in M_{k,j}(Gamma[2]), k>=3.
    """
    R.<t> = PowerSeriesRing(ZZ, default_prec=k+1)
    L = Pick_j(j,LM)
    f = L[10]
    d = f.list()[k]
    return d

def List_Mult_Irrep_Mod_Form_VV(k,j):
    """
    Return the multiplicities of the 11 irrep. of S_6 in M_{k,j}(Gamma[2]) as a list, k>=3.
    """
    s6 = Mult_s6_Mod_Form_VV(k,j)
    s51 = Mult_s51_Mod_Form_VV(k,j)
    s42 = Mult_s42_Mod_Form_VV(k,j)
    s411 = Mult_s411_Mod_Form_VV(k,j)
    s33 = Mult_s33_Mod_Form_VV(k,j)
    s321 = Mult_s321_Mod_Form_VV(k,j)
    s3111 = Mult_s3111_Mod_Form_VV(k,j)
    s222 = Mult_s222_Mod_Form_VV(k,j)
    s2211 = Mult_s2211_Mod_Form_VV(k,j)
    s21111 = Mult_s21111_Mod_Form_VV(k,j)
    s111111 = Mult_s111111_Mod_Form_VV(k,j)
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L

load('DimFormulaPlusMinusNewFormGamma0.sage')

def List_Mult_Irrep_Yoshida_Lift_VV(k,j):
    """
    Return the multiplicities of the 11 irrep. of S_6 in S^{Y}_{k,j}(Gamma[2]) as a list, k>=3.
    """
    k1 = j+2*k-2
    k2 = j+2
    dk1p = dimension_new_cusp_forms_plus_level_2(k1)
    dk2p = dimension_new_cusp_forms_plus_level_2(k2)
    dk1m = dimension_new_cusp_forms_minus_level_2(k1)
    dk2m = dimension_new_cusp_forms_minus_level_2(k2)
    s6 = 0
    s51 = 0
    s42 = 0
    s411 = 0
    s33 = 0
    s321 = 0
    s3111 = 0
    s222 = dk1p*dk2p+dk1m*dk2m
    s2211 = 0
    s21111 = dimension_new_cusp_forms(Gamma0(4),k1)*dimension_new_cusp_forms(Gamma0(4),k2)
    s111111 = dk1p*dk2m+dk1m*dk2p
    L = [s6,s51,s42,s411,s33,s321,s3111,s222,s2211,s21111,s111111]
    return L

def List_Mult_Irrep_VV_odd(k,j):
    """
    Return for k odd the list of the isotypical decomposition of 
    Total space,
    Total cusp space
    E (Eisenstein),
    Eis (type F),
    KE (type Q),
    Saito-Kurokawa (type P)
    Yosh (type Y)
    Genuine (type G)
    The output is a list of 8 lists with 12 elements.
    """
    Total = List_Mult_Irrep_Mod_Form_VV(k,j)
    Totalwd = [Total, Dim_List(Total)]
    Total_Cusp = List_Mult_Irrep_Cusp_Form_VV(k,j)
    Total_Cuspwd = [Total_Cusp,Dim_List(Total_Cusp)]
    E = [0,0,0,0,0,0,0,0,0,0,0]
    Ewd = [E,Dim_List(E)]
    Eis = [0,0,0,0,0,0,0,0,0,0,0]
    Eiswd = [Eis,Dim_List(Eis)]
    KE = [0,0,0,0,0,0,0,0,0,0,0]
    KEwd = [KE,Dim_List(KE)]
    SK = [0,0,0,0,0,0,0,0,0,0,0]
    SKwd = [SK,Dim_List(SK)]
    Yosh = List_Mult_Irrep_Yoshida_Lift_VV(k,j)
    Yoshwd = [Yosh,Dim_List(Yosh)]
    Gen = [Total_Cusp[x]-Yosh[x] for x in range(11)]
    Genwd = [Gen,Dim_List(Gen)]
    L = [Totalwd, Total_Cuspwd, Ewd, Eiswd, KEwd, SKwd, Yoshwd, Genwd]
    return L

def List_Mult_Irrep_VV_even(k,j):
    """
    Return for k even the list of the isotypical decomposition of 
    Total space,
    Total cusp space
    E (Eisenstein),
    Eis (type F),
    KE (type Q),
    Saito-Kurokawa (type P)
    Yosh (type Y)
    Genuine (type G)
    The output is a list of 8 lists with 12 elements.
    """
    Total = List_Mult_Irrep_Mod_Form_VV(k,j)
    Totalwd = [Total, Dim_List(Total)]
    Total_Cusp = List_Mult_Irrep_Cusp_Form_VV(k,j)
    Total_Cuspwd = [Total_Cusp,Dim_List(Total_Cusp)]
    E = [Total[x]-Total_Cusp[x] for x in range(11)]
    Ewd = [E,Dim_List(E)]
    Eis = [0,0,0,0,0,0,0,0,0,0,0]
    Eiswd = [Eis,Dim_List(Eis)]
    KE = E
    KEwd = [KE,Dim_List(KE)]
    SK = [0,0,0,0,0,0,0,0,0,0,0]
    SKwd = [SK,Dim_List(SK)]
    Yosh = List_Mult_Irrep_Yoshida_Lift_VV(k,j)
    Yoshwd = [Yosh,Dim_List(Yosh)]
    Gen = [Total_Cusp[x]-Yosh[x] for x in range(11)]
    Genwd = [Gen,Dim_List(Gen)]
    L = [Totalwd, Total_Cuspwd, Ewd, Eiswd, KEwd, SKwd, Yoshwd, Genwd]
    return L


def All_List_Mult_Irrep_VV(k,j):
    """
    Put everything together
    """
    k = ZZ(k)
    
    if k % 2 == 1: 
      return List_Mult_Irrep_VV_odd(k,j)
    else:
      return List_Mult_Irrep_VV_even(k,j)



"""
To do for N>=3
- j>=1 k=0, 1, 2, 3, 4
- Dimnension of the spaces of non-cusp forms.
- Dimension of Yoshida lifts
- Dimension of Saito-Kurokawa lifts
- Other lifts? (cube transfer?)
- ...
"""    
