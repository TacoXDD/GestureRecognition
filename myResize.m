function result = myResize(pic, scale, s)
  if isequal(s, 'nearest')
    result = nearestResize(pic, scale(1), scale(2));
  elseif isequal(s, 'bicubic')
    result = bicubicResize(pic, scale(1), scale(2));
  elseif isequal(s, 'bilinear')
    result = bilinearResize(pic, scale(1), scale(2));
  end
end