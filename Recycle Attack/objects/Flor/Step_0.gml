
// Detecta si hay una instancia de Fumador pisando la flor
var fumador_encima = place_meeting(x, y, Fumador);

if (fumador_encima) {
    tiempo_dano += 1;
    
    // Al cumplirse 1 segundo (60 frames)
    if (tiempo_dano >= 60) {
        vida -= 1;
        tiempo_dano = 0; // Reinicia el contador para el siguiente segundo
        
        // Destello rojo momentáneo al recibir daño
        image_blend = c_red;
    }
} else {
    // Si Fumador no está encima, se reinicia el temporizador y el color
    tiempo_dano = 0;
    image_blend = c_white;
}

// Si la flor pierde toda su vida
if (vida <= 0) {
    vida = 0;
    instance_destroy(); // Se destruye al llegar a 0
}