% node_realn_sphere: generate node configurations in space
% this will output randRc, randDc, and randE

tic

coun_i=0;

% This for loop generates n_node number of nodes in space
% including the RC at the origin
for n_node=14:10:204
    coun_i=coun_i+1;
    
    rnRc = [];
    rnDc = [];
    % realn_node is the number of realizations
    for r_node = 1:10000
            
    min_length=7;
    min_dep=12;
    radii=38.7931;
%     radii=45.0;
    % number of sites within the sphere
    dc1 = [-0.5844   -0.6714   -0.4557];
    dc2 = [0.6119    0.6008   -0.5144];
    
    randDc_unnormd = [dc1; dc2; 2*rand(n_node,1)-1 2*rand(n_node,1)-1 2*rand(n_node,1)-1];
    randDc = normr(randDc_unnormd);
    % nomalized dipole vector of sites in cartesian coordinates,
    % size num*3
    
    % location of RC: same as in the PSI structure.
    % Note: the center of the two nodes is the origin.
    rc1 = [-0.1255    3.1630   -0.1775];
    rc2 = [0.1255   -3.1630    0.1775];
    
    randRc=[rc1; rc2];
        while size(randRc,1)<n_node+2 
   
            dist2=0;
            dist2_rc=0;
                while (dist2<min_length^2 || dist2_rc1<min_dep^2 || dist2_rc2<min_dep^2)
               
                point = [radii*rand()^(1/3) 2*pi*rand() 2*asin(sqrt(rand()))];
                point = point(1)*[sin(point(2))*cos(point(3)) sin(point(2))*sin(point(3)) cos(point(2))];
                
                dist2 = min(sum(bsxfun(@minus,point,randRc).^2,2));
                dist2_rc1 = sum((point-rc1).^2);
                dist2_rc2 = sum((point-rc2).^2);

                end
            randRc=[randRc;point];
        end
        
    rnRc(:,:,r_node) = randRc;
    rnDc(:,:,r_node) = randDc;
    
    end
    
    rc_sph{coun_i} = rnRc;
    dc_sph{coun_i} = rnDc;
    
    
end

toc
str_r_node = int2str(r_node);
str_n_node = int2str(n_node);
str_radii = int2str(radii);
savefile = ['realn_sphere_p2_','maxN_',str_n_node,'+2','_realn_',str_r_node,'_radii_',str_radii];
save(savefile,'rc_sph','dc_sph');
