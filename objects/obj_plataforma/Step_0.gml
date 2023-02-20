/// @description Insert description here
// You can write your code in this editor
if(subindo){
		sprite_index=spr_plat_sobe;
		if(global.qtd_inimigo==1 && x>obj_player.x){
			if(y>yy-100)
			y--;	
			//show_message("opa");
			
		}	
	if(x<obj_player.x){
		if(y<yy){
			//show_message("opa");
			y++;	
		}
	}

}
