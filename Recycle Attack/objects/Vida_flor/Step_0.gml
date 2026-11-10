//derrota
if (vida <= 0) {
    vida = 0;
    room_goto(Room4); // Cambia Room4
}

//victoria
if (tiempo_restante > 0) {
    tiempo_restante -= 1;
} else {
    room_goto(Room3); // Cambia Room3
}

// generador de fumadores 
if (instance_number(Fumador) < max_fumadores) {
    timer_spawn += 0.5;
    
    if (timer_spawn >= intervalo_spawn) {
        var spawn_x = choose(100, 1200);
        var spawn_y = 500;
        
        var nuevo_fumador = instance_create_layer(spawn_x, spawn_y, "Instances", Fumador);
        nuevo_fumador.dir = choose(-1, 1);
        
        timer_spawn = 0;
    }
}