

#region// MOVIMIENTO HORIZONTAL

var camina = false;
var sprint = keyboard_check(vk_lshift);
var izq = keyboard_check(ord("A"));
var der = keyboard_check(ord("D"));
var move = der - izq;
var move_speed = sprint ? (vel * 2) : vel;
var hsp = move * move_speed;

if (move != 0) {
    image_xscale = move;     
    mirader = (move == 1);
    miraizq = (move == -1);
    sprite_index = walkPersonaje;
} else {
    sprite_index = character_malePerson_idle;
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