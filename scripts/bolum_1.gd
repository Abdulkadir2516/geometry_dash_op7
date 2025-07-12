extends Node2D


var bg_width: float

func _process(delta):
	doit($"Bg03-hd", 2)
	doit($"Bg03-hd2", 2)
	doit($"Ground", 7)
	doit($"Ground2", 7)
	
func doit(nesne: Sprite2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800
