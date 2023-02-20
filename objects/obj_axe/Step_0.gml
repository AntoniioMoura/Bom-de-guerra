/// @description Insert description here
// You can write your code in this editor
alcance = point_distance(x,y,obj_player.x,obj_player.y);

switch(estado){
	case "indo":	

	
	if(place_meeting(x,y,obj_plataforma)|| place_meeting(x,y,obj_enemy_ice) || place_meeting(x,y,obj_enemy_golem)){
		parou=true;
		speed=0;
		sprite_index=spr_axe1;
	}else{
		image_angle-=18;	
	}
	if(place_meeting(x,y,obj_enemy_ice)){
		parou=true;
		speed=0;
		sprite_index=spr_axe1;	
		obj_enemy_ice.estado="congelado";
	}
	
	 if(place_meeting(x,y,obj_enemy_golem)){
		 parou=true;
		speed=0;
		sprite_index=spr_axe1;	
		obj_enemy_golem.estado="congelado";
	 }
	
	if(direcao==1 && !parou){
		direction=0;
	}if(direcao==-1 && !parou){
		direction=180;
	}
	
	if(keyboard_check_pressed(ord("D")) || alcance>160){
		estado="voltando";	
	}	
	break;
	
	case "voltando":
	if(instance_exists(obj_enemy_ice)){
		obj_enemy_ice.estado="parado";	
		obj_enemy_ice.image_blend=c_white;
		obj_enemy_ice.direcao=0.4;
	}
	if(instance_exists(obj_enemy_golem)){
		obj_enemy_golem.estado="parado";	
		obj_enemy_golem.image_blend=c_white;
	}
	
	sprite_index=spr_axe;
	speed=3;
	image_angle-=18;
	
	direction= point_direction(x,y,obj_player.x,obj_player.y-10);

	if(place_meeting(x,y,obj_player)){
		estado="parado";	
		obj_player.atacar_com_machado=true;
		obj_hud.machado=false;
		alarm[0]=room_speed*2;
		sprite_index=-1;
	}
	

	break;
}







