/// @description Insert description here
// You can write your code in this editor
if(velh!=0){
	ver = sign(velh);
}
if(invuneravel){
	image_blend=c_red;
}

	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*ver,image_yscale,image_angle,image_blend,image_alpha);

//if(damage && (instance_exists(obj_enemy_ice)|| instance_exists(obj_enemy_golem))){
//	contador++;
//	draw_text_color(x,y-46-contador,dano,c_yellow,c_red,c_red,c_white,1-(contador*-0.1));	
//}

if(global.qtd_inimigo==2){
	draw_text(x-32,y-100,"Obrigado por jogar");	
	draw_text(x-32,y-80,"R = reinicia");
	draw_text(x-32,y-60,"Esc = encerra");	
}
