extends Control


# Declare member variables here.
onready var quit_button = get_node("Panel/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/QuitBtn")
# for development only, use test sizes
var projectResolution=Vector2(ProjectSettings.get_setting("display/window/size/test_width"),ProjectSettings.get_setting("display/window/size/test_height"))
var loadedPck

func _init():
	
	var targetWidth
	if OS.has_feature("standalone"):
		targetWidth = OS.get_screen_size()[0]
	else:
		targetWidth = ProjectSettings.get_setting("display/window/size/test_width")
	
	var availableResolutions = [1280,1920,3840]
	var selectedWidth = 99999
	for width in availableResolutions:
		if width >= targetWidth:
			selectedWidth = width
			break
			
	loadedPck = ProjectSettings.load_resource_pack("res://res/" + str(selectedWidth) + ".pck")
	
	# we can change settings and reload the scene to change asset pcks
	#ProjectSettings.set_setting("display/window/size/test_width",1280)
	#ProjectSettings.set_setting("display/window/size/test_height",720)
	#get_tree().reload_current_scene()
	
	print("Selected width: " + str(selectedWidth))

# Called when the node enters the scene tree for the first time.
func _ready():
	if loadedPck:
		# we must use ResourceLoader to pass 'true' to the no-cache option
		$Panel.get_stylebox("panel","").set_texture(ResourceLoader.load("res://assets/bgs/MainScreen.png", "", true))
		print("should use new image")
	quit_button.connect("button_up", self, "on_quit")
	$Panel/MarginContainer/CenterContainer/PanelContainer/VBoxContainer/PlayBtn.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if(event.is_action_pressed("ui_cancel")):
		on_quit()
		
func on_quit():
	get_tree().quit()
