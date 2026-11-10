parpadeo += 0.08;

// Presionar ENTER para reintentar directamente el nivel (Room2)
if (keyboard_check_pressed(vk_enter)) {
    room_goto(Room2);
}