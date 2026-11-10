var x1 = 283;
var y1 = 190;
var x2 = 1083;
var y2 = 570;
var cx = (x1 + x2) / 2;

var col_fondo     = make_color_rgb(18, 38, 28);   // Verde bosque oscuro
var col_borde_ext = make_color_rgb(80, 235, 130); // Verde esmeralda brillante
var col_borde_int = make_color_rgb(40, 120, 75);  // Verde medio
var col_amarillo  = make_color_rgb(255, 215, 70); // Dorado

// 1. Sombra y fondo
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_roundrect(x1 + 8, y1 + 8, x2 + 8, y2 + 8, false);

draw_set_alpha(0.94);
draw_set_color(col_fondo);
draw_roundrect(x1, y1, x2, y2, false);
draw_set_alpha(1);

// 2. Bordes dobles y esquinas doradas
draw_set_color(col_borde_ext);
draw_roundrect(x1, y1, x2, y2, true);
draw_roundrect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, true);

draw_set_color(col_borde_int);
draw_roundrect(x1 + 6, y1 + 6, x2 - 6, y2 - 6, true);

draw_set_color(col_amarillo);
draw_rectangle(x1 + 10, y1 + 10, x1 + 22, y1 + 22, false);
draw_rectangle(x2 - 22, y1 + 10, x2 - 10, y1 + 22, false);
draw_rectangle(x1 + 10, y2 - 22, x1 + 22, y2 - 10, false);
draw_rectangle(x2 - 22, y2 - 22, x2 - 10, y2 - 10, false);

// 3. Textos centrales
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(col_amarillo);
draw_text_transformed(cx, y1 + 55, "- ¡VICTORIA! -", 2.2, 2.2, 0);

draw_set_color(col_borde_ext);
draw_line_width(x1 + 80, y1 + 95, x2 - 80, y1 + 95, 2);

draw_set_color(c_white);
draw_text_transformed(cx, y1 + 155, "¡Has defendido el jardin durante los 45 segundos!", 1.2, 1.2, 0);

draw_set_color(c_lime);
draw_text(cx, y1 + 215, "Las flores estan a salvo y libres de humo.");

// 4. Botón parpadeante inferior
var alpha_enter = 0.6 + sin(parpadeo) * 0.4;
draw_set_alpha(alpha_enter);
draw_set_color(col_amarillo);
draw_roundrect(cx - 230, y2 - 65, cx + 230, y2 - 25, true);
draw_text_transformed(cx, y2 - 45, "Presiona [ ENTER ] para volver al inicio", 1.1, 1.1, 0);

// 5. Restaurar valores
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);