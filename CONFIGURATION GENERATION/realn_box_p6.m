% realn_box_p6: generate random networks in a box (fixing center 6 Chls)
% OUTPUT: rc, dc (cell array structure)
tic

coun_i=0;

for n_node=10:10:200
    coun_i=coun_i+1;
    rnRc = [];
    rnDc = [];

    % realn_node is the number of realizations
    for r_node = 1:10000 % 10000 takes ~40 min
        
    % the parameters below mimicks the realistic PSI structure
    min_length=7;
    min_dep=12;
    
    % define the size of the encapsulating box
    % PSI(1JB0) monomer is bounding in a box of size ~ 102.4*83.6*28.6
    box_x = 51.2;
    box_y = 41.8;
    box_z = 14.3;
    
    
    dc1 = [-0.5844   -0.6714   -0.4557];
    dc2 = [0.6119    0.6008   -0.5144];
    dc3 = [-0.9291    0.2515   -0.2710];
    dc4 = [0.9528   -0.2274   -0.2011];
    dc5 = [0.2690    0.5066    0.8191];
    dc6 = [-0.3151   -0.5467    0.7758];
    
    randDc_unnormd = [dc1; dc2; dc3; dc4; dc5; dc6; [2*rand(n_node,1)-1 2*rand(n_node,1)-1 2*rand(n_node,1)-1]];
    randDc = normr(randDc_unnormd);
    % nomalized dipole vector of sites in cartesian coordinates, size num*3

    % location of RC: same as in the PSI structure.
    % Note: the center of the two nodes is the origin.
    rc1 = [-0.1255    3.1630   -0.1775];
    rc2 = [0.1255   -3.1630    0.1775];
    rc3 = [-9.2265    1.0170   -7.2375];
    rc4 = [9.4285   -1.2540   -7.0815];
    rc5 = [-11.0275    1.9780  -15.7395];
    rc6 = [11.9575   -3.0200  -14.6995];
    
    randRc=[rc1; rc2; rc3; rc4; rc5; rc6];
        while size(randRc,1)<n_node+6 
   
            dist2=0;
            dist2_rc=0;
                while (dist2<min_length^2 || dist2_rc1<min_dep^2 || dist2_rc2<min_dep^2)
               
                point = [box_x*(2*rand()-1)
                         box_y*(2*rand()-1)
                         box_z*(2*rand()-1)]';    
                dist2 = min(sum(bsxfun(@minus,point,randRc).^2,2));
                dist2_rc1 = sum((point-rc1).^2);
                dist2_rc2 = sum((point-rc2).^2);

                end
            randRc=[randRc;point];
        end
        
    rnRc(:,:,r_node) = randRc;
    rnDc(:,:,r_node) = randDc;
    
    end
    
    rc{coun_i} = rnRc;
    dc{coun_i} = rnDc;
    
    
end

toc
str_r_node = int2str(r_node);
str_n_node = int2str(n_node);
savefile = ['realn_box_p6_','maxN_',str_n_node,'+6','_realn_',str_r_node];
save(savefile,'rc','dc');