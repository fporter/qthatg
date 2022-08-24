extends Node2D


# Declare member variables here.
onready var quit_button = get_node("Panel/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/QuitBtn")


# Called when the node enters the scene tree for the first time.
func _ready():
	quit_button.connect("button_up", self, "on_quit")
	$Panel/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/PlayBtn.grab_focus()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		get_tree().quit()
		
func on_quit():
	get_tree().quit()
