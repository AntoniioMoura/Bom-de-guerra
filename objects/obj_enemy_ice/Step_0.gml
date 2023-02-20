/// @description Insert description here
// You can write your code in this editor
if(time_ativar_acerto){
	alarm[4]=room_speed;
	time_ativar_acerto=false;
}

if(time_ativar_acerto1){
	alarm[5]=room_speed;
	time_ativar_acerto1=false;
}
var colidiu_andar = collision_rectangle(x-75,y,x+75,y-32,obj_player,true,false);
var colidiu_ataque = collision_circle(x,y,33,obj_player,true,false);

if(x>obj_player.x){
	ver=-1;
}else{
	ver=1;	
}


switch(estado){
	case "andando":	
	if(place_meeting(x+2*direcao,y,obj_plataforma)){
		direcao*=-1;	
	}else{
		x+=direcao;	
	}
	
	if(colidiu_andar){
		estado="parado";	
	}
	break;	
	
	case "parado":
	if(colidiu_ataque && pode_atacar){
		estado="ataque";	
		image_index=0;
	}
	if(!colidiu_andar && ativou){
		alarm[1]=room_speed*4;	
		ativou = false;
	}
	if(colidiu_andar && ativar_atacar_correndo){
		time--;
		if(time<0){
			estado="andando_atacando";
			direcao=1.2;
			atacar_correndo=ver;
		}
	}
	break;
	
	case "ataque":
		
	if(image_index>=image_number-1){
		estado="parado";
		pode_atacar=false;
		alarm[0]=room_speed*1.2;
	}
	if(image_index>4 && !obj_player.invuneravel){
		if(place_meeting(x,y,obj_player) && !obj_player.invu_rolamento){
			if(obj_player.estado!="defender"){
				obj_player.life-=dano;
				obj_player.estado="caindo_atk";	
				obj_player.image_index=0;
				obj_player.invuneravel=true;
			}else{
				if(ver==obj_player.ver){
					obj_player.estado="caindo_atk";	
					obj_player.image_index=0;
					obj_player.life-=dano;
					obj_player.invuneravel=true;
				}
					//obj_player.estado="caindo_atk";	
				obj_player.x+=(1*ver);	
				
			}
		}
	}
	break;
	
	case "andando_atacando":	
	if(place_meeting(x+2*atacar_correndo,y,obj_plataforma)){
		estado="parado";
		alarm[2]=room_speed;
		ativar_atacar_correndo=false;
		direcao = 0.4;
		time=room_speed;
	}else{
		x+=direcao*(atacar_correndo);	
	}
	if(colidiu_ataque && pode_atacar){
		estado="ataque";
		image_index=0;
		direcao=0.4;
		ativar_atacar_correndo=false;
		alarm[2]=room_speed;
	}
	
	break;
	
	case "congelado":
		alarm[6]=tempo_descongelar--;
		direcao=0;
		image_index=3;
		image_blend=c_aqua;
		break;
	

		

}

if(espera_dano){
		
			if(dano_levado>0){
				obj_player.damage=true;	
				if(obj_player.estado!="murro"){
					alarm[7]=room_speed;
				}else{
					alarm[7]=room_speed/4;
				}
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

/*
*/
