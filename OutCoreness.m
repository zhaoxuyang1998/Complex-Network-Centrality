function coreness = OutCoreness(A)
% Coreness: To compute the out coreness of a complex network, based on 
%           H-index update algorithm. 
% Ref: L�� L, et al. The H-index of a network node and its relation to
%      degree and coreness[J]. Nature communications, 2016, 7.
% See also: Coreness, InCoreness, Hindex
% Version 2017.02.13
%%  Inputs: 
%     A - The adjacent matrix of a complex network. The (i,j) entity is 1
%     if node i points to node j.
%%  Outputs:
%     coreness - The out coreness of a complex network. 
%%  Example:
% If we have a complex network with adjacent matrix A, we can run following
% code to obtain the out coreness.
% ###########code############
% h = OutCoreness(A); 
% ###########code############

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complex Network Centrality:                              %
%                                                          %
% Copyright (C) 2017 Shuang Xu. All rights reserved.       %
%                    henuxs@foxmail.com                    %
%                    b.sawako@outlook.com                  %
%                                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Code begins
A = sparse(A);
OutDeg = OutDegree(A);
N = length(OutDeg);

err = [1];
while sum(err)~=0
    for i=1:N
        OutNeighborIndex = logical(A(i,:));
        OutNeighborDegree = OutDeg(OutNeighborIndex);
        NodeHindex(i,1) = Hindex(OutNeighborDegree);
    end
    err = norm(OutDeg-NodeHindex,1);
    OutDeg = NodeHindex;
end

coreness = NodeHindex;