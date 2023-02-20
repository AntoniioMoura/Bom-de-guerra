/// @description Insert description here
// You can write your code in this editor
draw_self();
var vida_atual = (vida/max_vida)*100;
draw_healthbar(x-22,y-44, x+22, y-48,vida_atual,c_black,c_red,c_red,0,true,true);