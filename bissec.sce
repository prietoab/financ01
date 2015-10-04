// ************************************************************
// calcula a raiz de f(x) no intervalo [a,b]
// com precisão eps1
// ************************************************************
// Autor: Prof. Pedro A. Tonelli, Matemática Aplicada, IME, USP
// Link:
//      http://www.ime.usp.br/~tonelli/map0151/?tp=3&pg=4
//      Acessado em 21/09/2015, 10:14.
// ************************************************************
//
// + Coloque o arquivo bissec1.sci no diretório onde você vai abrir o SCILAB
// ou qualquer lugar, desde que você saiba onde).
//
// + Inicie o SCILAB e carregue a função com o comando: getf("bissec1.sci").
//
// + defina uma função por exemplo: function y=f(x), y=x^6-x-1; endfunction.
//
// + execute a função: [raiz, iter] = bissec1(f,1,2,0.001)

// ***************************************************************
// Aulas sobre o método:
//      https://www.youtube.com/watch?v=RMjMgC2CuLk
//      
// ***************************************************************

function [raiz,iter]=bissec1(f,a,b,eps1),
    x0=a;
    x1=b;
    xm=(x0+x1)./2;
    it=0;
    
    printf("\n\n");
    
    printf("it \t");
    printf("x0 \t");
    printf("x1 \t");
    printf("xm \t");
    printf("f(xm) \t");
    printf("abs(f(xm)) \t");
    printf("x1-x0 \t");
    printf("tolerancia");    
    printf("\n");
    
    printf("%d \t", it);
    printf("%f \t", x0);
    printf("%f \t", x1);
    printf("%f \t", xm);
    printf("%f \t", f(xm));
    printf("%f \t", abs(f(xm)));
    printf("%f \t", (x1-x0));
    printf("%f \t", eps1);    
    printf("\n");
    
    while (min(abs(f(xm)),(x1-x0)) > eps1) & it<=150 do
        if f(x0).*f(xm) > 0 then 
            x0=xm;
        else
            x1=xm;
        end;
        xm=(x0+x1)./2;
        it=it+1;
        
        printf("%d \t", it);
        printf("%f \t", x0);
        printf("%f \t", x1);
        printf("%f \t", xm);
        printf("%f \t", f(xm));
        printf("%f \t", abs(f(xm)) );
        printf("%f \t", (x1-x0) );
        printf("%f \t", eps1);        
        printf("\n");
        
    end;
    raiz=xm;
    iter=it;
    
    printf("\n\n");
    
endfunction;

// ------------------------------------------------------------------
clc;

t_limite_inferior = 0;
t_limite_superior = 1;

C0 = 100000;
n = 200;
p = 1000;
T=[-0.2:0.003:1];
qtdeIteracoes = -1;
precisao = 0.0000001;

// Obs: a precisão não é em T, mas em S(n) = 0.

// ------------------------------------------------------------------
function y=S(T), y = C0*(1+T)^n - p/T*( (1 + T)^n - 1); endfunction;
// ------------------------------------------------------------------

plot(T,S,T,0);

[T, qtdeIteracoes] = bissec1(S, t_limite_inferior, t_limite_superior, precisao); 

printf("\n");
printf("T = %f \n", T);
printf("T = %f por cento\n", T*100);
printf("qtdeIteracoes = %d \n", qtdeIteracoes);
