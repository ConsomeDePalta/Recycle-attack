// Solo cuenta si hay menos fumadores que el máximo permitido
if (instance_number(Fumador) < max_fumadores) {
    contador += 1;
    
    if (contador >= tiempo_spawn) {
        // Crea al fumador en la posición del spawner
        var nuevo = instance_create_layer(x, y, "Instances", Fumador);
        
        // Dirección inicial aleatoria (-1 izquierda o 1 derecha)
        nuevo.dir = choose(-1, 1);
        
        // Reinicia el contador (puedes usar irandom_range(180, 300) si quieres tiempo aleatorio)
        contador = 0;
    }
}