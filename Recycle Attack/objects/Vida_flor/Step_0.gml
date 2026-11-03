// Evento STEP en Vida_flor
if (vida <= 0) {
    vida = 0;
    // Opcional: si la barra llega a 0, destruye todas las flores (o reinicia el nivel)
    with (Flor) {
        instance_destroy();
    }
}
if (instance_number(Fumador) < max_fumadores) {
    timer_spawn += 1;
    
    if (timer_spawn >= intervalo_spawn) {
        // Elige entre dos puntos X de tu mapa (ajusta 100 y 1200 al ancho de tu suelo)
        var spawn_x = choose(100, 1200);
        var spawn_y = 500; // Ajusta a la altura del piso de tu sala
        
        instance_create_layer(spawn_x, spawn_y, "Instances", Fumador);
        timer_spawn = 0;
    }
}