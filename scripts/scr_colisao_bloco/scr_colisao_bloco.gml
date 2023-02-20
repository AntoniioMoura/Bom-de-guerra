if(place_meeting(x+velh,y,obj_plataforma)){
	while(!place_meeting(x+sign(velh),y,obj_plataforma)){
		x+=sign(velh);	
	}
	velh=0;
}


if(place_meeting(x,y+velv,obj_plataforma)){
	while(!place_meeting(x,y+sign(velv),obj_plataforma)){
		y+=sign(velv);	
	}
	velv=0;
}


x+=velh;
y+=velv;




