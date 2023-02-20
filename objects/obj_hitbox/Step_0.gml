/// @description Insert description here
// You can write your code in this editor


//var lista_dano=ds_list_create();
	//var col = instance_place_list(x,y,obj_inimigo_pai,lista_dano,false);
	var col = place_meeting(x,y,obj_enemy_ice);
		var col1 = place_meeting(x,y,obj_enemy_golem);

if(col){
	//var size = ds_list_size(lista_dano);	
//	for(var i=0;i<size;i++){
		//var outro = lista_dano[| i];
		
		//if(outro!=noone){
			obj_enemy_ice.dano_levado=obj_player.dano;
	}
	
if(col1){
	
		obj_enemy_golem.dano_levado=obj_player.dano;	
}
		
	//}
//}
//ds_list_destroy(lista_dano);
instance_destroy();