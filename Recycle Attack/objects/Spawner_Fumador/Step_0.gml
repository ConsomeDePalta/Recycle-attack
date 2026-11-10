// Evento STEP en Spawner_Fumador

// Solo cuenta si hay menos fumadores que el máximo permitido
if (instance_number(Fumador) < max_fumadores) {
    contador += 1;
    
    if (contador >= tiempo_spawn) {
        
        // --- LÍMITES SEGUROS DE APARICIÓN ---
        // Margen de seguridad desde el borde de la sala
        var margen = 64; 
        var min_x = margen;
        var max_x = room_width - margen;
        
        // clamp() restringe la coordenada para que nunca sea menor a min_x ni mayor a max_x
        var spawn_x = clamp(x, min_x, max_x);
        var spawn_y = y;
        
        // Crea al fumador dentro de los límites válidos
        var nuevo = instance_create_layer(spawn_x, spawn_y, "Instances", Fumador);
        
        // Decidir dirección inicial sin empujarlo hacia el abismo exterior
        if (spawn_x <= min_x + 50) {
            nuevo.dir = 1;  // Si está cerca del borde izquierdo, camina a la derecha
        } else if (spawn_x >= max_x - 50) {
            nuevo.dir = -1; // Si está cerca del borde derecho, camina a la izquierda
        } else {
            nuevo.dir = choose(-1, 1);
        }
        
        contador = 0;
    }
}