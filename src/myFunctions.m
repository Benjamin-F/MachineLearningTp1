function [xshake, yshake, Yas] = shakeTable(xapp, yapp, Ya)
  nbIterations = ceil( rand * (size(xapp,1)*4));
  for i=1:nbIterations
    movedLine = ceil ( rand * size(xapp,1) );
    movedLine2 = ceil ( rand * size(xapp,1) );
    
    tmp = xapp( movedLine, :);
    xapp(movedLine,:) = xapp(movedLine2,:);
    xapp(movedLine2,:) = tmp;
    
    tmp = yapp(movedLine,:);
    yapp(movedLine,:) = yapp(movedLine2,:);
    yapp(movedLine2,:) = tmp;
    
    tmp = Ya(movedLine ,:);
    Ya(movedLine,:) = Ya(movedLine2,:);
    Ya(movedLine2,:) = tmp;
  endfor
  
  xshake = xapp;
  yshake = yapp;
  Yas = Ya;
  
endfunction