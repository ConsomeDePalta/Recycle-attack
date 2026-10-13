#region// MOVIMIENTO HORIZONTAL

var hsp = 0;
var sprint = keyboard_check(vk_lshift);
var izq = keyboard_check(ord("A"));
var der = keyboard_check(ord("D"));

if (izq && sprint){
	hsp = -vel*2;	
	miraizq = true;
	mirader = false; 
	image_xscale = -1;	
}
else if (izq) {
    hsp = -vel; 
	miraizq = true;
	mirader = false;
	image_xscale = -1;
}

if (der && sprint){
	hsp = vel*2; 
	miraizq = false;
	mirader = true; 
	image_xscale = 1;
}
else if (der) {
    hsp = vel; 
	miraizq = false;
	mirader = true;
	image_xscale = 1;
}

// Colisiones horizontales
if (hsp != 0) {
    var dir = sign(hsp);
    repeat(abs(hsp)) {
        if (!place_meeting(x + dir, y, Colision)) {
            x += dir;
        } else {
            break;
        }
    }
}
#endregion


#region // GRAVEDAD
vel_caida += gravedad;
instancia = instance_place(x, y + vel_caida, Colision);

if (instancia != noone) {
	instancia = instance_place(x, y + 1, Colision);
	vel_caida = 0;
	puedo_saltar = true;
} else {
	puedo_saltar = false;
}

if (instance_place(x, y - 10, Colision)){
	puedo_saltar = false;
}

y += vel_caida;
#endregion


#region // SALTO
var salta = keyboard_check(vk_space);
if (salta && puedo_saltar) {
	vel_caida = -12;
	puedo_saltar = false;
}
#endregion