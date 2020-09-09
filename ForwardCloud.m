% cloud drop generator

function [Cloud,u] = ForwardCloud(Ex,En,He,N)
% 正向云发生器 ForwardCloud
% 期望(Expectation) Ex;熵(Entropy) En;超熵(Hyper Entropy) He
%   [Cloud,u] = ForwardCloud(Ex,En,He,N)
% 输入参数：    Ex    期望
%              En    熵
%              He    超熵
%              N     产生云滴的个数,若没有默认为1
%
% 输出参数：    Cloud    云滴(N个)
%              u        云滴的确定度(N个)
         
if(nargin < 4)
    N = 1;
end;
for i = 1:N
    Enn = randn(1) * He + En;
    Cloud(i) = randn(1) * Enn + Ex;
    u(i) = exp(-(Cloud(i) - Ex)^2/(2 * Enn^2));
end;