extends Node2D

var bg_width: float
var engel: CharacterBody2D
var engel_isimleri: Array

func _ready() -> void:
	_bolum1_hazırlık()

func _process(delta):
	doit($"Bg03-hd", 2)
	doit($"Bg03-hd2", 2)
	doit($"Ground", 5)
	doit($"Ground2", 5)
	doit(get_node("engel1").get_node("sprite"), 5)
	
func doit(nesne: Sprite2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800

func _bolum1_hazırlık():
	for i in range(1,41):
		engel = $engel.duplicate()
		engel.name = "engel" + str(i)
		engel.position = Vector2(i*600,520)
		engel.visible = false
		add_child(engel)
	
	$engel1.visible=true
	$engel1.get_node("sprite").visible=true
	$engel1.get_node("sprite2").visible=false
	$engel1.get_node("sprite2").set_frame(3)
