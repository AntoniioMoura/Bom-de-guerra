/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_espada_hud,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+16);

if(machado){
	draw_sprite(spr_machado_idle,0,camera_get_view_x(view_camera[0])+15,camera_get_view_y(view_camera[0])+50);
}else{
	draw_sprite(spr_machado_idle_x,0,camera_get_view_x(view_camera[0])+15,camera_get_view_y(view_camera[0])+50);
}
for(var i=1;i<=obj_player.life;i++){
	var tamanho_life =sprite_get_width(spr_life);
	draw_sprite(spr_life,0,camera_get_view_x(view_camera[0])+tamanho_life*i+(2*i)+12,camera_get_view_y(view_camera[0])+20);
	
}
