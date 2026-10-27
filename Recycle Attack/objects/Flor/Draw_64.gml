// 1. Dibujar el sprite propio de la flor
draw_self();

// 2. Mostrar la barra de vida si tiene menos de 100
if (vida < vida_max) {
    var ancho_barra = 32;
    var alto_barra = 4;
    var barra_x1 = x - (ancho_barra / 2);
    var barra_y1 = y - 30; // Altura sobre la flor
    var barra_x2 = barra_x1 + ancho_barra;
    var barra_y2 = barra_y1 + alto_barra;
    
    // Fondo negro
    draw_set_color(c_black);
    draw_rectangle(barra_x1 - 1, barra_y1 - 1, barra_x2 + 1, barra_y2 + 1, false);
    
    // Barra verde proporcional a la vida (0 a 100)
    var porcentaje = vida / vida_max;
    draw_set_color(c_lime);
    draw_rectangle(barra_x1, barra_y1, barra_x1 + (ancho_barra * porcentaje), barra_y2, false);
}