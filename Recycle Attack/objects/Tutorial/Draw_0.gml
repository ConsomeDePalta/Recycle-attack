// Evento DRAW en Tutorial

// Subimos todo el cuadro 160 píxeles (antes era 930 a 1300) para que quede arriba de Pibe
var x1 = 800;
var y1 = 770;
var x2 = 1600;
var y2 = 1140;
var cx = (x1 + x2) / 2;

var col_fondo      = make_color_rgb(20, 28, 40);
var col_borde_ext  = make_color_rgb(70, 190, 255);
var col_borde_int  = make_color_rgb(40, 90, 140);
var col_tecla_bg   = make_color_rgb(45, 58, 78);
var col_amarillo   = make_color_rgb(255, 215, 70);

// --- 1. SOMBRA Y FONDO DEL PANEL ---
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_roundrect(x1 + 8, y1 + 8, x2 + 8, y2 + 8, false);

draw_set_alpha(0.92);
draw_set_color(col_fondo);
draw_roundrect(x1, y1, x2, y2, false);
draw_set_alpha(1);

// --- 2. BORDES DECORADOS Y ESQUINAS ---
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

// --- 3. TÍTULO PRINCIPAL ---
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(col_amarillo);
draw_text_transformed(cx, y1 + 35, "- CONTROLES E INSTRUCCIONES -", 1.5, 1.5, 0);

draw_set_color(col_borde_ext);
draw_line_width(x1 + 60, y1 + 62, x2 - 60, y1 + 62, 2);

// --- 4. LISTA DE TECLAS (2 COLUMNAS) ---
var col_izq_x = x1 + 50;
var col_der_x = cx + 20;
var fila_1_y  = y1 + 105;
var fila_2_y  = y1 + 170;
var fila_3_y  = y1 + 235;

// --- COLUMNA IZQUIERDA (MOVIMIENTO) ---
draw_set_color(col_tecla_bg);
draw_roundrect(col_izq_x, fila_1_y - 20, col_izq_x + 95, fila_1_y + 20, false);
draw_set_color(col_borde_ext);
draw_roundrect(col_izq_x, fila_1_y - 20, col_izq_x + 95, fila_1_y + 20, true);
draw_set_color(c_white);
draw_text(col_izq_x + 47, fila_1_y, "A / D");

draw_set_color(col_tecla_bg);
draw_roundrect(col_izq_x, fila_2_y - 20, col_izq_x + 95, fila_2_y + 20, false);
draw_set_color(col_borde_ext);
draw_roundrect(col_izq_x, fila_2_y - 20, col_izq_x + 95, fila_2_y + 20, true);
draw_set_color(c_white);
draw_text(col_izq_x + 47, fila_2_y, "ESPACIO");

draw_set_color(col_tecla_bg);
draw_roundrect(col_izq_x, fila_3_y - 20, col_izq_x + 95, fila_3_y + 20, false);
draw_set_color(col_borde_ext);
draw_roundrect(col_izq_x, fila_3_y - 20, col_izq_x + 95, fila_3_y + 20, true);
draw_set_color(c_white);
draw_text(col_izq_x + 47, fila_3_y, "SHIFT");

draw_set_halign(fa_left);
draw_set_color(c_ltgray);
draw_text(col_izq_x + 110, fila_1_y, "Moverse (Izq. / Der.)");
draw_text(col_izq_x + 110, fila_2_y, "Saltar");
draw_text(col_izq_x + 110, fila_3_y, "Correr / Esprintar");

// --- COLUMNA DERECHA (ACCIONES DEL ROCIADOR) ---
draw_set_halign(fa_center);

draw_set_color(col_tecla_bg);
draw_roundrect(col_der_x, fila_1_y - 20, col_der_x + 95, fila_1_y + 20, false);
draw_set_color(col_borde_ext);
draw_roundrect(col_der_x, fila_1_y - 20, col_der_x + 95, fila_1_y + 20, true);
draw_set_color(c_white);
draw_text(col_der_x + 47, fila_1_y, "ARRIBA");

draw_set_color(col_tecla_bg);
draw_roundrect(col_der_x, fila_2_y - 20, col_der_x + 95, fila_2_y + 20, false);
draw_set_color(col_borde_ext);
draw_roundrect(col_der_x, fila_2_y - 20, col_der_x + 95, fila_2_y + 20, true);
draw_set_color(c_white);
draw_text(col_der_x + 47, fila_2_y, "R");

draw_set_halign(fa_left);
draw_set_color(c_ltgray);
draw_text(col_der_x + 110, fila_1_y, "Disparar rociador");
draw_text(col_der_x + 110, fila_2_y, "Recargar agua (en fuente)");

// Texto verde en 2 líneas para que entre holgadamente dentro del recuadro
draw_set_color(c_lime);
draw_text_ext(col_der_x, fila_3_y, "Mision: ¡Apaga los cigarros\ny cuida las flores!", 20, 340);

// --- 5. BOTÓN PARPADEANTE PARA AVANZAR A ROOM2 ---
draw_set_halign(fa_center);
var alpha_enter = 0.6 + sin(parpadeo) * 0.4;
draw_set_alpha(alpha_enter);

draw_set_color(col_amarillo);
draw_roundrect(cx - 210, y2 - 55, cx + 210, y2 - 18, true);
draw_text_transformed(cx, y2 - 36, "Presiona [ ENTER ] para comenzar", 1.2, 1.2, 0);

// --- 6. RESTAURAR VALORES DE DIBUJO POR DEFECTO ---
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);