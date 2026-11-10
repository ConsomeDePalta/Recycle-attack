parpadeo += 0.08;

// Presionar ENTER para volver a jugar o ir al inicio (Room1)
if (keyboard_check_pressed(vk_enter)) {
    room_goto(Room1);
}