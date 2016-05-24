% Loading image
filename = 'video0011.avi';
%Check if file is located in Matlab search path:
if exist('partikkel_20X_15fps.avi','file')
    movieobj = VideoReader(filename); % lager et <1x1 mmreader> object
    get(movieobj);
else %read manually
    disp(['Cannot find file with name: ' filename])
    disp 'Loading manually: '
    [filename,filepath]=uigetfile('*.avi','Pick videofile for analysis');
    filename=[filepath filename];
    movieobj=VideoReader(filename);
    get(movieobj);
end

% Info from movieobj
nFrames = movieobj.NumberOfFrames; % gets number of frames
width = movieobj.Width; % gets width in px
height = movieobj.Height; % get height in px
frames=read(movieobj,1);
a=double(frames(:,:,2,1));
figure(1)
imagesc(a), colorbar;
dim_part_c=input('Give typical diameter in pixles: ','s');
dim_part=str2num(dim_part_c);
%The diameter for the particle should be an even number. Else centrd() will
%give errormessages.
%Checking if dim_part is odd
if rem(dim_part,2)
    dim_part = dim_part+1; % dim_part is now an even number
end
b=bpass(a,1,dim_part);
imagesc(b), colorbar;
string_thresh = 'Gice threshold to distinguish particles from background ';
threshold_c=input(string_thresh,'s');
threshold=str2num(threshold_c);

poslist=[]; %Initializing list of positions 

m=1;
n=1;
%Gathering statistics
h = waitbar(0,'Finding particles');
%Takes time. Progress bar:
for k=1:nFrames
  
    frames=read(movieobj,k);
    a=double(frames(:,:,2,1));
    b=bpass(a,1,dim_part);
    pk = pkfnd(b,threshold,dim_part/2);
    cnt = cntrd(b,pk,dim_part/2);  % midpoint of each particle
    %Ignore possible warnings
    
%     %Test
%     figure(k),imagesc(b),hold on,plot(cnt(:,1),cnt(:,2),'go'),hold off
    
    np=size(cnt,1); %number of particles
    
    poslist(m:m+np-1,1:3)=[cnt(:,1:2) n*ones(np,1)];
    
    m=m+np;
    n=n+1;
    waitbar(k/nFrames,h,['Finding particles. '...
        num2str(floor(100*k/nFrames)) '% done!'])
end
close(h)

trackmatrix = track(poslist,10);

trackmatrix_new = [];
k=1;
m=1;
%Only keeping particles that is in every frame.
for i=1:trackmatrix(end)
    T = find(trackmatrix(:,4) == i);
    tsize = size(T);
    if(tsize(1) == nFrames)
       trackmatrix_new(m:m+nFrames-1,1:4) = [trackmatrix(T,1:3) k*ones(nFrames,1)];
       m=m+nFrames;
       k=k+1;
    end
    
end

save('trackmatrix_test_5min2','trackmatrix')
save('trackmatrix_new_test_5min2','trackmatrix_new')