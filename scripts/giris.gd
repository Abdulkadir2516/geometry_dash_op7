extends Control

@onready var progress_bar = $ProgressBar
var frame_number = 0
func _ready():
	frame_number = $back/Player.get_node("AnimatedSprite2D").frame
	$Sprite2D.visible=true
	progress_bar.visible=true
	$back.visible = false
	$back/Player.get_node("CPUParticles2D").emitting = false
	
	for i in range(20):
		progress_bar.value += 5
		await get_tree().create_timer(0.1).timeout
		
	$Sprite2D.visible=false
	progress_bar.visible=false
	
	$back.visible=true


func _on_button_pressed() -> void:
	$back/Player.get_node("AnimatedSprite2D").frame += 1 
	if frame_number < 46:
		frame_number +=1
		Ortak.frame = frame_number


func _on_button_2_pressed() -> void:
	$back/Player.get_node("AnimatedSprite2D").frame -= 1
	if frame_number > 0:
		frame_number -=1
		Ortak.frame = frame_number


func _on_baslat_pressed() -> void:
	get_tree().change_scene_to_file("res://sahneler/Bolum_1.tscn")
