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
	
	

func _process(delta):
	bg1.position.x -= scroll_speed * delta
	bg2.position.x -= scroll_speed * delta

	g1.position.x -= scroll_speed * delta *5
	g2.position.x -= scroll_speed * delta *5
	
	doit(bg1)
	doit(bg2)
	doit(g1)
	doit(g2)
	
func doit(nesne: Sprite2D):
	
	if nesne.position.x <= -600:
		nesne.position.x = 1800

	
