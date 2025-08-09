extends Control

@onready var progress_bar = $ProgressBar
var frame_number = 0
func _ready():
	Ortak.music = true
	$Sprite2D.frame
	frame_number = $back/Player.get_node("AnimatedSprite2D").frame
	$Sprite2D.visible=true
	progress_bar.visible=true
	$back.visible = false
	$back/Player.get_node("CPUParticles2D").emitting = false
	
	Ortak.frame = frame_number
	
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


func _on_color_picker_button_color_changed(color: Color) -> void:
	$back/Player.get_node("ColorRect").color = $back/ColorPickerButton.color
	Ortak.color = $back/ColorPickerButton.color


func _on_music_on_off_pressed() -> void:
	
	if $back/AnimatedSprite2D.frame == 0:
		$back/AnimatedSprite2D.frame = 1
		Ortak.music = false
	else:
		$back/AnimatedSprite2D.frame = 0
		Ortak.music = true
	


func _on_h_slider_value_changed(value: float) -> void:
	
	Ortak.volume = int($back/HSlider.value)
