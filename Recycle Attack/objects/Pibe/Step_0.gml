#region // RECARGA DE AGUA EN EL GRIFO

var tecla_recarga = keyboard_check_pressed(ord("R"));

// Solo puede recargar si tiene el spray equipado y presiona "R"
if (tiene_spray && instance_exists(mi_spray) && tecla_recarga) {
    
    // Distancia máxima para poder recargar (en píxeles)
    var rango_recarga = 35;
    
    // Buscamos la fuente más cercana
    var fuente_cercana = instance_nearest(x, y, obj_fuente);
    
    // Si existe una fuente y el pibe está a menos de 35 píxeles de ella
    if (fuente_cercana != noone && distance_to_object(fuente_cercana) <= rango_recarga) {
        
        // Restaurar munición al máximo y devolver el sprite lleno
        mi_spray.municion = 9;
        mi_spray.sprite_index = Rociador3;
        
        // Mensaje en consola para confirmar la recarga
        show_debug_message("¡Agua recargada!");
    }
}

#endregion

#region // MANEJO DEL SPRAY EQUIPADO

if (tiene_spray && instance_exists(mi_spray)) {
    
    // Mantenemos la profundidad por delante del pibe
    mi_spray.depth = depth - 1;

    // Posicionamos el spray según hacia dónde mira el pibe
    if (miraizq) {
        mi_spray.x = x - 23;
        mi_spray.y = y - 5;
        mi_spray.image_xscale = 1; // -1 para que mire a la izquierda
    } else {
        mi_spray.x = x + 23;
        mi_spray.y = y - 5;
        mi_spray.image_xscale = -1;  // 1 para que mire a la derecha
    }

    // Comprobamos la tecla hacia arriba para disparar
    var disparo = keyboard_check_pressed(vk_up);

    if (disparo && mi_spray.municion > 0) {
    // Obtenemos la dirección (-1 izq, 1 der)
    var dir = miraizq ? -1 : 1;
    
    // --- 1. COORDENADAS EXACTAS DE LA BOQUILLA ---
    var distancia_x = 40; 
    var offset_y = -8;   

    var boquilla_x = mi_spray.x + (distancia_x * dir);
    var boquilla_y = mi_spray.y + offset_y;
    
    // Creamos la hitbox en la punta exacta
    var hitbox = instance_create_layer(boquilla_x, boquilla_y, "Instances", Sprayhitbox);
    
    // --- 2. PROFUNDIDAD Y ORIENTACIÓN ---
    hitbox.depth = depth - 2; // Queda al frente de Pibe y de Spray
    hitbox.image_xscale = dir;
    
    // --- 3. DESCONTAR DISPARO Y GASTAR AGUA ---
    mi_spray.municion -= 1;
    
    if (mi_spray.municion >= 7) {
        mi_spray.sprite_index = Rociador3;
    } else if (mi_spray.municion >= 4) {
        mi_spray.sprite_index = Rociador2;
    } else if (mi_spray.municion >= 1) {
        mi_spray.sprite_index = Rociador1;
    } else {
        mi_spray.sprite_index = Rociador0;
    }
}

}

#endregion

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