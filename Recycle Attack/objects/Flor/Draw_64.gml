// Evento DRAW GUI en Flor

// Posición fija arriba a la izquierda de la pantalla
var barra_x1 = 25;
var barra_y1 = 25;
var ancho_barra = 220;
var alto_barra = 22;

var barra_x2 = barra_x1 + ancho_barra;
var barra_y2 = barra_y1 + alto_barra;

// 1. Fondo negro (borde)
draw_set_color(c_black);
draw_rectangle(barra_x1 - 3, barra_y1 - 3, barra_x2 + 3, barra_y2 + 3, false);

// 2. Fondo gris oscuro (vida vacía)
draw_set_color(c_dkgray);
draw_rectangle(barra_x1, barra_y1, barra_x2, barra_y2, false);

// 3. Relleno verde proporcional a la vida (0 a 100)
var porcentaje = clamp(vida / vida_max, 0, 1);
draw_set_color(c_lime);
draw_rectangle(barra_x1, barra_y1, barra_x1 + (ancho_barra * porcentaje), barra_y2, false);

// 4. Texto numérico encima para ver el valor exacto
draw_set_color(c_white);
draw_text(barra_x1 + 8, barra_y1 + 2, "Flor: " + string(vida) + " / " + string(vida_max));