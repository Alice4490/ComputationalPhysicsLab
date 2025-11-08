module LinearSystems

export forward_substitution, backward_substitution, forward_substitution_matrix, backward_substitution_matrix,
       LU_decomposition_eff, determinante, LU_solution, row_pivoting, determinante_rp, row_pivoting_solution, normal_equations, inverse_2x2, norma_1, thin_QR_decomposition, thin_QR_solution

using LinearAlgebra

function forward_substitution(L::AbstractMatrix, b::AbstractVector)       #risoluzione di un sistema lineare con matrice triangolare inferiore
    n = size(L, 1)
    if size(L, 2) != n || length(b) != n                        
        throw(ArgumentError("Matrix L must be square"))                   #controllo matrice quadrata
    end
    for i in 1:n 
        if L[i, i] == 0
            throw(ArgumentError("Matrix L is singular"))                  #controllo elemento diagonale di L diverso da zero
        end
    end
    x = similar(b, Float64)
    x[1] = b[1] / L[1, 1]
    for i in 2:n
        S =  0.0
        for j in 1:i-1
            S += L[i, j] * x[j]
        end
        x[i] = (b[i] - S)/ L[i, i]
    end

    return x
end


function backward_substitution(U::AbstractMatrix, b::AbstractVector)      #risoluzione di un sistema lineare con matrice triangolare superiore
    n = size(U, 1)
    if size(U, 2) != n || length(b) != n
        throw(ArgumentError("Matrix U must be square"))                   #controllo matrice quadrata
    end
    for i in 1:n
        if U[i, i] == 0                                                   #controllo elemento diagonale di U diverso da zero
            throw(ArgumentError("Matrix U is singular"))
        end
    end
    x = similar(b, Float64)
    x[n] = b[n] / U[n, n]
    for i in n-1:-1:1
        S = 0.0
        for j in i+1:n
            S += U[i, j] * x[j]
        end
        x[i] = (b[i] - S) / U[i, i]
    end

    return x
end

function forward_substitution_matrix(L::AbstractMatrix, B::AbstractMatrix)       #risoluzione di p sistemi lineari con matrice triangolare inferiore
    n = size(B,1)
    p = size(B,2)
    if size(L,1) != n || size(L,2) != n 
        throw(ArgumentError("Matrix L must be square and compatible with B"))    #controllo matrice quadrata e compatibilità tra L e B
    end
    for i in 1:n 
        if L[i, i] == 0
            throw(ArgumentError("Matrix L is singular"))               #controllo elemento diagonale di L diverso da zero
        end
    end
    X = similar(B, Float64)
    for k in 1:p
        X[1, k] = B[1, k] / L[1, 1]
        for i in 2:n
            S = 0.0
            for j in 1:i-1
                S += L[i, j] * X[j, k]
            end
            X[i, k] = (B[i, k] - S) / L[i, i]
        end
    end
    return X
end

function backward_substitution_matrix(U::AbstractMatrix, B::AbstractMatrix)        #risoluzione di p sistemi lineari con matrice triangolare superiore
    n = size(B,1)
    p = size(B,2)
    if size(U, 1) != n || size(U,2) != n
        throw(ArgumentError("Matrix U must be square and compatible with B"))   #controllo matrice quadrata e compatibilità tra U e B
    end
    for i in 1:n
        if U[i, i] == 0
            throw(ArgumentError("Matrix U is singular"))                      #controllo elemento diagonale di U diverso da zero
        end
    end
    X = similar(B, Float64)
    for k in 1:p
        X[n, k] = B[n, k] / U[n, n]
        for i in n-1:-1:1
            S = 0.0
            for j in i+1:n
                S += U[i, j] * X[j, k]
            end
        X[i, k] = (B[i, k] - S) / U[i, i]
        end
    end
     return X
end

function inverse(A::AbstractMatrix)
    X = forward_substitution_matrix(A, I)
    return X
end


function LU_decomposition_eff(A::AbstractMatrix)                        #LU decomposition ottimizzata
    n = size(A,1)

    if size(A,1) != n || size(A,2) != n
        throw(ArgumentError("Matrix A must be square"))                 #controllo matrice quadrata
    end
    
    L = diagm(ones(n))
    U = zeros(n,n);
    
    for i in 1:n
        U[i,i:n] = A[i,i:n]  #ottimizzazione: non fa calcoli su zeri di U, che è una matrice triangolare superiore
    
        if U[i, i] == 0
                throw(ArgumentError("Matrix U is singular"))         #controllo elemento diagonale di U
        end
        
        L[i+1:n,i] = A[i+1:n,i]/U[i,i]
        A = A - L[:,i]*U[i,:]'
    end
    
    return L, U
end

function determinante(A::AbstractMatrix)
    L, U = LU_decomposition_eff(A)
    return prod(diag(U))
end

function LU_solution(A::AbstractMatrix, b::AbstractVector)          #soluzione di un sistema lineare con LU decomposition
    L, U = LU_decomposition_eff(A)
    z = forward_substitution(L, b)
    x = backward_substitution(U, z)
    return x
end


function row_pivoting(A::AbstractMatrix)
    n = size(A,1)

    if size(A,1) != n || size(A,2) != n                         #controllo matrice quadrata
        throw(ArgumentError("Matrix A must be square"))
    end

    L_1 = diagm(ones(n))
    U = zeros(n,n);
    index = collect(1:n)
    P = zeros(n,n)
    for i in 1:n
        j = argmax( abs.(A[:,i]) ) 
        index[i] = j
        P[i,j] = 1
        U[i,i:n] = A[j,i:n]    #ottimizzazione: non fa calcoli su zeri di U, che è una matrice triangolare superiore
    
        if U[i, i] == 0
                throw(ArgumentError("Matrix A is singular"))       #controllo elemento diagonale di U
        end
        
        L_1[:,i] = A[:,i]/U[i,i]
        A = A - L_1[:,i]*U[i,:]'
    end
    L = P*L_1
    return L, U, P
end


function det_permutation_Imatrix(P::AbstractMatrix)              #calcola il determinante della matrice di permutazione 
    n = size(P,1)
    p = zeros(n)
    for i in 1:n
        for j in 1:n
            if P[i,j] == 1
                p[i] = j
            end
        end
    end
    
    S = 0 
    for i in 1:n
        for j in i+1:n
            if p[i] > p[j]
                S += 1
                i += 1   #se S si aggiorna passa al confronto successivo
            end
        end
    end
    return (-1)^S
end


function determinante_rp(A::AbstractMatrix)             #determinante con row pivoting
    n = size(A,1)
    _, U, P = row_pivoting(A)
    det_P = det_permutation_Imatrix(P)
    det_A = det_P * prod(diag(U))
    return det_A
end



function row_pivoting_solution(A::AbstractMatrix, b::AbstractVector)       #risoluzione di un sistema lineare con row pivoting
    L, U, P = row_pivoting(A)
    z = forward_substitution(L, P*b)
    x = backward_substitution(U, z)
    return x
end



function trasporta(A)
    m, n = size(A)
    AT = zeros(n, m)
    for i in 1:m
        for j in 1:n
            AT[j, i] = A[i, j]
        end
    end
    return AT
end

function normal_equations(A::AbstractMatrix, b::AbstractVector)
    x = row_pivoting_solution(A' * A, A' * b)
    return x
end

function inverse_2x2(A::AbstractMatrix)
    if size(A,1) != 2 || size(A,2) != 2
        throw(ArgumentError("Matrix A must be 2x2"))
    end
    det_A =A[1,1]*A[2,2] - A[1,2]*A[2,1]
    if det_A == 0
        throw(ArgumentError("Matrix A can't be inverted"))
    end
    return 1/det_A * [A[2,2] -A[1,2]; -A[2,1] A[1,1]]
end


function norma_1(A::AbstractMatrix)
    n = size(A,1)
    m = size(A,2)
    somme = zeros(m)

    for j in 1:m
        s = 0.0
        for i in 1:n
            s += abs(A[i,j])
        end
    somme[j] = s
    end
    return maximum(somme)
end


function thin_QR_decomposition(A::AbstractMatrix)
    m, n = size(A)
    Q = zeros(m,n)
    R = zeros(n,n)
    
    for j in 1:n
        v = A[:, j]

        for i in 1:j-1
            v = v - Q[:, i] * (Q[:, i]' * v)
            R[i, j] = (Q[:, i]' * v)
        end
        Q[:, j] = v / norm(v)
        R[j, j] = (Q[:, j]' * v)
    end

    return Q, R
end

function thin_QR_solution(A::AbstractMatrix, b::AbstractVector)          #soluzione di un sistema lineare con QR decomposition
    Q, R = thin_QR_decomposition(A)
    z = Q' * b
    x = backward_substitution(R, z)
    return x
end


end


