function bw = adaptivethreshold(IM,ws,fudgeFactor)
%ADAPTIVETHRESHOLD An adaptive thresholding algorithm that seperates the
%foreground from the background with nonuniform illumination.
%  bw=adaptivethreshold(IM,ws,C) outputs a binary image bw with the local 
%   threshold mean-C or median-C to the image IM.
%  ws is the local window size.
%  tm is 0 or 1, a switch between mean and median. tm=0 mean(default); tm=1 median.
%
%  Contributed by Guanglei Xiong (xgl99@mails.tsinghua.edu.cn)
%  at Tsinghua University, Beijing, China.
%
%  For more information, please see
%  http://homepages.inf.ed.ac.uk/rbf/HIPR2/adpthrsh.htm

if (nargin<3)
    error('You must provide the image IM, the window size ws, and C.');
elseif (nargin==3)
    tm=0;
end

IM=mat2gray(IM);

if tm==0
    mIM=imfilter(IM,fspecial('average',ws),'replicate');
%     mIM1 = medfilt2(IM,ws);
%     mIM=medfilt2(IM,ws);
%     mIM2 = filter2(fspecial('gaussian',ws(1),ws(1)),IM);
else
end

sIM=mIM-IM;
% sIM = imcomplement(sIM);

thresh=graythresh(sIM);

% thresh = 1;
% [idx,c] = kmeans(sIM(:),2);

bw = imbinarize(sIM,thresh*fudgeFactor);
