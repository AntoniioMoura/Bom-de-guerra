/// @description Insert description here
// You can write your code in this editor
var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var jump = keyboard_check_pressed(vk_up);
var jump_s = keyboard_check_released(vk_up);
var defender = keyboard_check(ord("S"));
var ataque = keyboard_check_pressed(ord("A"));
var rolamento = keyboard_check(vk_space);
chao=place_meeting(x,y+1,obj_plataforma);	
var machado = keyboard_check(ord("D"));

if(place_meeting(x,y,obj_plataforma)){
	life=0;	
}
avanco_h=(right-left)*max_velh;

if(left){
	direcao=-1;	
}
if(right){
	direcao=1;	
}


//Configurando a aceleração no chao e no ar
if(chao){	
	acel=acel_chao;
}else{
	acel= acel_ar;	
}




if(ativar_sorte){
	sorte=irandom(200);
}

switch(estado){
	case "parado":
				sprite_index=spr_idle;
				velh=0;
				velv=0;
				//Adicionando a ação de pulo se o player estiver no chao
				if(jump && chao){
					velv=-max_velv;	
				}
			
				//Adicionando gravidade no estado parado
				if(!chao){
					velv+=grav;	
				}
				//Saindo do estado e indo para o estado movendo
				if(abs(velh)>0 || abs(velv)>0 || left || right || jump){
					estado = "movendo";	
				}
				
				if(ataque && chao){
					if(atacar_com_machado){
						estado ="ataque";
						ativar_hitbox=true;
					}else{
						estado ="murro";	
						ativar_hitbox=true;
					}
				
					image_index=0;
				}
				
				if(defender && chao){
					estado ="defender";	
				}
				
				if(machado && chao){
					estado="machado";	
				}
				break;
			
		case "movendo":
		if(abs(velh)>=0.5 && chao){
			sprite_index = spr_run;
		}
		if(abs(velh)<=1 && chao){
			sprite_index = spr_idle; 	
		}
		
		if(velv<0 && !chao){
			sprite_index = spr_jump;
			image_index=0;
		}
		if(velv>0 && !chao){
			sprite_index = spr_jump;
			image_index=1;
		}
		
		//Adicionando aceleração de movimento
			velh=lerp(velh, avanco_h, 0.2);

			if(!chao){ 
				velv+=grav;
			}
			//Pulando
			if(jump && chao){
				velv=-max_velv;	
			}			
				//Controlando a altura do pulo
			if(jump_s && velv<0){
				velv*=0.5;	
			}
				//indo para o estado de parado
			if(velh==0 && velv==0){
				estado = "parado";		
			}
			
			if(ataque && chao){
				if(atacar_com_machado){
					estado ="ataque";	
					ativar_hitbox=true;
				}else{
					estado ="murro";
					ativar_hitbox=true;
				}
				
				image_index=0;
			}
			
			if(defender && chao){
					estado ="defender";	
			}
				
			if(machado && chao){
					estado="machado";	
			}
			
			if(sorte>195 && chao){
				estado="caindo";	
				image_index=0;
				
			}
			
			if(rolamento){
				estado="rolamento";	
				image_index=0;
			}
				//----------Limitando as velocidades com o Clamp
			velv = clamp(velv,-max_velv,max_velv);
			break;
			
			
		case "ataque":
		velh=0;
		sprite_index=spr_atk;
		if(ataque){
			cont++;	
		}
		
		
		if(cont<1){
		//	show_message("opa");
			if(image_index>image_number-4){
				estado="parado";
			}
			if(ativar_hitbox){
			dano=20;
			instance_create_layer(x,y,"coisas",obj_hitbox);
			ativar_hitbox=false;
		}
				}else if(cont>=1){
					if(image_index>=image_number-1){
					estado="parado";
					cont=0;
					}
					ativar_hitbox=true;
					dano = 50;
					if(ativar_hitbox){
					instance_create_layer(x,y,"coisas",obj_hitbox);
					ativar_hitbox=false;
		}
					
				}			
		break;
		case "defender":
		velh=0;
		sprite_index=spr_shild;
		if(!defender){
			estado="parado";	
		}
		break;

		case "machado":
			if(axe){
				atacar_com_machado=false;
				var p=instance_create_layer(x,y-sprite_get_height(spr_idle)/2-3,"axe",obj_axe);
				p.direcao=direcao;
				axe = false;
			}
			estado="movendo";		
	break;
	
	case "caindo":
		alarm[1]=room_speed*3;
		velv=0;
		velh=0;
		ativar_sorte=false;
		sorte=0;
		sprite_index=spr_caindo;
		if(image_index>image_number-1){
			estado="parado";	
		}
	break;
	
	case "caindo_atk":
		alarm[1]=room_speed*3;
		velv=0;
		velh=0;
		ativar_sorte=false;
		sorte=0;
		sprite_index=spr_caindo_atk;
		if(image_index>image_number-1){
			estado="parado";	
		}
	break;
	
	case "murro":
	velv=0;
	velh=0;
	sprite_index=spr_murro;
	if(ativar_hitbox){
			dano=10;
			instance_create_layer(x,y,"coisas",obj_hitbox);
			ativar_hitbox=false;
		
	}
	if(image_index>=image_number-1){
		estado="movendo";	
	}
	break;
	
	
	case "rolamento":
	invu_rolamento=true;
		velh=1.2*ver;
		if(!chao){ 
				velv+=grav;
			}
		sprite_index=spr_rolamento;
		if(image_index>=image_number-1){
				estado="movendo";
				alarm[2]=room_speed/2;
		}
			if(sorte>160 && chao){
				invu_rolamento=false;
				estado="caindo";	
				image_index=0;
				
			}
		
	break;
	case "morte":
	sprite_index=spr_caindo_atk;
	if(image_index>image_number-1){
		room_restart();	
		audio_stop_all();
		instance_destroy();
	}
	break;
}

if(invuneravel && !ativar_invuneravel){
	alarm[0]=room_speed*2;
	ativar_invuneravel=true;
}

if(life<=0){
	estado="morte";
	
}

