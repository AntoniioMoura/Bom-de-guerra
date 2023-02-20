/// @description Insert description here
// You can write your code in this editor
randomize();
var tacada = irandom(100);
var colidiu_andar = collision_rectangle(x-100,y,x+100,y-32,obj_player,true,false);
var colidiu_ataque = collision_rectangle(x,y,x+30*ver,y-32,obj_player,true,false);

//var colidiu_ataque = collision_circle(x,y,26,obj_player,true,false);
var direcao = point_direction(x,y,obj_player.x,obj_player.y);
switch(estado){
	case "parado":
	sprite_index=spr_golem_idle;
	if(colidiu_andar){
		estado="andando";	
	}
	if(colidiu_ataque && pode_atacar){
		estado="ataque";	
		valor_tacada=tacada;
		image_index=0;
	}

	break;
	case "ataque":
	if(valor_tacada>30){
		sprite_index=spr_golem_atk;
		if(image_index>=image_number-1){
			instance_create_layer(x,y-16,"coisas",obj_hitbox_golem);
			estado="parado";
			pode_atacar=false;
			estado="espera_ataque";
			alarm[0]=room_speed*2;
		}
	}else{
		sprite_index=spr_golem_atk_tiro;
		if(image_index>=image_number-1){
			instance_create_layer(x,y-16,"coisas",obj_hitbox_golem);
			image_index=0;
			estado="tiro";
			pode_atacar=false;
			alarm[0]=room_speed*2;	
		}
		}
	break;
	
	case "andando":
	direction = direcao;
	sprite_index= spr_golem_walk;
	if(x>obj_player.x){
		x-=0.5;	
		ver=-1;
		image_xscale=1;
	}else{
		x+=0.5;
		ver=1;
		image_xscale=-1;
	}
	
	if(colidiu_ataque && pode_atacar){
		estado="ataque";	
		image_index=0;
		valor_tacada=tacada;
	}
	break;
	
	case "espera_ataque":
		sprite_index=spr_golem_idle;                      
	break;
	
	case "congelado":
		alarm[1]=tempo_descongelar--;
		image_index=3;
		image_blend=c_aqua;
		break;
		
		
	case "tiro":
	sprite_index=spr_golem_chute;	
			if(image_index>=image_number-1){
			var tiro =instance_create_layer(x+15*ver,y-16,"coisas",obj_tiro);
			tiro.dir = ver;
			pode_atacar=false;
			estado="espera_ataque";
			alarm[0]=room_speed*2;
			}
			break;

}



if(espera_dano){
		
			if(dano_levado>0){
				obj_player.damage=true;	
					alarm[2]=room_speed;
				espera_dano=false;
				vida-=dano_levado;
				dano_levado=0;
			}
			obj_player.contador=1;
			if(vida<=0){
				global.qtd_inimigo++;
				instance_destroy();
			}
			
}

show_debug_message(valor_tacada);
