// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_styled_text(
	text,
	color = c_white,
	positionX = 0,
	positionY = 0,
	isCentered = true,
	hasShadow = true,
	hasOutline = false,
	fontAsset = fDefault,
){	
	draw_set_font(fontAsset)
	draw_set_color(color)

	if (isCentered) {
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
	}
	
	if (hasShadow) {
		draw_set_color(c_black)
		draw_text_transformed(positionX - 2, positionY + 2, text, uiScale, uiScale, 0)
		draw_set_color(c_white)
	}
	
	if (hasOutline) {
		draw_set_color(c_black)
		draw_text_transformed(positionX - 1, positionY + 1, text, uiScale, uiScale, 0)
		draw_text_transformed(positionX + 1, positionY - 1, text, uiScale, uiScale, 0)
		draw_text_transformed(positionX - 1, positionY - 1, text, uiScale, uiScale, 0)
		draw_text_transformed(positionX + 1, positionY + 1, text, uiScale, uiScale, 0)
		draw_set_color(c_white)
	}

	draw_text_transformed(positionX, positionY, text, uiScale, uiScale, 0);

	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_color(c_white)
	draw_set_font(fDefault)
}
