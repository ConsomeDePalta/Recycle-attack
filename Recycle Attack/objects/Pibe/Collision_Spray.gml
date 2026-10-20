var izq = keyboard_check(ord("A"));
var der = keyboard_check(ord("D"));


// Evento Collision con Spray en Pibe
if (!tiene_spray) {
    tiene_spray = true;
    mi_spray = other.id; // Guarda la referencia del spray que acabas de tocar
}


