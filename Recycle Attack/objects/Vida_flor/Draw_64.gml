// Asegurar que la interfaz mida 1366x768
display_set_gui_size(1366, 768);

var barra_x1 = 25;
var barra_y1 = 25;
var ancho_barra = 220;
var alto_barra = 22;

var barra_x2 = barra_x1 + ancho_barra;
var barra_y2 = barra_y1 + alto_barra;

// 1. Barra de vida (arriba a la izquierda)
draw_set_color(c_black);
draw_rectangle(barra_x1 - 3, barra_y1 - 3, barra_x2 + 3, barra_y2 + 3, false);

draw_set_color(c_dkgray);
draw_rectangle(barra_x1, barra_y1, barra_x2, barra_y2, false);

var porcentaje = clamp(vida / vida_max, 0, 1);
draw_set_color(c_lime);
draw_rectangle(barra_x1, barra_y1, barra_x1 + (ancho_barra * porcentaje), barra_y2, false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(barra_x1 + 8, barra_y1 + 2, "Flor: " + string(floor(vida)) + " / " + string(vida_max));

// 2. Reloj de 45 segundos (arriba al centro con estilo del tutorial)
var seg = ceil(tiempo_restante / 60);
var cx_gui = 1366 / 2;

draw_set_color(make_color_rgb(20, 28, 40));
draw_roundrect(cx_gui - 90, 15, cx_gui + 90, 55, false);

draw_set_color(make_color_rgb(70, 190, 255));
draw_roundrect(cx_gui - 90, 15, cx_gui + 90, 55, true);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// Si quedan 10 segundos o menos, el número se pone rojo de alerta
if (seg <= 10) {
    draw_set_color(make_color_rgb(255, 80, 80));
} else {
    draw_set_color(make_color_rgb(255, 215, 70));
}
draw_text_transformed(cx_gui, 35, "TIEMPO: " + string(seg) + "s", 1.3, 1.3, 0);

// Restaurar alineación
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
