%Grupo 1

function [c] = MinQuadrados (x,y,wt) 
%Nota de auxilio:Vetores devem ser inseridos na forma: [a1 a2 ...an]
%RETURN
%c-Matriz contendo os parametros a0,a1,...,an que constituem a função final

%PARAMETROS:
%x-Array contendo as coordenadas x dos pontos a ajustar
%y-Array contendo as coordenadas y dos pontos a ajustar
%wt-Array os pesos associados aos pares (x,y)
syms t;
f=input('Insira o conjunto de funções f(t) (USAR VARIAVEL t):\n');
%f-Função a utilizar (DEVE SER DADA EM ORDEM À VAR. 't')


if(numel(x) ~= numel(y) || numel(x) ~= numel(wt))
    fprintf('Vetores x,y ou wt têm tamanhos diferentes');
    exit
end

%Construção da Matriz W
for i = 1:numel(wt)
    W(i,i) = wt(i);
end

%Construção da Matriz B 
B = zeros(numel(x),numel(f));
    
for j = 1:numel(f)
    eq = inline(f(j),'t');
    for i = 1:numel(x)
        B(i,j) =  eq(x(i));
    end
end

BT = transpose(B);
yt = transpose(y);

%Aplicação do método dos mínimos quadrados
P1 = inv(BT*W*B);
P2 = BT*W*yt;
c = P1*P2;

%Impressão
fprintf('A função resultante é\ng(x) = ');
for i= 1:numel(c)
    fprintf('%d*%s ', c(i),char(f(i)));
    if(i~=numel(c))
        fprintf('+ ');
    end
end
