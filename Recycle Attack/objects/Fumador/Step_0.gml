var hsp = dir * vel;


var choca_pared = place_meeting(x + 10, y, Colision);
// Revisa si 20 píxeles adelante y 2 píxeles abajo ya no hay piso (borde)
var llega_al_borde = !place_meeting(x + (dir * 30), y + 2 , Colision) && place_meeting(x, y + 1, Colision);

if (choca_pared || llega_al_borde) {
    dir = -dir;        // Invierte la dirección (de 1 a -1 o viceversa)
    hsp = dir * vel;
}

// Aplicamos el movimiento horizontal y volteamos el sprite
x -= hsp;
image_xscale = dir;

// --- 2. GRAVEDAD Y COLISIÓN CON EL SUELO ---
vel_caida += gravedad;

if (place_meeting(x, y + vel_caida, Colision)) {
    while (!place_meeting(x, y + sign(vel_caida), Colision)) {
        y += sign(vel_caida);
    }
    vel_caida = 0;
}

y += vel_caida;