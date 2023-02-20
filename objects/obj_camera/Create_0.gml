
/// @description Insert description here
// You can write your code in this editor

//Possibilitando os sons do jogo
//Distancia pra tocar o som
//audio_falloff_set_model(audio_falloff_exponent_distance);


alvo = obj_player; //Criando alvo
cam = view_camera[0];
view_w_half = camera_get_view_width(cam) *0.5;
view_h_half = camera_get_view_height(cam) *0.5;