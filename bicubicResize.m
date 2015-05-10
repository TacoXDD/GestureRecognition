function new = bicubicResize(pic, r, c)
  oldSize = size(pic);                               %# Old image size
  newSize = [r, c];
  zoomc = newSize(1)/oldSize(1);
  zoomr = newSize(2)/oldSize(2);
  %newSize = max(floor(zoomr.*oldSize(1)),1);  %# New image size
  newX = ((1:newSize(2))-0.5)./zoomr+0.5;  %# New image pixel X coordinates
  newY = ((1:newSize(1))-0.5)./zoomc+0.5;  %# New image pixel Y coordinates
  oldClass = class(pic);  %# Original image type
  pic = double(pic);  %# Convert image to double precision for interpolation
  if numel(oldSize) == 2  %# Interpolate grayscale image
    new = interp2(pic, newX, newY(:), 'cubic');
  else                    %# Interpolate RGB image
    new = zeros([newSize 3]);  %# Initialize new image
    new(:,:,1) = interp2(pic(:,:,1), newX, newY(:), 'cubic');  %# Red plane
    new(:,:,2) = interp2(pic(:,:,2), newX, newY(:), 'cubic');  %# Green plane
    new(:,:,3) = interp2(pic(:,:,3), newX, newY(:), 'cubic');  %# Blue plane
  end
  new = cast(new, oldClass);  %# Convert back to original image type
end