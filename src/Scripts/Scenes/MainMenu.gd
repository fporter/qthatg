extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var focused_once = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/CenterContainer/PanelContainer/VBoxContainer/Quit.connect("button_up", self, "on_quit")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		get_tree().quit()
	if(event.is_action_pressed("ui_down") and !focused_once):
		$MarginContainer/CenterContainer/PanelContainer/VBoxContainer/Quit.grab_focus()
		focused_once = true
		
func on_quit():
	get_tree().quit()
