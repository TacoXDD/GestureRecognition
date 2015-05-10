function B = myRotate(A,ANGLE,METHOD)

BBOX = 1;
size_img = size(A);
POINT = size_img(1:2)/2;

[so(1) so(2) thirdD] = size(A);
phi = ANGLE*pi/180;
m=POINT(1,1);
n=POINT(1,2);
rotate = maketform('affine',[ cos(phi) sin(phi) 0; ...
-sin(phi) cos(phi) 0; ...
m-m*cos(phi)+n*sin(phi) n-m*sin(phi)-n*cos(phi) 1 ]);

hiA = (so-1)/2;
loA = -hiA;
  if BBOX(1)=='l'
    hiB = ceil(max(abs(tformfwd([loA(1) hiA(2); hiA(1) hiA(2)],rotate)))/2)*2;
    loB = -hiB;
    sn = hiB - loB + 1;
  else
    hiB = hiA;
    loB = loA;
    sn = so;
  end

  boxA = maketform('box',so,loA,hiA);
  boxB = maketform('box',sn,loB,hiB);
  T = maketform('composite',[fliptform(boxB),rotate,boxA]);

  if strcmp(METHOD,'bicubic')
    R = makeresampler('cubic','fill');
  elseif strcmp(METHOD,'bilinear')
    R = makeresampler('linear','fill');
  else
    R = makeresampler('nearest','fill');
  end
  B = tformarray(A, rotate, R, [1 2], [1 2], sn, [], 0);
end