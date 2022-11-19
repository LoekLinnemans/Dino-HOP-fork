//defineer variabel cam
var cam = view_camera[0];

//zorgt ervoor dat camera met speler mee beweegt
x += (target.x - x)* scroll_speed;
y += (target.y - y)* scroll_speed;
zoom += (target_zoom -zoom) *zoom_speed;

//zet de nieuwe grootte
camera_set_view_size(cam,original_x*zoom,original_y*zoom)

//camera grootte wordt bepaalt
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_width(cam);

//zet de nieuwe positie
camera_set_view_pos(cam,x-cam_width*0.5 ,y- cam_height*0.5);

//hier wordt zoom met het scroll wheel bepaalt
var mouse_wheel = mouse_wheel_down() - mouse_wheel_up();
target_zoom += mouse_wheel*0.1;
target_zoom = clamp(target_zoom,0.1,2);