function result = myQuantization(pic, bits)
  img_size = size(pic);
  new = pic;
 
  v = 0:(256/(2^bits)):256;
  step = (256/(2^bits))/2;
  q_size = size(v);
  q_size = q_size(2);
  
  for i = 1 : img_size(1)
    for j = 1 : img_size(2)
      for k = 1 : q_size
        if pic(i,j) < v(k)
          new(i,j) = v(k) - step;
          break
        end
      end
    end
  end
  result = new;
end