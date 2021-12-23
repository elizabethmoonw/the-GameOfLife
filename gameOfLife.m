function m = gameOfLife(m,n)

close all
figure
axis equal off

drawState(m,0);

for k = 1:n
    pause(0.1)
    
    drawnow
    
    outM = oneSweep(m);
    
    drawState(outM,k)
    
    m = outM;
    
end