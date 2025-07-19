extends Node2D

var bg_width: float
var engel: CharacterBody2D
var engel_isimleri: Array

func _ready() -> void:
	for i in range(1,5):
		engel = $engel.duplicate()
		engel.name = "engel" + str(i)
		engel.position = Vector2(i*500,520)
		engel.visible = true
		add_child(engel)

func _process(delta):
	doit($"Bg03-hd", 2)
	doit($"Bg03-hd2", 2)
	doit($"Ground", 5)
	doit($"Ground2", 5)
	
	for i in range(1,5):
		doit2(get_node("engel"+str(i)), 4)
	
func doit(nesne: Sprite2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800
		
func doit2(nesne: CharacterBody2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800
