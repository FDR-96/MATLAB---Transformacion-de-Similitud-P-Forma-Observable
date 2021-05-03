%   Descripcion: Se busca hallar la Forma controlable de una matriz de 2x2
%   dimensiones por medio de transformacion de similitud (P).
%   Autor: Roldan Federico
%   Version: v1.0

function [Az, Bz, Cz] = FormaObservable(A, B, C)
   N = [C ;C*A];
  disp(N);
%Hallamos el valor absoluto de la matriz A 
    Ad = -(A)';

%Obtenemos los autovalores
    s1 = Ad(1,1);
    s2 = Ad(2,2);
    s3 = Ad(2,1);
    s4 = Ad(1,2);
    a = 1;
    b = (s1+s2);
    c = ((s1*s2)-(s3*s4));
    mostrar = ['F(s)= ', num2str(a), 's^2+(',num2str(b), 's)+(',num2str(c),')'];
    disp(mostrar);

    x1= (-b+sqrt(b^2-4*a*c))/(2*a);
    x2= (-b-sqrt(b^2-4*a*c))/(2*a);
    mostrar = ['Raices de la Funcion F(s): '];
    disp(mostrar);
    mostrar = ['                           s1 = ', num2str(x1)];
    disp(mostrar);
    mostrar = ['                           s2 = ', num2str(x2)];
    disp(mostrar);
    W = [x1 1; 1 x2];
    disp(W);
    P = inv(W*N);
    Pinv = inv(P);
 %Mostramos los valores obtenidos
    disp('Matriz P:')
    disp(P);
    disp('Inversa de la Matriz P:')
    disp(Pinv);
  %Calculamos Az Bz Cz
    Az = (Pinv*A*P);
    Bz = Pinv*B;
    Cz = C*P; 
end