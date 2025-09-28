extends Node

@onready var list_container: VBoxContainer = $VBoxContainer

func show_dinos():
	# clear old buttons
	for c in list_container.get_children():
		c.queue_free()

	# add a button for each dino in the game list
	for dino in get_tree().get_nodes_in_group("baby_dinos"):
		var b = Button.new()
		b.text = dino.dino_name
		b.pressed.connect(func():
			_on_dino_chosen(dino))
		list_container.add_child(b)

func _on_dino_chosen(dino):
	print("Chosen:", dino.dino_name)

	# remove from global list
	Game.dino_names.erase(dino.dino_name)

	# remove the dino node
	dino.queue_free()

	# refresh UI
	show_dinos()
