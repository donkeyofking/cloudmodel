function [Ex,En,He] = BackwardCloud(Cloud,u)
% 逆向向云发生器 BackwardCloud
% 期望(Expectation) Ex;熵(Entropy) En;超熵(Hyper Entropy) He
%  [Ex,En,He] = BackwardCloud(Cloud,u)
% 输入参数：   Cloud    云滴(N个)
%             u      云滴的确定度(N个)(没有确定度直接由Cloud计算)
%
% 输出参数：   Ex    期望
%             En    熵
%             He    超熵
%
N = length(Cloud);
MeanValue = sum(Cloud)/N;  % 平均值--也可以利用中值
var = sum((Cloud - MeanValue).^2)./(N-1);  % 样本方差
if(nargin < 2)  % 无确定度u的计算
    AbsCenter = sum(abs(Cloud - MeanValue))/N; % 一介样本绝对中心距 
    Ex = MeanValue;
    En = sqrt(pi/2) * AbsCenter;
    He = sqrt(var - En^2);  % 标准差
else % 有确定度u的计算   Ex = MeanValue;
   En = sqrt(var);  % Cloud的标准差
   Enn = sqrt(-(Cloud - Ex).^2./(2 * log(u)));
   EnnMean = sum(Enn)/N;
   He = sqrt(sum((Enn - EnnMean).^2)/(N-1));  % Enn标准差
end;