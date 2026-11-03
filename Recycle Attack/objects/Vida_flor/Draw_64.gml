var barra_x1 = 25;
var barra_y1 = 25;
var ancho_barra = 220;
var alto_barra = 22;

var barra_x2 = barra_x1 + ancho_barra;
var barra_y2 = barra_y1 + alto_barra;

// 1. Borde negro
draw_set_color(c_black);
draw_rectangle(barra_x1 - 3, barra_y1 - 3, barra_x2 + 3, barra_y2 + 3, false);

// 2. Fondo gris oscuro
draw_set_color(c_dkgray);
draw_rectangle(barra_x1, barra_y1, barra_x2, barra_y2, false);

// 3. Barra verde proporcional a la vida
var porcentaje = clamp(vida / vida_max, 0, 1);
draw_set_color(c_lime);
draw_rectangle(barra_x1, barra_y1, barra_x1 + (ancho_barra * porcentaje), barra_y2, false);

// 4. Texto numérico (usando floor para mostrar siempre números enteros)
draw_set_color(c_white);
draw_text(barra_x1 + 8, barra_y1 + 2, "Flor: " + string(floor(vida)) + " / " + string(vida_max));