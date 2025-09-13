extends Node2D

var bg_width: float
var engel: CharacterBody2D
var engel_isimleri: Array
var karakterc
var karakteri
var engel_sayisi =0
var sivri_engel_sayisi =0
var cukur_engel_sayisi =0

	

func _ready() -> void:
			
	get_node("sivri_engel22").visible=false
	get_node("sivri_engel23").visible=false
	
	if Ortak.music:
		$AudioStreamPlayer.volume_db = Ortak.volume
		$AudioStreamPlayer.play()
		
	
	$Player.get_node("AnimatedSprite2D").frame = Ortak.frame
	$Player.get_node("ColorRect").color = Ortak.color

	#for i in range(1,16):
		#engel = $engel.duplicate()
		#engel.name = "engel" + str(i)
		#engel.position = Vector2(1200+ i*80,520)
		#engel.visible = true
		#add_child(engel)

func _process(delta):
	doit($"Bg03-hd", 2)
	doit($"Bg03-hd2", 2)
	doit($"Ground", 5)
	doit($"Ground2", 5)
	
	for child in $".".get_children():
		
		if child != null:
			var kosul = child.name.begins_with("engel") or child.name.begins_with("sivri_engel") or child.name.begins_with("cukur_engel")
			
			if kosul:
				doit2(child, 3)
				
			for i in range(24,32):
				if child.name == str("sivri_engel",i) and child.position.x < 450:
					doit3(child, 3)
					
				
			if (child.name == "sivri_engel22" or child.name == "sivri_engel23") and child.position.x < 500:
				child.visible=true
				child.visible=true


	
func doit(nesne: Sprite2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800
		
func doit2(nesne: CharacterBody2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600 and nesne !=null:
		#nesne.position.x = 2800
		remove_child(nesne)
		#nesne.visible = false
			
func doit3(nesne: CharacterBody2D, hiz: float):
	nesne.position.y += hiz
	if nesne.position.y > 1200:
		#nesne.position.x = 2800
		remove_child(nesne)
		#nesne.visible = false
