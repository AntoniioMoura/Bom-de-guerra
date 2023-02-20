/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(font0);
draw_sprite(spr_enter,image_index,x+60,y+20);

if(cont==0){
	draw_text(x-64,y-84,"Bem vindo ao Ruim");
	draw_text(x-64,y-70,"de guerra");
	sprite_index = spr_idle;
}

if(cont==1){
	draw_text(x-64,y-84,"As setas movimentam");
	draw_text(x-64,y-70,"o personagem");
	sprite_index = spr_run;
}

if(cont==2){
	draw_text(x-64,y-84,"A = Ataque fraco");
	sprite_index = spr_atk1;
}

if(cont==3){
	draw_text(x-64,y-84,"AA = Ataque forte");
	sprite_index = spr_atk;
}

if(cont==4){
	draw_text(x-64,y-84,"S = Defende");
	sprite_index = spr_shild;
}

if(cont==5){
	draw_text(x-64,y-84,"Espaço = rolamento");
	sprite_index = spr_rolamento;
}

if(cont==6){
	draw_text(x-64,y-84,"Cuidado para não cair");
	draw_text(x-64,y-70,"enquanto anda");
	 
	sprite_index = spr_caindo;
}

if(cont==7){
	draw_text(x-64,y-84,"D = jogar machado");
	draw_text(x-64,y-70,"D = machado retorna");
	draw_sprite(spr_idle,image_index,x-20,y+10);
	sprite_index = spr_axe;
}

if(cont>7){
	room_goto(1);
	instance_destroy();
}

show_debug_message(cont);