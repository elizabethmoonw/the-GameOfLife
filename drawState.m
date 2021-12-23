function drawState(m,s)

cla

for i = 1:size(m,1) % Loop through rows/cols
    for j = 1:size(m,2)
        if m(i,j) == 1
            plot(j,-i,'k*') % Alive are drawn as stars
            hold on
        else
            plot(j,-i,'k.') % Alive are drawn as dots
            hold on
        end
    end
end

xlim([0 size(m,1)+1]) % Set scale
ylim([-size(m,2)-1 0])
axis equal off
title(sprintf('Step = %i',s))
hold off