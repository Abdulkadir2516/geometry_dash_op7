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
	
	for child in $".".get_children():
		if child.name.begins_with("engel"):
			engel_sayisi+=1
			
		if child.name.begins_with("sivri_engel"):
			sivri_engel_sayisi+=1
		
		if child.name.begins_with("cukur_engel"):
			cukur_engel_sayisi+=1
			
	print(engel_sayisi)
	print(sivri_engel_sayisi)
	print(cukur_engel_sayisi)

	
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
	
	for i in range(1,engel_sayisi + 1):
		if get_node("engel"+str(i)) != null:
			doit2(get_node("engel"+str(i)), 3)
		
	#doit2(get_node("engel"), 4)
	for i in range(1,cukur_engel_sayisi + 1):
		karakterc = get_node("cukur_engel"+str(i))
		if karakterc != null:
			doit2(karakterc, 3)
			
	for i in range(1,sivri_engel_sayisi+1):
		karakteri = get_node("sivri_engel"+str(i))
		if karakteri != null:
			doit2(karakteri, 3)
		
			if 23<i and i<32 and karakteri.position.x < 450:
				doit3(karakteri, 3)
				await get_tree().create_timer(.15).timeout

			
			
	if get_node("sivri_engel22") != null and get_node("sivri_engel22").position.x < 500:
		get_node("sivri_engel22").visible=true
		get_node("sivri_engel23").visible=true


	
func doit(nesne: Sprite2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		nesne.position.x = 1800
		
func doit2(nesne: CharacterBody2D, hiz: float):
	nesne.position.x -= hiz
	if nesne.position.x <= -600:
		#nesne.position.x = 2800
		remove_child(nesne)
		#nesne.visible = false
			
func doit3(nesne: CharacterBody2D, hiz: float):
	nesne.position.y += hiz
	if nesne.position.y > 1200:
		#nesne.position.x = 2800
		remove_child(nesne)
		#nesne.visible = false
