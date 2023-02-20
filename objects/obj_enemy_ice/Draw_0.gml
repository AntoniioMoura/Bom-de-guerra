/// @description Insert description here
// You can write your code in this editor
draw_self();

if(estado=="ataque"){
	if(ver==-1){
		sprite_index=spr_enemy_ice_atk_left;
	
		
		ver=-1;
	}else{
		sprite_index=spr_enemy_ice_atk_right;
		
		ver=1;
	}
}
if(estado=="parado"){
		if(ver==-1){
		sprite_index=spr_enemy_ice_idle_left;
		ver=-1;
	}else{
		sprite_index=spr_enemy_ice_idle_right;
		ver=1;
	}
}
	if(estado=="andando"){
	if(direcao>0){
		sprite_index=spr_enemy_ice_walk_right;
		ver=-1;
	}else{
		sprite_index=spr_enemy_ice_walk_left;
		ver=1;
	}
}

	if(estado="andando_atacando"){
		if(ver==-1){
			sprite_index=spr_enemy_ice_walk_left;

			ver=-1;
		}else{
			sprite_index=spr_enemy_ice_walk_right;
			
			ver=1;
		}
	}

	//draw_rectangle(x,y,x+(ver*10),-20,true);
	//draw_circle(x,y,30,true);
var vida_atual = (vida/max_vida)*100;
draw_healthbar(x-16,y-32, x+16, y-36,vida_atual,c_black,c_red,c_red,0,true,true);
//draw_rectangle(x-64,y,x+64,y-32,true);
