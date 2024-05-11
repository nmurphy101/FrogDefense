function draw_surface_tint(
	surface,
	color = c_black,
	outline = false,
	alpha = 0.5,
	positionX = 0,
	positionY = 0,
	width = room_width,
	height = room_height,
){
	draw_surface(surface, positionX, positionY);
    draw_set_alpha(alpha);
    draw_rectangle_colour(positionX, positionY, room_width, room_height, color, color, color, color, outline);
    draw_set_alpha(1);
}
