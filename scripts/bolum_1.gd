extends Node2D

@export var scroll_speed: float = 80.0  # Piksel/saniye

var bg1: Sprite2D
var bg2: Sprite2D
var bg_width: float

var g1: Sprite2D
var g2: Sprite2D

func _ready():
	bg1 = $"Bg03-hd"
	bg2 = $"Bg03-hd2"	
	g1 = $"Ground"
	g2 = $"Ground2"
	
	doit(bg1,80)
	doit(bg2,80)
	doit(g1,100)
	doit(g2,100)

#func _process(delta):
	#bg1.position.x -= scroll_speed * delta
	#bg2.position.x -= scroll_speed * delta
#
	#g1.position.x -= scroll_speed * delta *3
	#g2.position.x -= scroll_speed * delta *3
	#
	## Eğer bir arka plan tamamen ekranın soluna geçtiyse en sağa taşı
	#if bg1.position.x <= -600:
		#bg1.position.x = bg2.position.x + 1170
	#elif bg2.position.x <= -600:
		#bg2.position.x = bg1.position.x + 1170
#
	## Eğer bir arka plan tamamen ekranın soluna geçtiyse en sağa taşı
	#if g1.position.x <= -600:
		#g1.position.x = g2.position.x + 1170
	#elif g2.position.x <= -600:
		#g2.position.x = g1.position.x + 1170


func doit(nesne: Sprite2D, hiz:int):
	
	while true:
		nesne.position.x += hiz
		if nesne.position.x <= -600:
			nesne.position.x = 1800

	
