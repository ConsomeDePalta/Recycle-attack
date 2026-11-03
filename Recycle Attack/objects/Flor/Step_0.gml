// Detecta si hay una instancia de Fumador pisando la flor
var fumador_encima = place_meeting(x, y, Fumador);

if (fumador_encima) {
    tiempo_dano += 5;
      
    // Al llegar a 60 (con += 5 ocurre cada 12 frames, es decir, quita 5 de vida por segundo)
    if (tiempo_dano >= 60) {
        if (instance_exists(Vida_flor)) {
            Vida_flor.vida -= 1;
        }
        tiempo_dano = 0; // Reinicia el contador
        
        // Destello rojo al recibir daño
        image_blend = c_red;
    }
} else {
    // Si Fumador no está encima, se reinicia el temporizador y el color
    tiempo_dano = 0;
    image_blend = c_white;
}

// Si la vida general llega a 0, la flor se destruye
if (instance_exists(Vida_flor) && Vida_flor.vida <= 0) {
    Vida_flor.vida = 0;
    instance_destroy(); // Se destruye al llegar a 0
}