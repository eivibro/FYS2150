tr = trackmatrix_new;
numpart=max(tr(:,4));
trny=[];
trnum = [];

%Controlling the tracs to remove stuck particles
%Looping through all particles to control tracks.

figure(2), clf
hold on
m=1;
for n=1:numpart 
    I=find(tr(:,4)==n);
%     %Below lines gives the opertunity for manually controling the tracs
%     figure(1), plot(tr(I,1),tr(I,2))
%      godta=input('Accept/Decline the track? a/d: ','s');
%     if godta=='g'
%         trny=[trny;tr(I,:)];
%         trnum(m)=n;
%         m=m+1;
%         figure(2),plot(tr(I,1),tr(I,2),'g') %accepted tracks in green
%     else
%         figure(2)
%         plot(tr(I,1),tr(I,2),'r') % declined tracks in red
%     end
    %Only including the particles that move a certain length
    grense = 10; %Add appropriate limit to remove stuck particles
    ddxx = max(tr(I,1))-min(tr(I,1));
    ddyy = max(tr(I,2))-min(tr(I,2));
    if ddxx > grense && ddyy > grense
        figure(2)%, plot(tr(I,1),tr(I,2))
        trny=[trny;tr(I,:)];
        trnum(m)=n;
        m=m+1;
        plot(tr(I,1),tr(I,2),'g') %Accepted tracs in green
    else 
        plot(tr(I,1),tr(I,2),'r') % Declined tracs in red
    end
   
   %plot(trny(I,1))
end
figure(2), title 'Green: OK, Red: decline'
hold off
axis equal
xlabel('piksler i x-retning')
ylabel('piksler i y-retning')
tr=trny;
numpart=length(trnum);

set(gca, 'FontSize', 16)
saveas(gcf, '5mintracks', 'epsc')

% Calculating the movements
m=max(tr(:,3));
t=1:m;
sumdx=zeros(m,1);
sumdy=zeros(m,1);
for n=1:numpart % loop gjennom alle partiklene
    I=find(tr(:,4)==trnum(n));
    % Finding how far the particle has moved from the start position at
    % each time step.
    dx=tr(I,1)-tr(I(1),1);
    dy=tr(I,2)-tr(I(1),2);
    sumdx=sumdx+dx.^2;
    sumdy=sumdy+dy.^2;
end
msdx=sumdx/numpart;
msdy=sumdy/numpart;
msdxy=(msdx+msdy);

% Plotting results
figure(1)
plot(msdx,'b')
hold on
plot(msdy,'g')
plot(msdxy,'r')
hold off

% Finding the slopes
% Forcing the solution through origo.
px = t(:)\msdx(:);
py = t(:)\msdy(:);
pxy = t(:)\msdxy(:);
legend(['<x^2>, d<x^2>/dt=' num2str(px(1))],...
    ['<y^2>, d<y^2>/dt=' num2str(py(1))],...
    ['<x^2+y^2>, d<x^2+y^2>/dt=' num2str(pxy(1))],'Location','NorthWest')
xlabel('antall tidssteg')
ylabel('Midlere kvadratisk forflytning, piksler^2')
% hold on, plot(t,polyval(px,t),'b'), plot(t,polyval(py,t),'g'), plot(t,polyval(pxy,t),'r'), hold off
hold on, plot(t,px*t,'b'), plot(t,py*t,'g'), plot(t,pxy*t,'r'), hold off
axis tight

set(gca, 'FontSize', 12)
saveas(gcf, '5minmoving', 'epsc')

