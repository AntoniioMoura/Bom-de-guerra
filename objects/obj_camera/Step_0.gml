
/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player)){
	alvo=obj_player;	
}else{
	alvo=obj_tutorial;	
}
x_do_alvo = alvo.x;
y_do_alvo = alvo.y;


//Atualizando posição do objeto
x+=(x_do_alvo-x)/12;
y+=(y_do_alvo-y)/12;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Dando velocidade para a camera com lerp, para nao mover bruscamente
x = lerp(x_do_alvo,x,.9);	
y = lerp(y_do_alvo,y,.9);


//Atualizando view para fullscreen
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);


var base_w = 1200;
var base_h = 720;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h)
    {
    // portait
     var VIEW_WIDTH = min(base_w, max_w);
    var VIEW_HEIGHT = VIEW_WIDTH / aspect;
    }
else
    {
    // landscape
    var VIEW_HEIGHT = min(base_h, max_h);
    var VIEW_WIDTH = VIEW_HEIGHT * aspect;
    }
camera_set_view_size(view_camera[0], 160, 180);
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);

