/// @description Insert description here
// You can write your code in this editor

contador=1;
estado = "parado";
dano=20;
velv=0;
velh=0;
grav = 0.4;
avanco_h = 0;
acel_chao = .15;		//Aceleração no chão
acel_ar = .06;		//Aceleração no ar
acel_def = 0.02;
acel = acel_chao;	//Aceleração padrão
max_velv = 6.6; //Velocidade maxima vertical
max_velh = 2; //Velocidade maxima horizontal
ver = 1;
cont=0;
axe = true;
direcao = 1;
atacar_com_machado = true;
sorte=0;
ativar_sorte=true;
life=4;
invuneravel=false;
damage=false;
ativar_invuneravel=false;
ativar_hitbox=false;
invu_rolamento=false;
if(!instance_exists(obj_hud)){
	instance_create_layer(0,0,"hud",obj_hud);
}