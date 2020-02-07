% i
nx = 50;
ny = 55;
G = sparse(nx*ny,nx*ny); 

% ii
for i = 1:nx
   for j = 1:ny 
        n = j + (i-1)*ny;
        if i == 1
            G(n,n) = 1;
        elseif i == nx
            G(n,n) = 1;
        elseif j == 1
            G(n,n) = 1;
        elseif j == ny 
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + (i)*ny;
            nyp = (j+1) + (i-1)*ny;
            nym = (j-1) + (i-1)*ny;
            
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nyp) = 1;
            G(n,nym) = 1;
            if i<20 && i>10 && j<20 && j>10
                G(n,n) = -2;
            else
                G(n,n) = -4;
            end
       end
   end
end

figure (1)  % iv
spy(G);
grid on;

[E,D] = eigs(G,9,'SM');   % v

figure (2)      % vi
plot (D);
grid on;

% vii
for i = 1:nx
    for j = 1:ny
        n = j + (i - 1) * ny;

        Emap1(i, j) = E(n,1);
        Emap2(i, j) = E(n,2);
        Emap3(i, j) = E(n,3);
        Emap4(i, j) = E(n,4);
        Emap5(i, j) = E(n,5);
        Emap6(i, j) = E(n,6);
        Emap7(i, j) = E(n,7);
        Emap8(i, j) = E(n,8);
        Emap9(i, j) = E(n,9);
    end
end

figure (3)
subplot(3,3,1),surf(Emap1);
subplot(3,3,2),surf(Emap2);
subplot(3,3,3),surf(Emap3);
subplot(3,3,4),surf(Emap4);
subplot(3,3,5),surf(Emap5);
subplot(3,3,6),surf(Emap6);
subplot(3,3,7),surf(Emap7);
subplot(3,3,8),surf(Emap8);
subplot(3,3,9),surf(Emap9);
grid on;
