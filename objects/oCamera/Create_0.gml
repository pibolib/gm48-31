cSizeX = 3200;
cSizeY = 1800;

cMaxDepthPos = 150000;
cMaxDepthNeg = -150000;

xView = cSizeX;
yView = cSizeY;
camera = camera_create();
vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
pm = matrix_build_projection_ortho(xView,yView,cMaxDepthNeg,cMaxDepthPos);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

angle = 0;
scale = 1;
shake = 0;

ssm = 0;
sxm = 0;
sym = 0;
scaleTime = 0;

transitionAmount = 0;
transitionRoom = rTitleScreen;