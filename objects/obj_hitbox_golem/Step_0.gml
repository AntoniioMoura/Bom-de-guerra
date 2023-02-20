/// @description Insert description here
// You can write your code in this editor


//var lista_dano=ds_list_create();
	//var col = instance_place_list(x,y,obj_inimigo_pai,lista_dano,false);
	var col = place_meeting(x,y,obj_player);

if(col){
	//var size = ds_list_size(lista_dano);	
//	for(var i=0;i<size;i++){
		//var outro = lista_dano[| i];
		
		//if(outro!=noone){
		if(obj_player.estado!="defender"){
				if(!obj_player.invu_rolamento){
				obj_player.life--;
				obj_player.invuneravel=true;
				obj_player.estado="caindo_atk";
				obj_player.image_index=0;
			}
		}else {
				if(obj_player.ver==obj_enemy_golem.ver){
					obj_player.life--;
					obj_player.invuneravel=true;
					obj_player.estado="caindo_atk";
					obj_player.image_index=0;
				}else{
					obj_player.estado="caindo_atk";
					obj_player.image_index=0;		
						
				}
		}
		}	
		
	//}
//}
//ds_list_destroy(lista_dano);

	instance_destroy();
