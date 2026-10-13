var izq = keyboard_check(ord("A"));
var der = keyboard_check(ord("D"));

spray = instance_create_layer(x, y, "Instances", Spray);

spray.depth = -1;



if (der) {

   spray.x = x + 23;
	spray.y = y - 5;

}else if (izq){

	spray.x = x - 23;
	spray.y = y - 5;
}